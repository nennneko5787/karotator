import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/v4.dart';

/// 端末を識別する UUID。
///
/// `x-device-id` ヘッダと、ログイン / リフレッシュのボディに載る。
/// 初回に一度だけ生成し、以後の起動でも同じ値を返す (REQ-API-024)。
class DeviceId {
  static const _key = 'deviceId';

  String? _cached;

  Future<String> get() async {
    final cached = _cached;
    if (cached != null) return cached;

    final prefs = await SharedPreferences.getInstance();
    var id = prefs.getString(_key);
    if (id == null) {
      id = UuidV4().generate();
      await prefs.setString(_key, id);
    }
    return _cached = id;
  }
}
