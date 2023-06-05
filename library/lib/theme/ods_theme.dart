import 'package:flutter/material.dart';
import 'package:ods_flutter/theme/ods_palette.dart';
import 'package:ods_flutter/theme/ods_typography.dart';

import 'ods_color_scheme.dart';

const double _disabledOpacity = 0.38;
const double _switchTrackOpacity = 0.54;

const double odsCardRadius = 4.0;

class OdsTheme {
  OdsTheme._();

  static ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    typography: odsTypography,
    scaffoldBackgroundColor: white100,
    appBarTheme: const AppBarTheme(backgroundColor: white100),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: white100,
      elevation: 3.0,
      indicatorColor: Colors.transparent,
      indicatorShape: null,
      iconTheme: MaterialStateProperty.resolveWith<IconThemeData?>((states) {
        if (states.contains(MaterialState.selected)) {
          return IconThemeData(color: lightColorScheme.primary);
        }
        return IconThemeData(color: lightColorScheme.secondary);
      }),
      labelTextStyle: MaterialStateProperty.resolveWith<TextStyle?>((states) {
        if (states.contains(MaterialState.selected)) {
          return TextStyle(color: lightColorScheme.primary);
        }
        return TextStyle(color: lightColorScheme.secondary);
      }),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: white100,
      selectedItemColor: lightColorScheme.primary,
      unselectedItemColor: lightColorScheme.secondary,
    ),
    checkboxTheme: const CheckboxThemeData(fillColor: LightControlFillColor()),
    radioTheme: const RadioThemeData(fillColor: LightControlFillColor()),
    switchTheme: SwitchThemeData(
        thumbColor: const LightControlFillColor(),
        trackColor: MaterialStateColor.resolveWith((states) {
          return const LightControlFillColor().resolve(states).withOpacity(_switchTrackOpacity);
        })),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    typography: odsTypography,
    scaffoldBackgroundColor: black900,
    appBarTheme: const AppBarTheme(backgroundColor: darkSurfaceDefault),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: black900,
      elevation: 3.0,
      indicatorColor: Colors.transparent,
      indicatorShape: null,
      iconTheme: MaterialStateProperty.resolveWith<IconThemeData?>((states) {
        if (states.contains(MaterialState.selected)) {
          return IconThemeData(color: darkColorScheme.primary);
        }
        return IconThemeData(color: darkColorScheme.secondary);
      }),
      labelTextStyle: MaterialStateProperty.resolveWith<TextStyle?>((states) {
        if (states.contains(MaterialState.selected)) {
          return TextStyle(color: darkColorScheme.primary);
        }
        return TextStyle(color: darkColorScheme.secondary);
      }),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: darkSurfaceDefault,
      selectedItemColor: darkColorScheme.primary,
      unselectedItemColor: darkColorScheme.secondary,
    ),
    checkboxTheme: const CheckboxThemeData(fillColor: DarkControlFillColor(), checkColor: MaterialStatePropertyAll(black900)),
    radioTheme: const RadioThemeData(fillColor: DarkControlFillColor()),
    switchTheme: SwitchThemeData(
        thumbColor: const DarkControlFillColor(),
        trackColor: MaterialStateColor.resolveWith((states) {
          return const DarkControlFillColor().resolve(states).withOpacity(_switchTrackOpacity);
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
