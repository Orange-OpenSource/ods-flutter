import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextTheme textTheme = TextTheme(
  // Display L > Android M2: Headline 1
  displayLarge: GoogleFonts.roboto(
      fontSize: 97, fontWeight: FontWeight.w500, letterSpacing: -1.5),
  // Display M > Android M2: Headline 2
  displayMedium: GoogleFonts.roboto(
      fontSize: 61, fontWeight: FontWeight.w500, letterSpacing: -0.5),
  // Display S > Android M2: Headline 3
  displaySmall: GoogleFonts.roboto(fontSize: 48, fontWeight: FontWeight.w500),
  // Headline L > Android M2: Headline 4 & iOS: Large Title
  headlineLarge: GoogleFonts.roboto(
      fontSize: 34, fontWeight: FontWeight.w700, letterSpacing: 0.25),
  // Headline M > no correspondence
  headlineMedium: GoogleFonts.roboto(
      fontSize: 28, fontWeight: FontWeight.w700, letterSpacing: 0.25),
  // Headline S > Android M2: Headline 5 & iOS: Headline
  headlineSmall: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w700),
  // Title L > Android M2: Headline 6 & iOS: Title 1
  titleLarge: GoogleFonts.roboto(
      fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: 0.15),
  // Title M > Android M2: Subtitle 1 & iOS: Title 2
  titleMedium: GoogleFonts.roboto(
      fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 0.15),
  // Title S > Android M2: Subtitle 2 & iOS: Title 3
  titleSmall: GoogleFonts.roboto(
      fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 0.1),
  // Body L > Android M2: Body 1 & iOS: Body
  bodyLarge: GoogleFonts.roboto(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  // Body M > Android M2: Body 2 & iOS: Callout
  bodyMedium: GoogleFonts.roboto(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  // Body S > Android M2: Caption & iOS: Subheadline
  bodySmall: GoogleFonts.roboto(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  // Label L > Android M2: Button & iOS: Footnote
  labelLarge: GoogleFonts.roboto(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  // Label M > Android M2: NA & iOS: Caption 1
  labelMedium: GoogleFonts.roboto(
      fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  // Label S > Android M2: Overline & iOS: Caption 2
  labelSmall: GoogleFonts.roboto(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
