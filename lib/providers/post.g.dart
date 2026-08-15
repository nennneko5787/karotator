// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PostNotifier)
final postProvider = PostNotifierFamily._();

final class PostNotifierProvider extends $NotifierProvider<PostNotifier, Post> {
  PostNotifierProvider._({
    required PostNotifierFamily super.from,
    required int super.argument,
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
  Override overrideWithValue(Post value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Post>(value),
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

String _$postNotifierHash() => r'271222664069fd0c4d4297af3c4e6049266bc2e1';

final class PostNotifierFamily extends $Family
    with $ClassFamilyOverride<PostNotifier, Post, Post, Post, int> {
  PostNotifierFamily._()
    : super(
        retry: null,
        name: r'postProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PostNotifierProvider call(int postId) =>
      PostNotifierProvider._(argument: postId, from: this);

  @override
  String toString() => r'postProvider';
}

abstract class _$PostNotifier extends $Notifier<Post> {
  late final _$args = ref.$arg as int;
  int get postId => _$args;

  Post build(int postId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Post, Post>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Post, Post>,
              Post,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
