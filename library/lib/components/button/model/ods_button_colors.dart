import 'package:flutter/material.dart';

class OdsButtonColors {
  final Color background;
  final Color text;
  final Color? icon;
  final Color? textDisabled;

  OdsButtonColors(
      {required this.background,
      required this.text,
      this.icon,
      this.textDisabled});
}

enum OdsButtonStyle {
  functionalPositive,
  functionalNegative,
  functionalPrimary,
  functionalDefault,
}
