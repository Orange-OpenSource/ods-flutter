import 'package:flutter/material.dart';

import 'theme_preference.dart';

class ModelTheme extends ChangeNotifier {
  late ThemeMode _themeMode;
  late ThemePreferences _preferences;
  ThemeMode get themeMode => _themeMode;

  ModelTheme() {
    _themeMode = ThemeMode.system;
    _preferences = ThemePreferences();
    _getPreferences();
  }

  //Switching the themes
  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    _preferences.setThemeMode(themeMode);
    notifyListeners();
  }

  _getPreferences() async {
    _themeMode = await _preferences.getThemeMode();
    notifyListeners();
  }
}
