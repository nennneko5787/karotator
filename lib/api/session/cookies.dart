import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Cookie の名前。特別扱いするものだけ定数にする。
const csrfCookieName = 'karotter_csrf';

/// `Set-Cookie` の属性。値ではないので保持しない。
const _attributes = {
  'expires',
  'path',
  'domain',
  'secure',
  'httponly',
  'samesite',
  'max-age',
  'partitioned',
  'priority',
};

/// アカウントごとの Cookie を安全なストレージに置く (REQ-API-011)。
///
/// `Map<String, String>` ではなく順序付きのリストで持つ。
/// `karotter_csrf` は同名で複数飛んでくるため、名前で潰すと欠落する
/// (specs/api/conventions.md §3)。
class CookieJar {
  CookieJar({FlutterSecureStorage? storage})
    : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  String _key(String accountId) => '${accountId}_cookies';

  /// `Cookie` ヘッダに載せる形。Cookie が 1 つも無ければ null。
  Future<String?> header(String accountId) async {
    final raw = await _storage.read(key: _key(accountId));
    return (raw == null || raw.isEmpty) ? null : raw;
  }

  /// レスポンスの `Set-Cookie` を取り込む。
  Future<void> merge(String accountId, Iterable<String> setCookies) async {
    if (setCookies.isEmpty) return;

    final jar = _parse(await _storage.read(key: _key(accountId)) ?? '');
    for (final setCookie in setCookies) {
      for (final cookie in _parseSetCookie(setCookie)) {
        _put(jar, cookie);
      }
    }
    await _storage.write(key: _key(accountId), value: _format(jar));
  }

  /// [name] という名前の Cookie の値を全て返す。
  Future<List<String>> valuesOf(String accountId, String name) async {
    final jar = _parse(await _storage.read(key: _key(accountId)) ?? '');
    return [
      for (final cookie in jar)
        if (cookie.name == name) cookie.value,
    ];
  }

  Future<void> clear(String accountId) => _storage.delete(key: _key(accountId));

  /// CSRF は追記、それ以外は後勝ちで置換する。
  void _put(List<_Cookie> jar, _Cookie cookie) {
    if (cookie.name == csrfCookieName) {
      final duplicated = jar.any(
        (e) => e.name == cookie.name && e.value == cookie.value,
      );
      if (!duplicated) jar.add(cookie);
      return;
    }

    final index = jar.indexWhere((e) => e.name == cookie.name);
    if (index < 0) {
      jar.add(cookie);
    } else {
      jar[index] = cookie;
    }
  }

  /// 保存済みの `a=1; b=2` を読む。
  List<_Cookie> _parse(String raw) => [
    for (final part in raw.split(';')) ?_Cookie.tryParse(part),
  ];

  /// `Set-Cookie` ヘッダ 1 本を読む。先頭が値で、以降は属性。
  Iterable<_Cookie> _parseSetCookie(String raw) sync* {
    for (final part in raw.split(';')) {
      final cookie = _Cookie.tryParse(part);
      if (cookie == null) continue;
      // 属性が来たらそれ以降は全て属性。
      if (_attributes.contains(cookie.name.toLowerCase())) return;
      yield cookie;
    }
  }

  String _format(List<_Cookie> jar) =>
      jar.map((e) => '${e.name}=${e.value}').join('; ');
}

class _Cookie {
  const _Cookie(this.name, this.value);

  final String name;
  final String value;

  /// `name=value` を読む。`=` が無い、または名前が空なら null。
  static _Cookie? tryParse(String part) {
    final trimmed = part.trim();
    final eq = trimmed.indexOf('=');
    if (eq <= 0) return null;
    return _Cookie(
      trimmed.substring(0, eq).trim(),
      trimmed.substring(eq + 1).trim(),
    );
  }
}
