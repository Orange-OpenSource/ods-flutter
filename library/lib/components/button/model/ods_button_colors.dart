import 'package:flutter/material.dart';

class OdsButtonColors {
  final Color background;
  final Color text;
  final Color? icon;

  OdsButtonColors(this.background, this.text, [this.icon]);
}

enum OdsTextButtonStyle {
  functionalPositive,
  functionalNegative,
  functionalPrimary,
  functionalDefault,
}
