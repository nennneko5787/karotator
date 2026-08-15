import 'package:flutter/foundation.dart';
import 'package:karotator/api/karotter_api.dart';
import 'package:karotator/objects/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_user.g.dart';

/// 閲覧者自身。未ログインなら null。
///
/// メール認証や規約クイズの合否がここで変わると、帯も設定画面も一緒に追従する。
/// 各画面が `session.login()` を呼ぶのをやめてここに集めた
/// （仕様: specs/004-posting-restrictions/design.md §1）。
///
/// **`keepAlive` が要る。** 既定の autoDispose だと、誰も watch していない間に
/// 破棄されて [build] の null に戻る。起動時に [hydrate] しても、その時点では
/// まだ画面が watch していないので即座に捨てられ、設定画面が `@null` を出す。
@Riverpod(keepAlive: true)
class AuthUserNotifier extends _$AuthUserNotifier {
  /// session が起動時に読んだ控え。作られた時点の正しい値から始める。
  ///
  /// [hydrate] を待たずに済むので、ログイン直後にこのプロバイダが初めて
  /// 作られる場合も正しい値になる。
  @override
  AuthUser? build() => KarotterApi().session.user;

  /// session の控えから入れ直す。起動時とログイン直後に呼ぶ。
  void hydrate(AuthUser? user) => state = user;

  /// 一部だけ書き換える。手元の控え（secure storage）にも書き戻すので、
  /// 再起動しても戻らない (REQ-GATE-020)。
  Future<void> patch(AuthUser Function(AuthUser current) change) async {
    final current = state;
    if (current == null) return;

    final next = change(current);
    state = next;

    try {
      final login = await KarotterApi().session.login();
      if (login == null) return;
      await KarotterApi().session.saveLogin(login.copyWith(user: next));
    } catch (e, stackTrace) {
      // 控えの更新に失敗しても画面は進める。次の起動で取り直せばよい。
      debugPrint("控えの更新に失敗: $e\n$stackTrace");
    }
  }

  /// サーバーから取り直す。ブラウザでメール認証を済ませて戻ってきたときなど
  /// (REQ-GATE-019)。
  Future<void> refresh() async {
    if (KarotterApi().session.accountId == null) return;

    try {
      final user = await KarotterApi().auth.me();
      state = user;

      final login = await KarotterApi().session.login();
      if (login == null) return;
      await KarotterApi().session.saveLogin(login.copyWith(user: user));
    } catch (e, stackTrace) {
      // 取り直せなくても手元の値のまま続ける。
      debugPrint("閲覧者情報の取り直しに失敗: $e\n$stackTrace");
    }
  }
}
