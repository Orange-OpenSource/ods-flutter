import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OdsTheme {
  OdsTheme._();

  static ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(backgroundColor: lightColorScheme.surface),
  );

  static ThemeData darkTheme = ThemeData(
      colorScheme: darkColorScheme,
      textTheme: textTheme,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: darkColorScheme.background));
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFFF16E00),
  onPrimary: Color(0xFF000000),
  primaryContainer: Color(0xFFFFDBCA),
  onPrimaryContainer: Color(0xFF331200),
  // primaryFixed: Color(0xFFFFDBCA),
  // onPrimaryFixed: Color(0xFF331200),
  // primaryFixedDim: Color(0xFFFFB68E),
  // onPrimaryFixedVariant: Color(0xFF773300),
  secondary: Color(0xFF000000),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFF333333),
  onSecondaryContainer: Color(0xFFFFFFFF),
  // secondaryFixed: Color(0xFF999999),
  // onSecondaryFixed: Color(0xFF000000),
  // secondaryFixedDim: Color(0xFF595959),
  // onSecondaryFixedVariant: Color(0xFFFFFFFF),
  tertiary: Color(0xFF666666),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFCCCCCC),
  onTertiaryContainer: Color(0xFF000000),
  // tertiaryFixed: Color(0xFFEEEEEE),
  // onTertiaryFixed: Color(0xFF000000),
  // tertiaryFixedDim: Color(0xFFDDDDDD),
  // onTertiaryFixedVariant: Color(0xFF000000),
  error: Color(0xFFCD3C14),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF410002),
  outline: Color(0xFF000000),
  background: Color(0xFFFFFFFF),
  onBackground: Color(0xFF000000),
  surface: Color(0xFFFFFFFF),
  onSurface: Color(0xFF000000),
  surfaceVariant: Color(0xFFEEEEEE),
  onSurfaceVariant: Color(0xFF000000),
  inverseSurface: Color(0xFF362F2C),
  onInverseSurface: Color(0xFFFFFFFF),
  inversePrimary: Color(0xFFFFB68E),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF9C4500),
  outlineVariant: Color(0xFFD7C2B9),
  scrim: Color(0xFF000000),
  // surfaceContainerHighest: Color(0xFF666666),
  // surfaceContainerHigh: Color(0xFF999999),
  // surfaceContainer: Color(0xFFCCCCCC),
  // surfaceContainerLow: Color(0xFFDDDDDD),
  // surfaceContainerLowest: Color(0xFFFFFFFF),
  // surfaceBright: Color(0xFFEEEEEE),
  // surfaceDim: Color(0xFFCCCCCC),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFFF7900),
  onPrimary: Color(0xFF000000),
  primaryContainer: Color(0xFF773300),
  onPrimaryContainer: Color(0xFFFFDBCA),
  // primaryFixed: Color(0xFFFFDBCA),
  // onPrimaryFixed: Color(0xFF331200),
  // primaryFixedDim: Color(0xFFFFB68E),
  // onPrimaryFixedVariant: Color(0xFF773300),
  secondary: Color(0xFFFFFFFF),
  onSecondary: Color(0xFF000000),
  secondaryContainer: Color(0xFFCCCCCC),
  onSecondaryContainer: Color(0xFF000000),
  // secondaryFixed: Color(0xFF999999),
  // onSecondaryFixed: Color(0xFF000000),
  // secondaryFixedDim: Color(0xFF595959),
  // onSecondaryFixedVariant: Color(0xFFFFFFFF),
  tertiary: Color(0xFFCCCCCC),
  onTertiary: Color(0xFF000000),
  tertiaryContainer: Color(0xFF333333),
  onTertiaryContainer: Color(0xFFFFFFFF),
  // tertiaryFixed: Color(0xFFEEEEEE),
  // onTertiaryFixed: Color(0xFF000000),
  // tertiaryFixedDim: Color(0xFFDDDDDD),
  // onTertiaryFixedVariant: Color(0xFF000000),
  error: Color(0xFFD53F15),
  onError: Color(0xFF000000),
  errorContainer: Color(0xFF93000A),
  onErrorContainer: Color(0xFFFFDAD6),
  outline: Color(0xFFEEEEEE),
  background: Color(0xFF000000),
  onBackground: Color(0xFFEEEEEE),
  surface: Color(0xFF000000),
  onSurface: Color(0xFFEEEEEE),
  surfaceVariant: Color(0xFF000000),
  onSurfaceVariant: Color(0xFFEEEEEE),
  inverseSurface: Color(0xFFEEEEEE),
  onInverseSurface: Color(0xFF000000),
  inversePrimary: Color(0xFF9C4500),
  shadow: Color(0xFFFFFFFF),
  surfaceTint: Color(0xFFFFB68E),
  outlineVariant: Color(0xFF52443C),
  scrim: Color(0xFF000000),
  // surfaceContainerHighest: Color(0xFFCCCCCC),
  // surfaceContainerHigh: Color(0xFF999999),
  // surfaceContainer: Color(0xFF666666),
  // surfaceContainerLow: Color(0xFF595959),
  // surfaceContainerLowest: Color(0xFF333333),
  // surfaceBright: Color(0xFF666666),
  // surfaceDim: Color(0xFF333333),
);

final TextTheme textTheme = TextTheme(
  displayLarge: GoogleFonts.roboto(
      fontSize: 97, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  displayMedium: GoogleFonts.roboto(
      fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  displaySmall: GoogleFonts.roboto(fontSize: 48, fontWeight: FontWeight.w400),
  headlineMedium: GoogleFonts.roboto(
      fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headlineSmall: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w400),
  titleLarge: GoogleFonts.roboto(
      fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  titleMedium: GoogleFonts.roboto(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  titleSmall: GoogleFonts.roboto(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyLarge: GoogleFonts.roboto(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyMedium: GoogleFonts.roboto(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  labelLarge: GoogleFonts.roboto(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  bodySmall: GoogleFonts.roboto(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  labelSmall: GoogleFonts.roboto(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
