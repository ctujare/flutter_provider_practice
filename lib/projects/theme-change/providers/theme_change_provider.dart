import 'package:flutter/material.dart';

class ThemeChangeProvider extends ChangeNotifier {
  ThemeMode _currentTheme = ThemeMode.light;

  ThemeMode get currentTheme => _currentTheme;

  void toggleTheme(bool val) {
    if (val) {
      _currentTheme = ThemeMode.dark;
    } else {
      _currentTheme = ThemeMode.light;
    }
    notifyListeners();
  }
}
