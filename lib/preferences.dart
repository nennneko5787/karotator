import 'package:flutter/material.dart';
import 'package:karotator/enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instance = Preferences._internal();
  Preferences._internal();

  factory Preferences() {
    return _instance;
  }

  SharedPreferences? prefs;
  bool initialized = false;

  Future<void> initialize() async {
    prefs = await SharedPreferences.getInstance();
    initialized = true;
  }

  ThemeMode getThemeMode() {
    final theme = prefs!.getString('theme');
    return theme != null ? ThemeMode.values.byName(theme) : ThemeMode.system;
  }

  Future<void> setThemeMode(ThemeMode theme) async {
    await prefs!.setString('theme', theme.name);
  }

  String? getFont() {
    return prefs!.getString('font');
  }

  Future<void> setFont(String? font) async {
    if (font != null) {
      await prefs!.setString('font', font);
    } else {
      await prefs!.remove('font');
    }
  }

  double getFontSize() {
    return prefs!.getDouble('fontSize') ?? 1.0;
  }

  Future<void> setFontSize(double fontSize) async {
    await prefs!.setDouble('fontSize', fontSize);
  }

  /// 投稿制限の帯を閉じたか。ユーザーごとに持つ (REQ-GATE-003)。
  bool getPostingRestrictionDismissed(int userId) =>
      prefs!.getBool(_postingRestrictionKey(userId)) ?? false;

  Future<void> setPostingRestrictionDismissed(int userId) =>
      prefs!.setBool(_postingRestrictionKey(userId), true);

  /// 制限が解けたら記憶を捨てる。次に制限が掛かったときにまた出すため
  /// (REQ-GATE-004)。
  Future<void> clearPostingRestrictionDismissed(int userId) =>
      prefs!.remove(_postingRestrictionKey(userId));

  String _postingRestrictionKey(int userId) => 'postingRestrictionDismissed:$userId';

  /// 画面全体の拡大率。フォントサイズとは別で、両方掛かる。
  double getUiScale() => prefs!.getDouble('uiScale') ?? 1.0;

  Future<void> setUiScale(double scale) async {
    await prefs!.setDouble('uiScale', scale);
  }

  EmojiStyle getEmojiStyle() {
    final name = prefs!.getString('emojiStyle');
    if (name == null) return EmojiStyle.native;
    // 知らない値が残っていても落とさない（設定を消したり改名したときのため）。
    return EmojiStyle.values.firstWhere(
      (e) => e.name == name,
      orElse: () => EmojiStyle.native,
    );
  }

  Future<void> setEmojiStyle(EmojiStyle style) async {
    await prefs!.setString('emojiStyle', style.name);
  }
}
