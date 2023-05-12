import 'package:flutter/material.dart';
import 'package:ods_flutter/theme/ods_palette.dart';
import 'package:ods_flutter/theme/ods_typography.dart';

import 'ods_color_scheme.dart';

const double _disabledOpacity = 0.38;
const double _switchTrackOpacity = 0.54;

class OdsTheme {
  OdsTheme._();

  static ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    typography: odsTypography,
    appBarTheme: const AppBarTheme(backgroundColor: white100),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: white100),
    checkboxTheme: const CheckboxThemeData(fillColor: LightControlFillColor()),
    radioTheme: const RadioThemeData(fillColor: LightControlFillColor()),
    switchTheme: SwitchThemeData(
        thumbColor: const LightControlFillColor(),
        trackColor: MaterialStateColor.resolveWith((states) {
          return const LightControlFillColor()
              .resolve(states)
              .withOpacity(_switchTrackOpacity);
        })),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    typography: odsTypography,
    appBarTheme: const AppBarTheme(backgroundColor: darkSurfaceDefault),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: darkSurfaceDefault),
    checkboxTheme: const CheckboxThemeData(
        fillColor: DarkControlFillColor(),
        checkColor: MaterialStatePropertyAll(black900)),
    radioTheme: const RadioThemeData(fillColor: DarkControlFillColor()),
    switchTheme: SwitchThemeData(
        thumbColor: const DarkControlFillColor(),
        trackColor: MaterialStateColor.resolveWith((states) {
          return const DarkControlFillColor()
              .resolve(states)
              .withOpacity(_switchTrackOpacity);
        })),
  );
}

/// Light theme fill color used by selection controls: Checkboxes, Radio Buttons
class LightControlFillColor extends MaterialStateColor {
  const LightControlFillColor() : super(_defaultColor);

  static const int _defaultColor = 0xff000000;

  @override
  Color resolve(Set states) {
    if (states.contains(MaterialState.disabled)) {
      return lightColorScheme.onSurface.withOpacity(_disabledOpacity);
    } else if (states.contains(MaterialState.selected)) {
      return lightColorScheme.primary;
    }
    return grey600;
  }
}

/// Dark theme fill color used by selection controls: Checkboxes, Radio Buttons
class DarkControlFillColor extends MaterialStateColor {
  const DarkControlFillColor() : super(_defaultColor);

  static const int _defaultColor = 0xffffffff;

  @override
  Color resolve(Set states) {
    if (states.contains(MaterialState.disabled)) {
      return darkColorScheme.onSurface.withOpacity(_disabledOpacity);
    } else if (states.contains(MaterialState.selected)) {
      return darkColorScheme.primary;
    }
    return grey400;
  }
}
