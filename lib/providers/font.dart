import 'package:karotator/preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'font.g.dart';

@riverpod
class FontNotifier extends _$FontNotifier {
  @override
  String? build() => null;

  void setFont(String? font) {
    state = font;
    Preferences().setFont(font);
  }
}
