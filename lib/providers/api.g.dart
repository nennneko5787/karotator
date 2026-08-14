// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// カロート関連のエンドポイント。
///
/// プロバイダ越しに取るのは、テストで差し替えられるようにするため。
/// 直接 `KarotterApi().posts` を掴むと通信を伴わない検証ができない。

@ProviderFor(postsApi)
final postsApiProvider = PostsApiProvider._();

/// カロート関連のエンドポイント。
///
/// プロバイダ越しに取るのは、テストで差し替えられるようにするため。
/// 直接 `KarotterApi().posts` を掴むと通信を伴わない検証ができない。

final class PostsApiProvider
    extends $FunctionalProvider<PostsApi, PostsApi, PostsApi>
    with $Provider<PostsApi> {
  /// カロート関連のエンドポイント。
  ///
  /// プロバイダ越しに取るのは、テストで差し替えられるようにするため。
  /// 直接 `KarotterApi().posts` を掴むと通信を伴わない検証ができない。
  PostsApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postsApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postsApiHash();

  @$internal
  @override
  $ProviderElement<PostsApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PostsApi create(Ref ref) {
    return postsApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostsApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostsApi>(value),
    );
  }
}

String _$postsApiHash() => r'3bfbde3e2a3ebb351d460265835ea22ac2fe2d27';

/// ユーザー関連のエンドポイント。理由は [postsApi] と同じ。

@ProviderFor(usersApi)
final usersApiProvider = UsersApiProvider._();

/// ユーザー関連のエンドポイント。理由は [postsApi] と同じ。

final class UsersApiProvider
    extends $FunctionalProvider<UsersApi, UsersApi, UsersApi>
    with $Provider<UsersApi> {
  /// ユーザー関連のエンドポイント。理由は [postsApi] と同じ。
  UsersApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usersApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usersApiHash();

  @$internal
  @override
  $ProviderElement<UsersApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UsersApi create(Ref ref) {
    return usersApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UsersApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UsersApi>(value),
    );
  }
}

String _$usersApiHash() => r'14b28cdbf7bdfdc2d2e5848159dd0ec60c6a4d79';
