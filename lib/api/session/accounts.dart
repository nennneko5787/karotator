import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/v4.dart';

/// アプリが保持しているアカウントの一覧と、どれがアクティブかだけを持つ (REQ-API-022)。
///
/// アカウントの中身（トークン・Cookie）は [CredentialStore] / [CookieJar] の担当。
/// ここが知っているのはアプリ内部のアカウント識別子（UUID）だけ。
class AccountStore {
  static const _idsKey = 'accountIds';
  static const _activeKey = 'nowAccountId';

  Future<List<String>> ids() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_idsKey) ?? const [];
  }

  Future<String?> activeId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_activeKey);
  }

  /// [id] をアクティブにする。一覧に無ければ追加する。
  Future<void> activate(String id) async {
    final prefs = await SharedPreferences.getInstance();

    final ids = prefs.getStringList(_idsKey) ?? <String>[];
    if (!ids.contains(id)) {
      await prefs.setStringList(_idsKey, [...ids, id]);
    }
    await prefs.setString(_activeKey, id);
  }

  /// 新しいアカウント枠を作ってアクティブにする。
  ///
  /// この時点ではまだトークンを持たない。ログインが成功したら
  /// [CredentialStore.save] で中身が入る。
  Future<String> create() async {
    final id = UuidV4().generate();
    await activate(id);
    return id;
  }

  /// [id] を一覧から外す。
  ///
  /// 消したのがアクティブだった場合は残りの先頭に移る。
  /// 戻り値は移った先のアカウント ID。1 つも残らなければ null。
  Future<String?> remove(String id) async {
    final prefs = await SharedPreferences.getInstance();

    final ids = (prefs.getStringList(_idsKey) ?? <String>[])
      ..removeWhere((e) => e == id);
    await prefs.setStringList(_idsKey, ids);

    if (prefs.getString(_activeKey) != id) {
      return prefs.getString(_activeKey);
    }

    final next = ids.firstOrNull;
    if (next != null) {
      await prefs.setString(_activeKey, next);
    } else {
      await prefs.remove(_activeKey);
    }
    return next;
  }
}
