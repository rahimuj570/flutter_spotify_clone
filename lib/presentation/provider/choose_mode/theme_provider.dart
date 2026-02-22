import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  ThemeMode _themeMode = ThemeMode.light;

  bool get getIsDark => _isDark;
  ThemeMode get getThemeMode => _themeMode;

  void changeThemeMode({required bool isDark}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (isDark) {
      preferences.setBool('isDark', true);
      _themeMode = ThemeMode.dark;
      _isDark = true;
    } else {
      preferences.setBool('isDark', false);
      _themeMode = ThemeMode.light;
      _isDark = false;
    }
    notifyListeners();
  }

  void fetchSavedTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _isDark = preferences.getBool('isDark') ?? false;
    if (_isDark) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
