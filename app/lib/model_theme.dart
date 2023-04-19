import 'package:flutter/material.dart';
import 'theme_preference.dart';

class ModelTheme extends ChangeNotifier {
  late ThemeMode _theme;
  late ThemePreferences _preferences;
  ThemeMode get theme => _theme;

  ModelTheme() {
    _theme = ThemeMode.system;
    _preferences = ThemePreferences();
    getPreferences();
  }

  //Switching the themes
  set theme(ThemeMode value) {
    _theme = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _theme = await _preferences.getTheme();
    notifyListeners();
  }
}
