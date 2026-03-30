import 'package:flutter/material.dart';
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
}
