import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as httpx;
import 'package:karotator/api/exceptions.dart';
import 'package:karotator/api/session/session.dart';
import 'package:karotator/objects/response.dart';
import 'package:karotator/utils.dart';

/// karotator が名乗るクライアント種別。
///
/// 非公式であることを隠さない。Karotter 側が識別できるようにしておく。
const clientType = 'unofficial_app';

/// specs/api/conventions.md §1
const _baseUrl = 'https://api.karotter.com/api/';
const _timeout = Duration(seconds: 15);

/// リフレッシュや再送の対象外にするエンドポイント (conventions.md §6)。
///
/// これらに `x-active-account-id` は付けないし、401 でリフレッシュもしない。
/// リフレッシュ自身が 401 を返したときに無限再帰するのを防ぐ。
const _authPaths = {
  'auth/login',
  'auth/register',
  'auth/me',
  'auth/csrf-token',
  'auth/refresh',
  'auth/refresh-token',
  'auth/switch-session',
  'auth/logout',
};

/// リフレッシュに失敗してから次を試みるまでの間隔 (REQ-API-020)。
const _refreshCooldown = Duration(seconds: 15);

/// `409 REFRESH_RETRY` を受けてから再送するまでの待ち時間 (REQ-API-018)。
const _refreshRetryDelay = Duration(milliseconds: 350);

/// multipart で送るファイル 1 個。
class KarotterFile {
  const KarotterFile({
    required this.field,
    required this.filename,
    required this.bytes,
    required this.mimeType,
  });

  /// [File] から作る。MIME は拡張子から推測する。
  static Future<KarotterFile> read(File file, {String field = 'media'}) async {
    return KarotterFile(
      field: field,
      filename: file.path.split(Platform.pathSeparator).last,
      bytes: await file.readAsBytes(),
      mimeType: getMimeType(file.path),
    );
  }

  final String field;
  final String filename;
  final Uint8List bytes;
  final String mimeType;

  httpx.MultipartFile toMultipartFile() => httpx.MultipartFile.fromBytes(
    field,
    bytes,
    filename: filename,
    contentType: httpx.MediaType.parse(mimeType),
  );
}

/// パース済みのレスポンス。
class KarotterResponse {
  const KarotterResponse(this.statusCode, this.json, this.text);

  final int statusCode;

  /// JSON オブジェクトとして読めたボディ。読めなければ空。
  final Map<String, Object?> json;

  /// 生のボディ。`/legal/*` のように `text/plain` を返すものがある。
  final String text;

  /// [key] の配列要素を [parse] で変換して返す。無ければ空リスト。
  List<T> list<T>(String key, T Function(Map<String, Object?>) parse) {
    final raw = json[key];
    if (raw is! List) return const [];
    return [
      for (final e in raw)
        if (e is Map<String, Object?>) parse(e),
    ];
  }

  /// [key] のオブジェクトを [parse] で変換して返す。
  T object<T>(String key, T Function(Map<String, Object?>) parse) {
    final raw = json[key];
    if (raw is! Map<String, Object?>) {
      throw KarotterClientException(
        statusCode,
        '応答に "$key" が含まれていない',
        body: json,
      );
    }
    return parse(raw);
  }
}

/// Karotter API への唯一の送信経路 (REQ-API-002)。
///
/// エンドポイントのことは知らない。ヘッダの組み立て、CSRF の回収、
/// 401 でのリフレッシュと再送だけを担当する。
class KarotterHttpClient {
  KarotterHttpClient({required this.session, httpx.Client? inner})
    : _http = inner ?? httpx.Client();

  final KarotterSession session;
  final httpx.Client _http;

  /// 進行中のリフレッシュ。2 人目以降はこれを await する (REQ-API-021)。
  Future<void>? _refreshing;

  /// 最後にリフレッシュが失敗した時刻 (REQ-API-020)。
  DateTime? _refreshFailedAt;

  Future<KarotterResponse> get(String path, {Map<String, Object?>? query}) =>
      send('GET', path, query: query);

  Future<KarotterResponse> post(
    String path, {
    Map<String, Object?>? query,
    Object? json,
    Map<String, String>? fields,
    List<KarotterFile>? files,
  }) => send(
    'POST',
    path,
    query: query,
    json: json,
    fields: fields,
    files: files,
  );

  Future<KarotterResponse> put(String path, {Object? json}) =>
      send('PUT', path, json: json);

  Future<KarotterResponse> patch(
    String path, {
    Map<String, Object?>? query,
    Object? json,
  }) => send('PATCH', path, query: query, json: json);

  Future<KarotterResponse> delete(String path, {Object? json}) =>
      send('DELETE', path, json: json);

  /// 全てのリクエストはここを通る。
  ///
  /// [json] と [files] / [fields] は排他。[files] か [fields] があれば
  /// `multipart/form-data` として送る (REQ-API-009)。
  Future<KarotterResponse> send(
    String method,
    String path, {
    Map<String, Object?>? query,
    Object? json,
    Map<String, String>? fields,
    List<KarotterFile>? files,
    Map<String, String>? headers,
  }) {
    assert(
      json == null || (fields == null && files == null),
      'JSON と multipart は同時に送れない',
    );
    return _attempt(
      method,
      path,
      query: query,
      json: json,
      fields: fields,
      files: files,
      headers: headers,
    );
  }

  Future<KarotterResponse> _attempt(
    String method,
    String path, {
    Map<String, Object?>? query,
    Object? json,
    Map<String, String>? fields,
    List<KarotterFile>? files,
    Map<String, String>? headers,
    bool retriedAuth = false,
    bool retriedCsrf = false,
  }) async {
    final uri = _uri(path, query);
    final isMultipart = files != null || fields != null;
    final built = await _headers(
      path,
      extra: headers,
      json: json != null,
      multipart: isMultipart,
    );

    final response = isMultipart
        ? await _sendMultipart(method, uri, built, fields, files)
        : await _sendPlain(method, uri, built, json);

    final body = _decode(response.bodyBytes);
    _log(method, uri, built, response.statusCode, body);

    await session.mergeSetCookies(
      response.headersSplitValues['set-cookie'] ?? const [],
    );
    // 任意のレスポンスが最新の CSRF トークンを運んでくる (REQ-API-010)。
    session.csrf.remember(body['csrfToken'] as String?);

    final text = _decodeText(response.bodyBytes);
    final status = response.statusCode;
    if (status < 400) return KarotterResponse(status, body, text);

    final code = body['code'] as String?;
    final message = body['error'] as String? ?? text;

    // 401: リフレッシュして 1 回だけ再送する (REQ-API-012)。
    if (status == 401 && !retriedAuth && !_isAuthPath(path)) {
      await _refresh();
      return _attempt(
        method,
        path,
        query: query,
        json: json,
        fields: fields,
        files: files,
        headers: headers,
        retriedAuth: true,
        retriedCsrf: retriedCsrf,
      );
    }

    if (status == 403) {
      // BAN (REQ-API-014)。トークンを捨てて再ログインさせる。
      if (code == 'ACCOUNT_BANNED') {
        await session.signOut();
        throw KarotterBannedException(
          status,
          message,
          code: code,
          body: body,
          bannedUntil: body['bannedUntil'] as String?,
          banReason: body['banReason'] as String?,
        );
      }

      // 生年月日未設定 (REQ-API-015)。
      if (code == 'BIRTHDAY_REQUIRED') {
        throw KarotterBirthdayRequiredException(
          status,
          message,
          code: code,
          body: body,
        );
      }

      // CSRF 不一致。取り直して 1 回だけ再送する (REQ-API-013)。
      if (!retriedCsrf && message.contains('CSRF')) {
        await fetchCsrfToken();
        return _attempt(
          method,
          path,
          query: query,
          json: json,
          fields: fields,
          files: files,
          headers: headers,
          retriedAuth: retriedAuth,
          retriedCsrf: true,
        );
      }
    }

    // REQ-API-016
    throw status < 500
        ? KarotterClientException(status, message, code: code, body: body)
        : KarotterServerException(status, message, code: code, body: body);
  }

  Future<httpx.Response> _sendPlain(
    String method,
    Uri uri,
    Map<String, String> headers,
    Object? json,
  ) {
    final request = httpx.Request(method, uri)..headers.addAll(headers);
    if (json != null) request.body = jsonEncode(json);
    return _finish(request);
  }

  Future<httpx.Response> _sendMultipart(
    String method,
    Uri uri,
    Map<String, String> headers,
    Map<String, String>? fields,
    List<KarotterFile>? files,
  ) {
    final request = httpx.MultipartRequest(method, uri)
      ..headers.addAll(headers)
      ..fields.addAll(fields ?? const {});
    for (final file in files ?? const <KarotterFile>[]) {
      request.files.add(file.toMultipartFile());
    }
    return _finish(request);
  }

  Future<httpx.Response> _finish(httpx.BaseRequest request) async {
    final streamed = await _http.send(request).timeout(_timeout);
    return httpx.Response.fromStream(streamed);
  }

  Uri _uri(String path, Map<String, Object?>? query) {
    final uri = Uri.parse('$_baseUrl$path');
    if (query == null || query.isEmpty) return uri;

    // null は「指定なし」。クエリごと落とす。
    final params = <String, String>{
      ...uri.queryParameters,
      for (final e in query.entries)
        if (e.value != null) e.key: '${e.value}',
    };
    return uri.replace(queryParameters: params.isEmpty ? null : params);
  }

  /// REQ-API-005..007
  Future<Map<String, String>> _headers(
    String path, {
    Map<String, String>? extra,
    bool json = false,
    bool multipart = false,
  }) async {
    final headers = <String, String>{
      'x-client-type': clientType,
      'x-device-id': session.deviceId,
    };

    if (await session.cookieHeader() case final cookie?) {
      headers['Cookie'] = cookie;
    }
    if (await session.login() case final login?) {
      headers['Authorization'] = 'Bearer ${login.accessToken}';
    }
    if (await session.csrfHeader() case final csrf?) {
      headers['x-csrf-token'] = csrf;
    }
    // auth 系には付けない (conventions.md §6)。
    if (session.userId case final userId? when !_isAuthPath(path)) {
      headers['x-active-account-id'] = '$userId';
    }
    // multipart の Content-Type は境界文字列を含むので http に任せる。
    if (json && !multipart) {
      headers['Content-Type'] = 'application/json';
    }

    return headers..addAll(extra ?? const {});
  }

  bool _isAuthPath(String path) {
    final normalized = path.split('?').first;
    return _authPaths.any(normalized.startsWith);
  }

  /// `auth/csrf-token` を叩いて CSRF トークンを取り直す。
  ///
  /// 通常は [CsrfStore] がレスポンスから拾った値で足りる。これは
  /// 403 を食らったときのフォールバック (REQ-API-013)。
  Future<String?> fetchCsrfToken() async {
    try {
      final res = await _attempt('GET', 'auth/csrf-token');
      final token = res.json['csrfToken'] as String?;
      session.csrf.remember(token);
      return token;
    } on KarotterException catch (e) {
      debugPrint('CSRF トークンの取得に失敗: $e');
      return null;
    }
  }

  /// トークンをリフレッシュする (REQ-API-017..021)。
  ///
  /// [send] を経由しない。401 を受けてここに来るので、再入すると
  /// リフレッシュが 401 を返した瞬間に無限再帰する。
  Future<void> _refresh() {
    // 直前に失敗していれば、しばらく試さない (REQ-API-020)。
    if (_refreshFailedAt case final failedAt?) {
      if (DateTime.now().difference(failedAt) < _refreshCooldown) {
        throw const KarotterRefreshFailedException('リフレッシュのクールダウン中');
      }
    }
    // 進行中があれば相乗りする (REQ-API-021)。
    return _refreshing ??= _runRefresh().whenComplete(() {
      _refreshing = null;
    });
  }

  Future<void> _runRefresh() async {
    try {
      var response = await _postRefreshToken();

      // 409 REFRESH_RETRY は少し待てば通る (REQ-API-018)。
      if (response.statusCode == 409 &&
          _decode(response.bodyBytes)['code'] == 'REFRESH_RETRY') {
        await Future<void>.delayed(_refreshRetryDelay);
        response = await _postRefreshToken();
      }

      // 403 は CSRF が古い。取り直して 1 回だけ (REQ-API-019)。
      if (response.statusCode == 403) {
        await fetchCsrfToken();
        response = await _postRefreshToken();
      }

      final body = _decode(response.bodyBytes);
      _log('POST', Uri.parse('${_baseUrl}auth/refresh-token'), const {},
          response.statusCode, body);

      if (response.statusCode >= 400) {
        throw KarotterRefreshFailedException(
          '${response.statusCode} ${body['error'] ?? ''}',
        );
      }

      session.csrf.remember(body['csrfToken'] as String?);
      await session.mergeSetCookies(
        response.headersSplitValues['set-cookie'] ?? const [],
      );

      final accessToken = body['accessToken'] as String?;
      if (accessToken == null) {
        throw const KarotterRefreshFailedException(
          '応答に accessToken が含まれていない',
        );
      }
      // sessionId は返らないことがある。その場合は今の値を保つ。
      final current = await session.login();
      await session.applyRefresh(
        RefreshResponse(
          accessToken: accessToken,
          sessionId:
              body['sessionId'] as String? ?? current?.sessionId ?? '',
        ),
      );
      _refreshFailedAt = null;
    } catch (e) {
      _refreshFailedAt = DateTime.now();
      if (e is KarotterRefreshFailedException) rethrow;
      throw KarotterRefreshFailedException('$e');
    }
  }

  Future<httpx.Response> _postRefreshToken() async {
    final request =
        httpx.Request('POST', Uri.parse('${_baseUrl}auth/refresh-token'))
          ..headers.addAll(await _headers('auth/refresh-token', json: true))
          ..body = jsonEncode({
            'deviceId': session.deviceId,
            'clientType': clientType,
            'deviceName': deviceName,
          });
    return _finish(request);
  }

  Map<String, Object?> _decode(Uint8List bytes) {
    if (bytes.isEmpty) return const {};
    try {
      final decoded = jsonDecode(utf8.decode(bytes));
      return decoded is Map<String, Object?> ? decoded : const {};
    } on FormatException {
      return const {};
    }
  }

  String _decodeText(Uint8List bytes) {
    try {
      return utf8.decode(bytes);
    } on FormatException {
      return '';
    }
  }

  void _log(
    String method,
    Uri uri,
    Map<String, String> headers,
    int status,
    Map<String, Object?> body,
  ) {
    if (!kDebugMode) return;
    debugPrint('$method $uri -> $status');
    // Authorization と Cookie は出さない。
    debugPrint('  headers: ${headers.keys.toList()}');
    debugPrint('  body: $body');
  }

  void close() => _http.close();
}

/// ログイン / リフレッシュで Karotter に伝える端末名。
final deviceName = 'Karotator on ${Platform.operatingSystem}';
