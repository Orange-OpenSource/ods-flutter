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
import 'package:flutter/services.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter/theme/ods_palette.dart';
import 'package:ods_flutter/theme/ods_typography.dart';

import 'ods_color_scheme.dart';

const double _disabledOpacity = 0.38;

const double odsCardRadius = 5.0;
const double odsChipRadius = 20.0;

class OdsTheme {
  OdsTheme._();

  static ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    typography: odsTypography,
    scaffoldBackgroundColor: white100,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: white100,
      backgroundColor: white100,
      systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: white100,
          systemNavigationBarDividerColor: grey200,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light),
    ),
    navigationBarTheme: NavigationBarThemeData(
      surfaceTintColor: lightColorScheme.onSecondary,
      elevation: 3.0,
      indicatorColor: grey200,
      indicatorShape: null,
      iconTheme: MaterialStateProperty.resolveWith<IconThemeData?>(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return IconThemeData(color: lightColorScheme.primary);
          }
          return IconThemeData(color: lightColorScheme.secondary);
        },
      ),
      labelTextStyle: MaterialStateProperty.resolveWith<TextStyle?>(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return TextStyle(
                color: lightColorScheme.primary,
                overflow: TextOverflow.ellipsis,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 1.43,
                letterSpacing: 0.25);
          }
          return TextStyle(
              color: lightColorScheme.secondary,
              overflow: TextOverflow.ellipsis,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 1.43,
              letterSpacing: 0.25);
        },
      ),
    ),
    navigationRailTheme: NavigationRailThemeData(
      //surfaceTintColor: lightColorScheme.onSecondary,
      elevation: 3.0,
      indicatorColor: grey200,
      indicatorShape: null,
      selectedIconTheme: IconThemeData(color: lightColorScheme.primary),
      unselectedIconTheme: IconThemeData(color: lightColorScheme.secondary),
      selectedLabelTextStyle: TextStyle(
        color: lightColorScheme.primary,
        overflow: TextOverflow.ellipsis,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.43,
        letterSpacing: 0.25,
      ),
      unselectedLabelTextStyle: TextStyle(
        color: lightColorScheme.secondary,
        overflow: TextOverflow.ellipsis,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.43,
        letterSpacing: 0.25,
      ),
    ),
    cardTheme: CardTheme(
        surfaceTintColor: lightColorScheme.onSecondary,
        color: lightColorScheme.surface),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: white100),
    checkboxTheme:
        const CheckboxThemeData(fillColor: LightControlCheckboxFillColor()),
    radioTheme:
        const RadioThemeData(fillColor: LightControlRadioButtonsFillColor()),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith((states) {
        /// Disabled and selected
        if (states.contains(MaterialState.disabled) &&
            states.contains(MaterialState.selected)) {
          return grey300;
        }

        /// Enabled and selected
        else if (states.contains(MaterialState.selected)) {
          return positive200;
        }

        /// Disabled and not selected
        else if (states.contains(MaterialState.disabled)) {
          return grey300;
        }

        /// Enabled and not selected (default color)
        else {
          return grey200;
        }
      }),
      overlayColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.4)),
      thumbColor: MaterialStateProperty.resolveWith((states) {
        /// Disabled and selected
        if (states.contains(MaterialState.disabled) &&
            states.contains(MaterialState.selected)) {
          return darkColorScheme.onSurface.withOpacity(_disabledOpacity);
        }

        /// Enabled and selected
        else if (states.contains(MaterialState.selected)) {
          return white100;
        }

        /// Disabled and not selected
        else if (states.contains(MaterialState.disabled)) {
          return darkColorScheme.onSecondary.withOpacity(_disabledOpacity);
        }

        /// Enabled and not selected (default color)
        else {
          return darkColorScheme.onSecondary;
        }
      }),
    ),
    snackBarTheme: SnackBarThemeData(
      actionTextColor: lightColorScheme.primary,
      elevation: 4,
      behavior: SnackBarBehavior.floating,
    ),
    chipTheme: ChipThemeData(
      iconTheme: const IconThemeData(color: black900),
      checkmarkColor: black900,
      selectedColor: orange200,
      deleteIconColor: black900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(odsChipRadius),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: lightColorScheme.onPrimary,
      backgroundColor: lightColorScheme.primary,
    ),
    sliderTheme: SliderThemeData(
      showValueIndicator: ShowValueIndicator.always,
      inactiveTrackColor: grey300,
      overlayColor: grey600.withOpacity(0.2),
      activeTickMarkColor: grey300,
      inactiveTickMarkColor: grey600,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      linearTrackColor: lightColorScheme.tertiaryContainer,
    ),
    dialogTheme: const DialogTheme(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(90, 40),
        padding:
            const EdgeInsets.fromLTRB(spacingL, spacingS, spacingL, spacingS),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spacingS),
        ),
      ).copyWith(
        overlayColor: MaterialStateProperty.all<Color>(
            lightColorScheme.primaryContainer.withOpacity(0.12)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(90, 40),
        foregroundColor: lightColorScheme.secondary,
        padding:
            const EdgeInsets.fromLTRB(spacingL, spacingS, spacingL, spacingS),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spacingS),
        ),
      ).copyWith(
        overlayColor: MaterialStateProperty.all<Color>(
            lightColorScheme.primary.withOpacity(0.12)),
        side: MaterialStateProperty.resolveWith<BorderSide>((states) {
          if (states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.pressed)) {
            return BorderSide(
              color: lightColorScheme.primary,
            );
          }
          return BorderSide(
            color: lightColorScheme.secondary,
          );
        }),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(90, 40),
        padding:
            const EdgeInsets.fromLTRB(spacingS, spacingS, spacingS, spacingS),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spacingS),
        ),
      ),
    ),
    menuTheme: MenuThemeData(
      style: MenuStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(
          lightColorScheme.onSecondary,
        ),
        shadowColor: MaterialStateProperty.all(
          lightColorScheme.onSecondary,
        ),
        surfaceTintColor: MaterialStateProperty.all<Color>(
          Colors.white,
        ),
      ),
    ),
    menuButtonTheme: MenuButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return lightColorScheme.primary.withOpacity(0.3);
            }
            if (states.contains(MaterialState.hovered)) {
              return lightColorScheme.primary.withOpacity(0.3);
            }
            if (states.contains(MaterialState.focused)) {
              return lightColorScheme.primaryContainer;
            }
            return Colors.transparent;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return lightColorScheme.onSurface.withOpacity(0.28);
            }

            if (states.contains(MaterialState.focused)) {
              return lightColorScheme.primary;
            }

            return lightColorScheme.onSurface;
          },
        ),
        iconColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return lightColorScheme.onSurface.withOpacity(0.38);
          }
          if (states.contains(MaterialState.pressed)) {
            return lightColorScheme.onPrimary;
          }
          if (states.contains(MaterialState.hovered)) {
            return lightColorScheme.onPrimary;
          }
          if (states.contains(MaterialState.focused)) {
            return lightColorScheme.onPrimaryContainer;
          }
          return lightColorScheme.onSurfaceVariant;
        }),
        overlayColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return lightColorScheme.onPrimary.withOpacity(0.12);
          }
          if (states.contains(MaterialState.hovered)) {
            return lightColorScheme.onPrimary.withOpacity(0.08);
          }
          if (states.contains(MaterialState.focused)) {
            return lightColorScheme.onPrimaryContainer.withOpacity(0.12);
          }
          return Colors.transparent;
        }),
      ),
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return states.contains(MaterialState.selected) &&
                    !states.contains(MaterialState.disabled)
                ? lightColorScheme.primary
                : lightColorScheme.onSecondary;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            return !states.contains(MaterialState.disabled)
                ? lightColorScheme.secondary
                : null;
          },
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    typography: odsTypography,
    scaffoldBackgroundColor: black900,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkSurfaceDefault,
      surfaceTintColor: darkSurfaceDefault,
      systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: black900,
          systemNavigationBarDividerColor: white100,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark),
    ),
    navigationBarTheme: NavigationBarThemeData(
      surfaceTintColor: lightColorScheme.onSecondary,
      elevation: 3.0,
      indicatorColor: grey800,
      indicatorShape: null,
      iconTheme: MaterialStateProperty.resolveWith<IconThemeData?>((states) {
        if (states.contains(MaterialState.selected)) {
          return IconThemeData(color: darkColorScheme.primary);
        }
        return IconThemeData(color: darkColorScheme.secondary);
      }),
      labelTextStyle: MaterialStateProperty.resolveWith<TextStyle?>((states) {
        if (states.contains(MaterialState.selected)) {
          return TextStyle(
              color: darkColorScheme.primary,
              overflow: TextOverflow.ellipsis,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.43,
              letterSpacing: 0.25);
        }
        return TextStyle(
            color: darkColorScheme.secondary,
            overflow: TextOverflow.ellipsis,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.43,
            letterSpacing: 0.25);
      }),
    ),
    navigationRailTheme: NavigationRailThemeData(
      //surfaceTintColor: lightColorScheme.onSecondary,
      elevation: 3.0,
      indicatorColor: grey800,
      indicatorShape: null,
      selectedIconTheme: IconThemeData(color: darkColorScheme.primary),
      unselectedIconTheme: IconThemeData(color: darkColorScheme.secondary),
      selectedLabelTextStyle: TextStyle(
        color: darkColorScheme.primary,
        overflow: TextOverflow.ellipsis,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.43,
        letterSpacing: 0.25,
      ),
      unselectedLabelTextStyle: TextStyle(
        color: darkColorScheme.secondary,
        overflow: TextOverflow.ellipsis,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.43,
        letterSpacing: 0.25,
      ),
    ),
    cardTheme: CardTheme(
      surfaceTintColor: darkColorScheme.onSecondary,
      color: darkSurfaceDefault,
    ),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: darkSurfaceDefault),
    checkboxTheme: const CheckboxThemeData(
        fillColor: DarkControlCheckboxFillColor(),
        checkColor: MaterialStatePropertyAll(black900)),
    radioTheme:
        const RadioThemeData(fillColor: DarkControlRadioButtonsFillColor()),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith((states) {
        /// Disabled and selected
        if (states.contains(MaterialState.disabled) &&
            states.contains(MaterialState.selected)) {
          return grey800;
        }

        /// Enabled and selected
        else if (states.contains(MaterialState.selected)) {
          return positive100;
        }

        /// Disabled and not selected
        else if (states.contains(MaterialState.disabled)) {
          return grey900;
        }

        /// Enabled and not selected (default color)
        else {
          return grey600;
        }
      }),
      overlayColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.4)),
      thumbColor: MaterialStateProperty.resolveWith((states) {
        /// Disabled and selected
        if (states.contains(MaterialState.disabled) &&
            states.contains(MaterialState.selected)) {
          return darkColorScheme.onSurface.withOpacity(_disabledOpacity);
        }

        /// Enabled and selected
        else if (states.contains(MaterialState.selected)) {
          return white100;
        }

        /// Disabled and not selected
        else if (states.contains(MaterialState.disabled)) {
          return darkColorScheme.onSecondary.withOpacity(_disabledOpacity);
        }

        /// Enabled and not selected (default color)
        else {
          return darkColorScheme.onSecondary;
        }
      }),
    ),
    snackBarTheme: SnackBarThemeData(
      actionTextColor: darkColorScheme.primary,
      elevation: 4,
      behavior: SnackBarBehavior.floating,
    ),
    chipTheme: ChipThemeData(
      iconTheme: const IconThemeData(color: black900),
      checkmarkColor: darkColorScheme.onSecondary,
      selectedColor: orange200,
      deleteIconColor: darkColorScheme.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(odsChipRadius),
      ),
      labelStyle: const TextStyle(
        color: DarkChipLabelColor(),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: darkColorScheme.onPrimary,
      backgroundColor: darkColorScheme.primary,
    ),
    sliderTheme: SliderThemeData(
        showValueIndicator: ShowValueIndicator.always,
        inactiveTrackColor: grey600,
        overlayColor: grey600.withOpacity(0.3),
        activeTickMarkColor: grey600,
        inactiveTickMarkColor: grey500),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      linearTrackColor: darkColorScheme.tertiaryContainer,
    ),
    dialogTheme: const DialogTheme(
        backgroundColor: grey900,
        shadowColor: grey900,
        surfaceTintColor: grey900),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(90, 40),
        padding:
            const EdgeInsets.fromLTRB(spacingL, spacingS, spacingL, spacingS),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spacingS),
        ),
      ).copyWith(
        overlayColor: MaterialStateProperty.all<Color>(
            darkColorScheme.primaryContainer.withOpacity(0.12)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(90, 40),
        foregroundColor: darkColorScheme.secondary,
        padding:
            const EdgeInsets.fromLTRB(spacingL, spacingS, spacingL, spacingS),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spacingS),
        ),
      ).copyWith(
        overlayColor: MaterialStateProperty.all<Color>(
            darkColorScheme.primary.withOpacity(0.12)),
        side: MaterialStateProperty.resolveWith<BorderSide>((states) {
          if (states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.pressed)) {
            return BorderSide(
              color: darkColorScheme.primary,
            );
          }
          return BorderSide(
            color: darkColorScheme.secondary,
          );
        }),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(90, 40),
        padding:
            const EdgeInsets.fromLTRB(spacingS, spacingS, spacingS, spacingS),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spacingS),
        ),
      ),
    ),
    menuButtonTheme: MenuButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return darkColorScheme.primary.withOpacity(0.6);
            }
            if (states.contains(MaterialState.hovered)) {
              return darkColorScheme.primary.withOpacity(0.6);
            }
            if (states.contains(MaterialState.focused)) {
              return darkColorScheme.primaryContainer;
            }
            //return Colors.transparent;
            return darkSurfaceDefault;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return darkColorScheme.onSurface.withOpacity(0.28);
            }

            if (states.contains(MaterialState.focused)) {
              return darkColorScheme.primary;
            }

            return darkColorScheme.onSurface;
          },
        ),
        iconColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return darkColorScheme.onSurface.withOpacity(0.38);
          }
          if (states.contains(MaterialState.pressed)) {
            return darkColorScheme.onPrimary;
          }
          if (states.contains(MaterialState.hovered)) {
            return darkColorScheme.onPrimary;
          }
          if (states.contains(MaterialState.focused)) {
            return darkColorScheme.onPrimaryContainer;
          }
          return darkColorScheme.onSurfaceVariant;
        }),
        overlayColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return darkColorScheme.onPrimary.withOpacity(0.12);
          }
          if (states.contains(MaterialState.hovered)) {
            return darkColorScheme.onPrimary.withOpacity(0.08);
          }
          if (states.contains(MaterialState.focused)) {
            return darkColorScheme.onPrimaryContainer.withOpacity(0.12);
          }
          return Colors.transparent;
        }),
      ),
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (!states.contains(MaterialState.disabled)) {
              return states.contains(MaterialState.selected)
                  ? darkColorScheme.primary
                  : darkColorScheme.onSecondary;
            }
            return darkColorScheme.onSecondary;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) return null;

            return states.contains(MaterialState.selected)
                ? darkColorScheme.onSecondary
                : darkColorScheme.secondary;
          },
        ),
      ),
    ),
  );
}

/// Light theme fill color used by selection controls: Radio Buttons
class LightControlRadioButtonsFillColor extends MaterialStateColor {
  const LightControlRadioButtonsFillColor() : super(_defaultColor);

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

/// Light theme fill color used by selection controls: Checkbox
class LightControlCheckboxFillColor extends MaterialStateColor {
  const LightControlCheckboxFillColor() : super(_defaultColor);

  static const int _defaultColor = 0xff000000;

  @override
  Color resolve(Set states) {
    /// Disabled and selected
    if (states.contains(MaterialState.disabled) &&
        states.contains(MaterialState.selected)) {
      return lightColorScheme.onSurface.withOpacity(0.38);
    }

    /// Enabled and selected
    else if (states.contains(MaterialState.selected)) {
      return lightColorScheme.primary;
    }

    /// Disabled and not selected
    else if (states.contains(MaterialState.disabled)) {
      return lightColorScheme.onSecondary;
    }

    /// Enabled and not selected (default color)
    else {
      return lightColorScheme.onSecondary;
    }
  }
}

/// Dark theme fill color used by selection controls: Radio Buttons
class DarkControlRadioButtonsFillColor extends MaterialStateColor {
  const DarkControlRadioButtonsFillColor() : super(_defaultColor);

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

/// Dark theme fill color used by selection controls: Checkbox
class DarkControlCheckboxFillColor extends MaterialStateColor {
  const DarkControlCheckboxFillColor() : super(_defaultColor);

  static const int _defaultColor = 0xffffffff;

  @override
  Color resolve(Set states) {
    /// Disabled and selected
    if (states.contains(MaterialState.disabled) &&
        states.contains(MaterialState.selected)) {
      return darkColorScheme.onSurface.withOpacity(0.38);
    }

    /// Enabled and selected
    else if (states.contains(MaterialState.selected)) {
      return darkColorScheme.primary;
    }

    /// Disabled and not selected
    else if (states.contains(MaterialState.disabled)) {
      return darkColorScheme.onSecondary;
    }

    /// Enabled and not selected (default color)
    else {
      return darkColorScheme.onSecondary;
    }
  }
}

/// Dark theme fill color used by selection controls: Chip
class DarkChipLabelColor extends Color implements MaterialStateColor {
  const DarkChipLabelColor() : super(_default);

  static const int _default = 0xFF000000;

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return darkColorScheme.onSecondary; // Selected text color
    }
    return darkColorScheme.secondary; // normal text color
  }
}
