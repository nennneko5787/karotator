// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui_scale.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 画面全体の拡大率。
///
/// フォントサイズ設定が文字だけを変えるのに対し、こちらはアバター・アイコン・
/// 余白まで含めて全部を同じ倍率で変える。両方掛かるので、文字は
/// `uiScale * fontSize` 倍になる。

@ProviderFor(UiScaleNotifier)
final uiScaleProvider = UiScaleNotifierProvider._();

/// 画面全体の拡大率。
///
/// フォントサイズ設定が文字だけを変えるのに対し、こちらはアバター・アイコン・
/// 余白まで含めて全部を同じ倍率で変える。両方掛かるので、文字は
/// `uiScale * fontSize` 倍になる。
final class UiScaleNotifierProvider
    extends $NotifierProvider<UiScaleNotifier, double> {
  /// 画面全体の拡大率。
  ///
  /// フォントサイズ設定が文字だけを変えるのに対し、こちらはアバター・アイコン・
  /// 余白まで含めて全部を同じ倍率で変える。両方掛かるので、文字は
  /// `uiScale * fontSize` 倍になる。
  UiScaleNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'uiScaleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$uiScaleNotifierHash();

  @$internal
  @override
  UiScaleNotifier create() => UiScaleNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$uiScaleNotifierHash() => r'6d17c88a51178e0cbd23a92591b24eab9e23377b';

/// 画面全体の拡大率。
///
/// フォントサイズ設定が文字だけを変えるのに対し、こちらはアバター・アイコン・
/// 余白まで含めて全部を同じ倍率で変える。両方掛かるので、文字は
/// `uiScale * fontSize` 倍になる。

abstract class _$UiScaleNotifier extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
