import 'dart:developer';

import 'package:flutter/material.dart';

class ThemeChangeProvider extends ChangeNotifier {
  ThemeMode _currentTheme = ThemeMode.light;

  ThemeMode get currentTheme => _currentTheme;

  set currentTheme(ThemeMode mode) {
    _currentTheme = mode;
    notifyListeners();
  }

  void toggleTheme(bool val) {
    log("Val : $val");
    if (val) {
      currentTheme = ThemeMode.dark;
    } else {
      currentTheme = ThemeMode.light;
    }
    // notifyListeners();
  }
}
