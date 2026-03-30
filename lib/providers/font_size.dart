import 'package:karotator/preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'font_size.g.dart';

@riverpod
class FontSizeNotifier extends _$FontSizeNotifier {
  @override
  double build() => 1.0;

  void setFontSize(double fontSize) {
    state = fontSize;
    Preferences().setFontSize(fontSize);
  }
}
