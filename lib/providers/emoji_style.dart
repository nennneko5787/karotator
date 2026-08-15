import 'package:karotator/enum.dart';
import 'package:karotator/preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'emoji_style.g.dart';

@riverpod
class EmojiStyleNotifier extends _$EmojiStyleNotifier {
  @override
  EmojiStyle build() => EmojiStyle.native;

  void setEmojiStyle(EmojiStyle style) {
    state = style;
    Preferences().setEmojiStyle(style);
  }
}
