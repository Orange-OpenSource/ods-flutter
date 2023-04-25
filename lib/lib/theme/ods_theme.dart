import 'package:flutter/material.dart';
import 'package:ods_flutter/theme/ods_palette.dart';

import 'ods_color_scheme.dart';
import 'ods_typography.dart';

class OdsTheme {
  OdsTheme._();

  static ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    textTheme: textTheme,
    appBarTheme: const AppBarTheme(backgroundColor: white100),
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
    appBarTheme: const AppBarTheme(backgroundColor: darkSurfaceDefault),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: darkSurfaceDefault),
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
