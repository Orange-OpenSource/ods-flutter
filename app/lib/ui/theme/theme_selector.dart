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
import 'package:ods_flutter_demo/l10n/l10n.dart';
import 'package:ods_flutter_demo/ui/theme/model_theme.dart';
import 'package:provider/provider.dart';

class ThemeSelector extends StatefulWidget {
  const ThemeSelector({super.key});

  @override
  State<ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  String themeValue = ThemeMode.system.toString();

  final Map<String, IconData> themeIcons = {
    ThemeMode.light.toString(): Icons.wb_sunny,
    ThemeMode.dark.toString(): Icons.nightlight_round,
    ThemeMode.system.toString(): Icons.circle_sharp,
  };

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final themeNotifier = Provider.of<ModelTheme>(context);

    return Semantics(
      button: true,
      label: themeNotifier.themeMode == ThemeMode.light
          ? l10n.themeSelectorSwitchDarkMode
          : l10n.themeSelectorSwitchLightMode,
      child: IconButton(
        icon: Icon(themeNotifier.themeMode == ThemeMode.light
            ? Icons.light_mode
            : Icons.dark_mode),
        onPressed: () {
          setState(() {
            themeNotifier.themeMode = themeNotifier.themeMode == ThemeMode.light
                ? ThemeMode.dark
                : ThemeMode.light;
          });
        },
        tooltip: themeNotifier.themeMode == ThemeMode.light
            ? l10n.themeSelectorSwitchDarkMode
            : l10n.themeSelectorSwitchLightMode,
      ),
    );
  }
}
