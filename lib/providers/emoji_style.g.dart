// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emoji_style.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EmojiStyleNotifier)
final emojiStyleProvider = EmojiStyleNotifierProvider._();

final class EmojiStyleNotifierProvider
    extends $NotifierProvider<EmojiStyleNotifier, EmojiStyle> {
  EmojiStyleNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'emojiStyleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$emojiStyleNotifierHash();

  @$internal
  @override
  EmojiStyleNotifier create() => EmojiStyleNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EmojiStyle value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EmojiStyle>(value),
    );
  }
}

String _$emojiStyleNotifierHash() =>
    r'9bb470656d9ff87062ed2b96bb63979c6368bebf';

abstract class _$EmojiStyleNotifier extends $Notifier<EmojiStyle> {
  EmojiStyle build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<EmojiStyle, EmojiStyle>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EmojiStyle, EmojiStyle>,
              EmojiStyle,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
