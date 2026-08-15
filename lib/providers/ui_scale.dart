import 'package:karotator/preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ui_scale.g.dart';

/// 画面全体の拡大率。
///
/// フォントサイズ設定が文字だけを変えるのに対し、こちらはアバター・アイコン・
/// 余白まで含めて全部を同じ倍率で変える。両方掛かるので、文字は
/// `uiScale * fontSize` 倍になる。
@riverpod
class UiScaleNotifier extends _$UiScaleNotifier {
  @override
  double build() => 1.0;

  void setUiScale(double scale) {
    state = scale;
    Preferences().setUiScale(scale);
  }
}
