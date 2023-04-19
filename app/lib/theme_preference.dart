import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const THEME_KEY = "theme_key";

  setThemeMode(ThemeMode themeMode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(THEME_KEY, themeMode.toString());
  }

  getThemeMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? themeModeString = sharedPreferences.getString(THEME_KEY);

    if (themeModeString == ThemeMode.system.toString()) {
      return ThemeMode.system;
    }

    if (themeModeString == ThemeMode.dark.toString()) {
      return ThemeMode.dark;
    }

    if (themeModeString == ThemeMode.light.toString()) {
      return ThemeMode.light;
    }

    return ThemeMode.system;
  }
}
