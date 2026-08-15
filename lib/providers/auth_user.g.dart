// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 閲覧者自身。未ログインなら null。
///
/// メール認証や規約クイズの合否がここで変わると、帯も設定画面も一緒に追従する。
/// 各画面が `session.login()` を呼ぶのをやめてここに集めた
/// （仕様: specs/004-posting-restrictions/design.md §1）。
///
/// **`keepAlive` が要る。** 既定の autoDispose だと、誰も watch していない間に
/// 破棄されて [build] の null に戻る。起動時に [hydrate] しても、その時点では
/// まだ画面が watch していないので即座に捨てられ、設定画面が `@null` を出す。

@ProviderFor(AuthUserNotifier)
final authUserProvider = AuthUserNotifierProvider._();

/// 閲覧者自身。未ログインなら null。
///
/// メール認証や規約クイズの合否がここで変わると、帯も設定画面も一緒に追従する。
/// 各画面が `session.login()` を呼ぶのをやめてここに集めた
/// （仕様: specs/004-posting-restrictions/design.md §1）。
///
/// **`keepAlive` が要る。** 既定の autoDispose だと、誰も watch していない間に
/// 破棄されて [build] の null に戻る。起動時に [hydrate] しても、その時点では
/// まだ画面が watch していないので即座に捨てられ、設定画面が `@null` を出す。
final class AuthUserNotifierProvider
    extends $NotifierProvider<AuthUserNotifier, AuthUser?> {
  /// 閲覧者自身。未ログインなら null。
  ///
  /// メール認証や規約クイズの合否がここで変わると、帯も設定画面も一緒に追従する。
  /// 各画面が `session.login()` を呼ぶのをやめてここに集めた
  /// （仕様: specs/004-posting-restrictions/design.md §1）。
  ///
  /// **`keepAlive` が要る。** 既定の autoDispose だと、誰も watch していない間に
  /// 破棄されて [build] の null に戻る。起動時に [hydrate] しても、その時点では
  /// まだ画面が watch していないので即座に捨てられ、設定画面が `@null` を出す。
  AuthUserNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authUserProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authUserNotifierHash();

  @$internal
  @override
  AuthUserNotifier create() => AuthUserNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthUser? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthUser?>(value),
    );
  }
}

String _$authUserNotifierHash() => r'07da0219593cedaef79ce314b90c1545f34cd3fb';

/// 閲覧者自身。未ログインなら null。
///
/// メール認証や規約クイズの合否がここで変わると、帯も設定画面も一緒に追従する。
/// 各画面が `session.login()` を呼ぶのをやめてここに集めた
/// （仕様: specs/004-posting-restrictions/design.md §1）。
///
/// **`keepAlive` が要る。** 既定の autoDispose だと、誰も watch していない間に
/// 破棄されて [build] の null に戻る。起動時に [hydrate] しても、その時点では
/// まだ画面が watch していないので即座に捨てられ、設定画面が `@null` を出す。

abstract class _$AuthUserNotifier extends $Notifier<AuthUser?> {
  AuthUser? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AuthUser?, AuthUser?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuthUser?, AuthUser?>,
              AuthUser?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
