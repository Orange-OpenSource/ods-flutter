/*
 * Software Name : Orange Design System
 * SPDX-FileCopyrightText: Copyright (c) Orange SA
 * SPDX-License-Identifier: MIT
 *
 * This software is distributed under the MIT license,
 * the text of which is available at https://opensource.org/license/MIT/
 * or see the "LICENSE" file for more details.
 *
 * Software description: Flutter library of reusable graphical components for Android and iOS
 */

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
