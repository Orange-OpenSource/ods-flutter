import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Typography odsTypography = Typography.material2021(
  platform: defaultTargetPlatform,
  black: _getPlatformTypography(),
  white: _getPlatformTypography(),
);

_getPlatformTypography() {
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    return iosTextTheme;
  } else {
    return androidTextTheme;
  }
}

TextTheme androidTextTheme = const TextTheme(
  // Headline L > Android M2: Headline 4
  headlineLarge: TextStyle(
      debugLabel: 'Headline L',
      fontFamily: 'Roboto',
      fontSize: 32,
      fontWeight: FontWeight.w400,
      height: 1.25,
      letterSpacing: 0),
  // Headline M > no correspondence
  headlineMedium: TextStyle(
      debugLabel: 'Headline M',
      fontFamily: 'Roboto',
      fontSize: 28,
      fontWeight: FontWeight.w400,
      height: 1.29,
      letterSpacing: 0),
  // Headline S > Android M2: Headline 5
  headlineSmall: TextStyle(
      debugLabel: 'Headline S',
      fontFamily: 'Roboto',
      fontSize: 24,
      fontWeight: FontWeight.w400,
      height: 1.33,
      letterSpacing: 0),

  // Title L > Android M2: Headline 6
  titleLarge: TextStyle(
      debugLabel: 'Title L',
      fontFamily: 'Roboto',
      fontSize: 22,
      fontWeight: FontWeight.w400,
      height: 1.27,
      letterSpacing: 0),
  // Title M > Android M2: Subtitle 1
  titleMedium: TextStyle(
      debugLabel: 'Title M',
      fontFamily: 'Roboto',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
      letterSpacing: 0.15),
  // Title S > Android M2: Subtitle 2
  titleSmall: TextStyle(
      debugLabel: 'Title S',
      fontFamily: 'Roboto',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.5,
      letterSpacing: 0.1),

  // Body L > Android M2: Body 1
  bodyLarge: TextStyle(
      debugLabel: 'Body L',
      fontFamily: 'Roboto',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
      letterSpacing: 0.5),
  // Body M > Android M2: Body 2
  bodyMedium: TextStyle(
      debugLabel: 'Body M',
      fontFamily: 'Roboto',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.43,
      letterSpacing: 0.25),
  // Body S > Android M2: Caption
  bodySmall: TextStyle(
      debugLabel: 'Body S',
      fontFamily: 'Roboto',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.33,
      letterSpacing: 0.4),

  // Label L > Android M2: Button
  labelLarge: TextStyle(
      debugLabel: 'Label L',
      fontFamily: 'Roboto',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.43,
      letterSpacing: 0.1),
  // Label M > Android M2: NA
  labelMedium: TextStyle(
      debugLabel: 'Label M',
      fontFamily: 'Roboto',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.33,
      letterSpacing: 0.5),
  // Label S > Android M2: Overline
  labelSmall: TextStyle(
      debugLabel: 'Label S',
      fontFamily: 'Roboto',
      fontSize: 11,
      fontWeight: FontWeight.w500,
      height: 1.45,
      letterSpacing: 0.5),
);

/*
M3 Reference in Flutter implementation
    displayLarge: TextStyle(fontSize: 57.0, fontWeight: FontWeight.w400, letterSpacing: -0.25, height: 1.12),
    displayMedium: TextStyle(fontSize: 45.0, fontWeight: FontWeight.w400, letterSpacing: 0.0, height: 1.16),
    displaySmall: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w400, letterSpacing: 0.0, height: 1.22),
    headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w400, letterSpacing: 0.0, height: 1.25),
    headlineMedium: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w400, letterSpacing: 0.0, height: 1.29),
    headlineSmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400, letterSpacing: 0.0, height: 1.33),
    titleLarge: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w400, letterSpacing: 0.0, height: 1.27),
    titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.15, height: 1.50),
    titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 0.1, height: 1.43),
    bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, letterSpacing: 0.5, height: 1.50),
    bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, letterSpacing: 0.25, height: 1.43),
    bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, letterSpacing: 0.4, height: 1.33),
    labelLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 0.1, height: 1.43),
    labelMedium: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500, letterSpacing: 0.5, height: 1.33),
    labelSmall: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w500, letterSpacing: 0.5, height: 1.45),
 */

TextTheme iosTextTheme = const TextTheme(
  // Headline L > iOS: Large Title
  headlineLarge: TextStyle(
      debugLabel: 'Headline L',
      fontFamily: '.SF UI Display',
      fontSize: 32,
      fontWeight: FontWeight.w700,
      height: 1.25,
      letterSpacing: 0),
  // Headline M > no correspondence
  headlineMedium: TextStyle(
      debugLabel: 'Headline M',
      fontFamily: '.SF UI Display',
      fontSize: 28,
      fontWeight: FontWeight.w700,
      height: 1.29,
      letterSpacing: 0),
  // Headline S > iOS: Headline
  headlineSmall: TextStyle(
      debugLabel: 'Headline S',
      fontFamily: '.SF UI Display',
      fontSize: 24,
      fontWeight: FontWeight.w700,
      height: 1.33,
      letterSpacing: 0),

  // Title L > iOS: Title 1
  titleLarge: TextStyle(
      debugLabel: 'Title L',
      fontFamily: '.SF UI Display',
      fontSize: 22,
      fontWeight: FontWeight.w700,
      height: 1.27,
      letterSpacing: 0),
  // Title M > iOS: Title 2
  titleMedium: TextStyle(
      debugLabel: 'Title M',
      fontFamily: '.SF UI Display',
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 1.5,
      letterSpacing: 0.15),
  // Title S > iOS: Title 3
  titleSmall: TextStyle(
      debugLabel: 'Title S',
      fontFamily: '.SF UI Display',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      height: 1.43,
      letterSpacing: 0.1),

  // Body L > iOS: Body
  bodyLarge: TextStyle(
      debugLabel: 'Body L',
      fontFamily: '.SF UI Display',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
      letterSpacing: 0.5),
  // Body M > iOS: Callout
  bodyMedium: TextStyle(
      debugLabel: 'Body M',
      fontFamily: '.SF UI Display',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.43,
      letterSpacing: 0.25),
  // Body S > iOS: Subheadline
  bodySmall: TextStyle(
      debugLabel: 'Body S',
      fontFamily: '.SF UI Display',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.33,
      letterSpacing: 0.4),

  // Label L > iOS: Footnote
  labelLarge: TextStyle(
      debugLabel: 'Label L',
      fontFamily: '.SF UI Display',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.43,
      letterSpacing: 0.1),
  // Label M > iOS: Caption 1
  labelMedium: TextStyle(
      debugLabel: 'Label M',
      fontFamily: '.SF UI Display',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.33,
      letterSpacing: 0.5),
  // Label S > iOS: Caption 2
  labelSmall: TextStyle(
      debugLabel: 'Label S',
      fontFamily: '.SF UI Display',
      fontSize: 11,
      fontWeight: FontWeight.w500,
      height: 1.45,
      letterSpacing: 0.5),
);
