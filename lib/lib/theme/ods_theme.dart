import 'package:flutter/material.dart';

import 'ods_palette.dart';
import 'ods_typography.dart';

class OdsTheme {
  OdsTheme._();

  static ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(backgroundColor: lightColorScheme.surface),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: lightColorScheme.background),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.black26;
          } else if (states.contains(MaterialState.selected)) {
            return lightColorScheme.primary;
          }
          return Colors.black54;
        },
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    textTheme: textTheme,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkColorScheme.background),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.white38;
          } else if (states.contains(MaterialState.selected)) {
            return lightColorScheme.primary;
          }
          return Colors.white70;
        },
      ),
    ),
  );
}
