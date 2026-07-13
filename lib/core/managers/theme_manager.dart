import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager {
  ThemeManager._();

  static final ThemeManager instance = ThemeManager._();

  static const String _themeKey = 'isDark';

  late SharedPreferences _prefs;

  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  bool get isDark => _themeMode == ThemeMode.dark;

  /// Initialize Theme
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();

    final isDark = _prefs.getBool(_themeKey) ?? false;

    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  /// Change Theme
  Future<void> setTheme(bool isDark) async {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;

    await _prefs.setBool(_themeKey, isDark);
  }

  /// Toggle Theme
  Future<void> toggleTheme() async {
    await setTheme(!isDark);
  }
}