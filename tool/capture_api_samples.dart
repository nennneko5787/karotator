// 実際の Karotter API を叩いて、レスポンスの形を観測する。
//
//   set KAROTTER_IDENTIFIER=...      (PowerShell: $env:KAROTTER_IDENTIFIER="...")
//   set KAROTTER_PASSWORD=...
//   dart run tool/capture_api_samples.dart
//
// なぜ要るか:
//   ミニファイされた JS からは**フィールド名は拾えても型が復元できない**。
//   `specs/api/schemas/` にある公式スキーマは Post / User / Poll / TimelineItem の
//   4 つだけで、DM や掲示板は載っていない。実物を 1 回見るのが確実で速い。
//
// 安全のための約束:
//   * **GET しか投げない。** 投稿・削除・フォローなど状態を変える操作は一切しない。
//   * 生のレスポンスは既定では書き出さない。`--raw <dir>` を付けたときだけ、
//     トークンとメールアドレス等を伏せた上で保存する。
//   * リポジトリに残るのは**フィールド名と型だけ**で、値は残らない。
//   * 資格情報は環境変数からのみ読む。引数にもファイルにも書かない。
//
// 出力:
//   specs/api/observed-schemas.md    人が読む形
//   specs/api/observed-schemas.json  機械可読

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'src/bundle.dart';
import 'src/schema.dart';

const _baseUrl = 'https://api.karotter.com/api';
const _clientType = 'unofficial_app';
const _timeout = Duration(seconds: 20);

/// 叩く先。`{...}` は [_Context] から埋める。埋まらなければ飛ばす。
///
/// 全て GET。ここに GET 以外を足さないこと。
const _probes = <(String label, String path)>[
  ('auth.me', 'auth/me'),
  ('posts.timeline', 'posts/timeline?page=1&limit=20&mode=following'),
  ('posts.recommended', 'posts/recommended?page=1&limit=20&mode=recommended'),
  ('posts.recommended.latest', 'posts/recommended?limit=20&mode=latest'),
  ('posts.byId', 'posts/{postId}'),
  ('posts.replies', 'posts/{postId}/replies?page=1&limit=20'),
  ('posts.replyTargets', 'posts/{postId}/reply-targets'),
  ('posts.bookmarks', 'posts/me/bookmarks?page=1&limit=20'),
  ('posts.scheduled', 'posts/scheduled/me'),
  ('users.byUsername', 'users/{username}'),
  ('users.posts', 'users/{userId}/posts?page=1&limit=20'),
  ('users.replies', 'users/{userId}/replies?page=1&limit=20'),
  ('users.media', 'users/{userId}/media?page=1&limit=20'),
  ('users.likes', 'users/{userId}/likes?page=1&limit=20'),
  ('users.recommended', 'users/recommended?limit=3'),
  ('social.circles', 'social/circles'),
  ('social.lists', 'social/lists'),
  ('boards.list', 'boards'),
  ('boards.following', 'boards/following'),
  ('boards.threads', 'boards/{boardSlug}'),
  ('boards.replies', 'boards/{boardSlug}/threads/{threadId}'),
  ('notifications.list', 'notifications?page=1&limit=20'),
  ('notifications.unreadCount', 'notifications/unread/count'),
  ('dm.groups', 'dm/groups?page=1&limit=30'),
  ('dm.group', 'dm/groups/{groupId}'),
  ('dm.messages', 'dm/groups/{groupId}/messages?page=1&limit=20'),
  ('dm.unreadCount', 'dm/unread/count'),
  ('search.users', 'search/users?q=a&limit=10'),
  ('search.hashtags', 'search/hashtags?q=a'),
  ('search.trending', 'search/trending/topics?limit=5'),
];

Future<void> main(List<String> args) async {
  final identifier = Platform.environment['KAROTTER_IDENTIFIER'];
  final password = Platform.environment['KAROTTER_PASSWORD'];
  final gender = Platform.environment['KAROTTER_GENDER'] ?? 'PRIVATE';

  if (identifier == null || password == null) {
    stderr
      ..writeln('環境変数 KAROTTER_IDENTIFIER と KAROTTER_PASSWORD が要る。')
      ..writeln()
      ..writeln('PowerShell:')
      ..writeln(r'  $env:KAROTTER_IDENTIFIER = "テスト用アカウント"')
      ..writeln(r'  $env:KAROTTER_PASSWORD   = "パスワード"')
      ..writeln('  dart run tool/capture_api_samples.dart')
      ..writeln()
      ..writeln('テスト用アカウントで実行すること。GET しか投げないが、')
      ..writeln('通知の既読やタイムラインの表示数には影響しうる。');
    exitCode = 2;
    return;
  }

  final outDir = Directory(option(args, '--out') ?? 'specs/api');
  final rawDir = option(args, '--raw');

  final client = _Client(HttpClient()..userAgent = userAgent);
  try {
    stderr.writeln('ログイン中…');
    await client.login(identifier: identifier, password: password, gender: gender);
    stderr.writeln('ログインした: @${client.context.username} (id=${client.context.userId})');

    final shapes = <String, Shape>{};
    final failures = <String, String>{};

    for (final (label, template) in _probes) {
      final path = client.context.fill(template);
      if (path == null) {
        failures[label] = 'この環境では埋められない値がある: $template';
        stderr.writeln('  skip $label');
        continue;
      }

      try {
        final body = await client.get(path);
        (shapes[label] ??= Shape()).observe(body);
        client.context.learnFrom(label, body);
        stderr.writeln('  ok   $label');

        if (rawDir != null) {
          final file = File('$rawDir/$label.json');
          await file.parent.create(recursive: true);
          await file.writeAsString('${prettyJson(redact(body))}\n');
        }
      } on _RequestFailure catch (e) {
        failures[label] = '${e.statusCode} ${e.message}';
        stderr.writeln('  fail $label — ${e.statusCode}');
      } on TimeoutException {
        failures[label] = 'タイムアウト';
        stderr.writeln('  fail $label — timeout');
      }
    }

    await outDir.create(recursive: true);
    await _writeJson(outDir, shapes, failures);
    await _writeMarkdown(outDir, shapes, failures);
    stderr
      ..writeln()
      ..writeln('観測できた: ${shapes.length} / ${_probes.length}')
      ..writeln('wrote ${outDir.path}/observed-schemas.md, observed-schemas.json');
    if (rawDir != null) {
      stderr.writeln('生レスポンス(秘匿値は伏せ済み): $rawDir');
    }
  } finally {
    client.close();
  }
}

// ---- 呼ぶ側 ----

class _RequestFailure implements Exception {
  _RequestFailure(this.statusCode, this.message);

  final int statusCode;
  final String message;
}

/// 後続のリクエストで使う ID をレスポンスから拾って覚えておく。
class _Context {
  int? userId;
  String? username;
  int? postId;
  String? boardSlug;
  int? threadId;
  int? groupId;

  /// テンプレートの `{...}` を埋める。埋まらないものがあれば null。
  String? fill(String template) {
    final values = <String, Object?>{
      'userId': userId,
      'username': username,
      'postId': postId,
      'boardSlug': boardSlug,
      'threadId': threadId,
      'groupId': groupId,
    };

    var result = template;
    for (final m in RegExp(r'\{(\w+)\}').allMatches(template)) {
      final value = values[m.group(1)];
      if (value == null) return null;
      result = result.replaceAll(m.group(0)!, '$value');
    }
    return result;
  }

  /// レスポンスから次に使える ID を拾う。
  void learnFrom(String label, Object? body) {
    if (body is! Map) return;

    switch (label) {
      case 'auth.me':
        final user = body['user'];
        if (user is Map) {
          userId ??= _int(user['id']);
          username ??= user['username'] as String?;
        }
      case 'posts.timeline' || 'posts.recommended' || 'posts.recommended.latest':
        final posts = body['posts'];
        if (posts is List && posts.isNotEmpty && posts.first is Map) {
          postId ??= _int((posts.first as Map)['id']);
        }
      case 'boards.list':
        final boards = body['boards'];
        if (boards is List && boards.isNotEmpty && boards.first is Map) {
          boardSlug ??= (boards.first as Map)['slug'] as String?;
        }
      case 'boards.threads':
        final threads = body['threads'];
        if (threads is List && threads.isNotEmpty && threads.first is Map) {
          threadId ??= _int((threads.first as Map)['id']);
        }
      case 'dm.groups':
        final groups = body['groups'];
        if (groups is List && groups.isNotEmpty && groups.first is Map) {
          groupId ??= _int((groups.first as Map)['id']);
        }
    }
  }

  static int? _int(Object? value) =>
      value is int ? value : int.tryParse('$value');
}

class _Client {
  _Client(this._http);

  final HttpClient _http;
  final context = _Context();

  String? _accessToken;
  String? _csrfToken;
  final _cookies = <String>[];
  final _deviceId = _randomUuid();

  Future<void> login({
    required String identifier,
    required String password,
    required String gender,
  }) async {
    final body = await _send('POST', 'auth/login', {
      'identifier': identifier,
      'password': password,
      'gender': gender,
      'deviceId': _deviceId,
      'clientType': _clientType,
      'deviceName': 'Karotator sample capture',
    });

    _accessToken = body['accessToken'] as String?;
    if (_accessToken == null) {
      // 2FA が有効だとここに来る。
      throw StateError(
        'ログインでアクセストークンが返らなかった。'
        '2 要素認証が有効なアカウントは未対応。応答: ${body.keys.toList()}',
      );
    }
    final user = body['user'];
    if (user is Map) {
      context
        ..userId = _Context._int(user['id'])
        ..username = user['username'] as String?;
    }
  }

  Future<Map<String, Object?>> get(String path) => _send('GET', path, null);

  Future<Map<String, Object?>> _send(
    String method,
    String path,
    Map<String, Object?>? json,
  ) async {
    // GET と、ログインのための POST auth/login 以外は投げない。
    if (method != 'GET' && path != 'auth/login') {
      throw StateError('このツールは GET しか投げない: $method $path');
    }

    final request = await _http.openUrl(method, Uri.parse('$_baseUrl/$path'));
    request.headers
      ..set('x-client-type', _clientType)
      ..set('x-device-id', _deviceId)
      ..set('accept', 'application/json');
    if (_accessToken case final token?) {
      request.headers.set('authorization', 'Bearer $token');
    }
    if (_csrfToken case final token?) {
      request.headers.set('x-csrf-token', token);
    }
    if (context.userId case final id? when !path.startsWith('auth/')) {
      request.headers.set('x-active-account-id', '$id');
    }
    if (_cookies.isNotEmpty) {
      request.headers.set('cookie', _cookies.join('; '));
    }
    if (json != null) {
      final encoded = utf8.encode(jsonEncode(json));
      request.headers
        ..set('content-type', 'application/json')
        ..set('content-length', '${encoded.length}');
      request.add(encoded);
    }

    final response = await request.close().timeout(_timeout);
    final text = await response.transform(utf8.decoder).join();

    for (final setCookie in response.headers['set-cookie'] ?? const <String>[]) {
      final pair = setCookie.split(';').first.trim();
      if (pair.contains('=')) _cookies.add(pair);
    }

    Map<String, Object?> body;
    try {
      final decoded = jsonDecode(text);
      body = decoded is Map<String, Object?> ? decoded : {'_': decoded};
    } on FormatException {
      body = {};
    }

    if (body['csrfToken'] case final String token) {
      _csrfToken = token;
    }
    if (response.statusCode >= 400) {
      throw _RequestFailure(
        response.statusCode,
        '${body['error'] ?? body['code'] ?? ''}',
      );
    }
    return body;
  }

  void close() => _http.close(force: true);
}

/// 端末 ID 用の UUID v4。暗号強度は要らない。
String _randomUuid() {
  final now = DateTime.now().microsecondsSinceEpoch;
  var seed = now;
  String hex(int length) {
    final buffer = StringBuffer();
    for (var i = 0; i < length; i++) {
      seed = (seed * 6364136223846793005 + 1442695040888963407) & 0x7FFFFFFF;
      buffer.write((seed % 16).toRadixString(16));
    }
    return buffer.toString();
  }

  return '${hex(8)}-${hex(4)}-4${hex(3)}-a${hex(3)}-${hex(12)}';
}

// ---- 出力 ----

Future<void> _writeJson(
  Directory outDir,
  Map<String, Shape> shapes,
  Map<String, String> failures,
) async {
  final payload = {
    'generatedBy': 'tool/capture_api_samples.dart',
    'note': '実際のレスポンスから起こしたスキーマ。値は含まない。',
    'observed': {
      for (final e in shapes.entries) e.key: e.value.toJson(),
    },
    if (failures.isNotEmpty) 'failures': failures,
  };
  await File('${outDir.path}/observed-schemas.json')
      .writeAsString('${prettyJson(payload)}\n');
}

Future<void> _writeMarkdown(
  Directory outDir,
  Map<String, Shape> shapes,
  Map<String, String> failures,
) async {
  final buffer = StringBuffer()
    ..writeln('# 観測したレスポンススキーマ')
    ..writeln()
    ..writeln('<!-- このファイルは自動生成される。手で編集しない。 -->')
    ..writeln('<!-- 再生成: dart run tool/capture_api_samples.dart -->')
    ..writeln()
    ..writeln('実際の Karotter API を 1 回叩いて得たレスポンスから、')
    ..writeln('**フィールド名と型だけ**を抜き出したもの。値は含まない。')
    ..writeln()
    ..writeln('> [!NOTE]')
    ..writeln('> 1 アカウント・1 回の観測に基づく。`nullable` は「今回 null だった」')
    ..writeln('> または「今回の配列要素の一部に無かった」という意味でしかない。')
    ..writeln('> 必須かどうかの最終判断は [conventions.md](conventions.md) と')
    ..writeln('> [schemas/](schemas/) の公式スキーマを優先すること。')
    ..writeln();

  for (final entry in shapes.entries) {
    buffer
      ..writeln('## ${entry.key}')
      ..writeln();
    entry.value.describe(buffer);
    buffer.writeln();
  }

  if (failures.isNotEmpty) {
    buffer
      ..writeln('## 取れなかったもの')
      ..writeln()
      ..writeln('| 対象 | 理由 |')
      ..writeln('| --- | --- |');
    for (final entry in failures.entries) {
      buffer.writeln('| `${entry.key}` | ${entry.value} |');
    }
    buffer.writeln();
  }

  await File('${outDir.path}/observed-schemas.md')
      .writeAsString(buffer.toString());
}
