// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PostNotifier)
final postProvider = PostNotifierFamily._();

final class PostNotifierProvider
    extends $NotifierProvider<PostNotifier, PostState> {
  PostNotifierProvider._({
    required PostNotifierFamily super.from,
    required PostState super.argument,
  }) : super(
         retry: null,
         name: r'postProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$postNotifierHash();

  @override
  String toString() {
    return r'postProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PostNotifier create() => PostNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PostNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$postNotifierHash() => r'4cabdc1bedf0d0373957ab697145e09aad419237';

final class PostNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PostNotifier,
          PostState,
          PostState,
          PostState,
          PostState
        > {
  PostNotifierFamily._()
    : super(
        retry: null,
        name: r'postProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PostNotifierProvider call(PostState post) =>
      PostNotifierProvider._(argument: post, from: this);

  @override
  String toString() => r'postProvider';
}

abstract class _$PostNotifier extends $Notifier<PostState> {
  late final _$args = ref.$arg as PostState;
  PostState get post => _$args;

  PostState build(PostState post);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PostState, PostState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PostState, PostState>,
              PostState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
