/*
 * Software Name : Orange Design System
 * SPDX-FileCopyrightText: Copyright (c) Orange SA
 * SPDX-License-Identifier: MIT
 *
 * This software is distributed under the MIT licence,
 * the text of which is available at https://opensource.org/license/MIT/
 * or see the "LICENSE" file for more details.
 *
 * Software description: Flutter library of reusable graphical components for Android and iOS
 */

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
