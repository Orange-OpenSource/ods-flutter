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
  // Display L > Android M2: Headline 1
  displayLarge: TextStyle(
      debugLabel: 'Display L',
      fontFamily: 'Roboto',
      fontSize: 97,
      fontWeight: FontWeight.w500,
      letterSpacing: -1.5),
  // Display M > Android M2: Headline 2
  displayMedium: TextStyle(
      debugLabel: 'Display M',
      fontFamily: 'Roboto',
      fontSize: 61,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.5),
  // Display S > Android M2: Headline 3
  displaySmall: TextStyle(
      debugLabel: 'Display S',
      fontFamily: 'Roboto',
      fontSize: 48,
      fontWeight: FontWeight.w500),

  // Headline L > Android M2: Headline 4
  headlineLarge: TextStyle(
      debugLabel: 'Headline L',
      fontFamily: 'Roboto',
      fontSize: 34,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.25),
  // Headline M > no correspondence
  headlineMedium: TextStyle(
      debugLabel: 'Headline M',
      fontFamily: 'Roboto',
      fontSize: 28,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.25),
  // Headline S > Android M2: Headline 5
  headlineSmall: TextStyle(
      debugLabel: 'Headline S',
      fontFamily: 'Roboto',
      fontSize: 24,
      fontWeight: FontWeight.w700),

  // Title L > Android M2: Headline 6
  titleLarge: TextStyle(
      debugLabel: 'Title L',
      fontFamily: 'Roboto',
      fontSize: 20,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.15),
  // Title M > Android M2: Subtitle 1
  titleMedium: TextStyle(
      debugLabel: 'Title M',
      fontFamily: 'Roboto',
      fontSize: 16,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.15),
  // Title S > Android M2: Subtitle 2
  titleSmall: TextStyle(
      debugLabel: 'Title S',
      fontFamily: 'Roboto',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.1),

  // Body L > Android M2: Body 1
  bodyLarge: TextStyle(
      debugLabel: 'Body L',
      fontFamily: 'Roboto',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5),
  // Body M > Android M2: Body 2
  bodyMedium: TextStyle(
      debugLabel: 'Body M',
      fontFamily: 'Roboto',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25),
  // Body S > Android M2: Caption
  bodySmall: TextStyle(
      debugLabel: 'Body S',
      fontFamily: 'Roboto',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4),

  // Label L > Android M2: Button
  labelLarge: TextStyle(
      debugLabel: 'Label L',
      fontFamily: 'Roboto',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25),
  // Label M > Android M2: NA
  labelMedium: TextStyle(
      debugLabel: 'Label M',
      fontFamily: 'Roboto',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25),
  // Label S > Android M2: Overline
  labelSmall: TextStyle(
      debugLabel: 'Label S',
      fontFamily: 'Roboto',
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5),
);

TextTheme iosTextTheme = const TextTheme(
  // Display L
  displayLarge: TextStyle(
      debugLabel: 'Display L',
      fontFamily: '.SF UI Display',
      fontSize: 97,
      fontWeight: FontWeight.w500,
      letterSpacing: -1.5),
  // Display M
  displayMedium: TextStyle(
      debugLabel: 'Display M',
      fontFamily: '.SF UI Display',
      fontSize: 61,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.5),
  // Display S
  displaySmall: TextStyle(
      debugLabel: 'Display S',
      fontFamily: '.SF UI Display',
      fontSize: 48,
      fontWeight: FontWeight.w500),

  // Headline L > iOS: Large Title
  headlineLarge: TextStyle(
      debugLabel: 'Headline L',
      fontFamily: '.SF UI Display',
      fontSize: 34,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.37),
  // Headline M > no correspondence
  headlineMedium: TextStyle(
      debugLabel: 'Headline M',
      fontFamily: '.SF UI Display',
      fontSize: 28,
      fontWeight: FontWeight.w700),
  // Headline S > iOS: Headline
  headlineSmall: TextStyle(
      debugLabel: 'Headline S',
      fontFamily: '.SF UI Display',
      fontSize: 17,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.41),

  // Title L > iOS: Title 1
  titleLarge: TextStyle(
      debugLabel: 'Title L',
      fontFamily: '.SF UI Display',
      fontSize: 28,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.36),
  // Title M > iOS: Title 2
  titleMedium: TextStyle(
      debugLabel: 'Title M',
      fontFamily: '.SF UI Display',
      fontSize: 22,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.35),
  // Title S > iOS: Title 3
  titleSmall: TextStyle(
      debugLabel: 'Title S',
      fontFamily: '.SF UI Display',
      fontSize: 20,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.38),

  // Body L > iOS: Body
  bodyLarge: TextStyle(
      debugLabel: 'Body L',
      fontFamily: '.SF UI Display',
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.41),
  // Body M > iOS: Callout
  bodyMedium: TextStyle(
      debugLabel: 'Body M',
      fontFamily: '.SF UI Display',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.32),
  // Body S > iOS: Subheadline
  bodySmall: TextStyle(
      debugLabel: 'Body S',
      fontFamily: '.SF UI Display',
      fontSize: 15,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5),

  // Label L > iOS: Footnote
  labelLarge: TextStyle(
      debugLabel: 'Label L',
      fontFamily: '.SF UI Display',
      fontSize: 13,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.08),
  // Label M > iOS: Caption 1
  labelMedium: TextStyle(
      debugLabel: 'Label M',
      fontFamily: '.SF UI Display',
      fontSize: 12,
      fontWeight: FontWeight.w400),
  // Label S > iOS: Caption 2
  labelSmall: TextStyle(
      debugLabel: 'Label S',
      fontFamily: '.SF UI Display',
      fontSize: 11,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.08),
);
