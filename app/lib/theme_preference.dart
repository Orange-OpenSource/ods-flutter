import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const THEME_KEY = "theme_key";

  setTheme(ThemeMode value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(THEME_KEY, value.toString());
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? theme = sharedPreferences.getString(THEME_KEY);

    if (theme == ThemeMode.system.toString()) {
      return ThemeMode.system;
    }

    if (theme == ThemeMode.dark.toString()) {
      return ThemeMode.dark;
    }

    if (theme == ThemeMode.light.toString()) {
      return ThemeMode.light;
    }

    return ThemeMode.system;
  }
}
