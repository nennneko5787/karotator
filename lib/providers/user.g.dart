// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserResponseNotifier)
final userResponseProvider = UserResponseNotifierFamily._();

final class UserResponseNotifierProvider
    extends $NotifierProvider<UserResponseNotifier, UserResponse> {
  UserResponseNotifierProvider._({
    required UserResponseNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'userResponseProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userResponseNotifierHash();

  @override
  String toString() {
    return r'userResponseProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  UserResponseNotifier create() => UserResponseNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserResponse value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserResponse>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UserResponseNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userResponseNotifierHash() =>
    r'dfc8cfaa911cfd968f2109ca8c1a5fe262c7ed4e';

final class UserResponseNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          UserResponseNotifier,
          UserResponse,
          UserResponse,
          UserResponse,
          int
        > {
  UserResponseNotifierFamily._()
    : super(
        retry: null,
        name: r'userResponseProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserResponseNotifierProvider call(int userId) =>
      UserResponseNotifierProvider._(argument: userId, from: this);

  @override
  String toString() => r'userResponseProvider';
}

abstract class _$UserResponseNotifier extends $Notifier<UserResponse> {
  late final _$args = ref.$arg as int;
  int get userId => _$args;

  UserResponse build(int userId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<UserResponse, UserResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserResponse, UserResponse>,
              UserResponse,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
