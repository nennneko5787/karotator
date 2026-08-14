import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:karotator/objects/response.dart';

/// アカウントごとのトークンを安全なストレージに置く。
///
/// 保存しているのはログイン応答そのもの。アクセストークン単体ではなく
/// `sessionId` / `deviceId` / `user` も要る（`auth/switch-session` が使う）。
class CredentialStore {
  CredentialStore({FlutterSecureStorage? storage})
    : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  String _key(String accountId) => '${accountId}_login';

  Future<LoginResponse?> load(String accountId) async {
    final raw = await _storage.read(key: _key(accountId));
    if (raw == null) return null;

    final decoded = jsonDecode(raw);
    if (decoded is! Map<String, dynamic>) return null;
    return LoginResponse.fromJson(decoded);
  }

  Future<void> save(String accountId, LoginResponse res) =>
      _storage.write(key: _key(accountId), value: jsonEncode(res.toJson()));

  /// リフレッシュで返ってきた新しいトークンだけを差し替える。
  ///
  /// `user` などはリフレッシュ応答に含まれないので、既存の値を残す。
  Future<void> applyRefresh(String accountId, RefreshResponse res) async {
    final raw = await _storage.read(key: _key(accountId));
    if (raw == null) return;

    final decoded = jsonDecode(raw);
    if (decoded is! Map<String, dynamic>) return;

    decoded['accessToken'] = res.accessToken;
    decoded['sessionId'] = res.sessionId;
    await _storage.write(key: _key(accountId), value: jsonEncode(decoded));
  }

  Future<void> clear(String accountId) =>
      _storage.delete(key: _key(accountId));
}
