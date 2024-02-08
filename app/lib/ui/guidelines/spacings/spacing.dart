/*
 * Software Name : Orange Design System
 * SPDX-FileCopyrightText: Copyright (c) Orange SA
 * SPDX-License-Identifier: MIT
 *
 * This software is distributed under the MIT licence,
 * the text of which is available at https://opensource.org/license/MIT/
 * or see the "LICENSE" file for more details.
 *
 * Software description: Flutter library of reusable graphical components for Android and iOS
 */

import 'package:ods_flutter/guidelines/spacings.dart';

enum Spacing {
  none,
  xs,
  s,
  m,
  l,
  xl,
  xxl,
}

extension SpacingProperties on Spacing {
  double get rawValue {
    switch (this) {
      case Spacing.none:
        return spacingNone;
      case Spacing.xs:
        return spacingXs;
      case Spacing.s:
        return spacingS;
      case Spacing.m:
        return spacingM;
      case Spacing.l:
        return spacingL;
      case Spacing.xl:
        return spacingXl;
      case Spacing.xxl:
        return spacingXxl;
    }
  }

  String get name {
    switch (this) {
      case Spacing.none:
        return "spacingNone";
      case Spacing.xs:
        return "spacingXs";
      case Spacing.s:
        return "spacingS";
      case Spacing.m:
        return "spacingM";
      case Spacing.l:
        return "spacingL";
      case Spacing.xl:
        return "spacingXl";
      case Spacing.xxl:
        return "spacingXxl";
    }
  }

  String get ratio {
    switch (this) {
      case Spacing.none:
        return "Ratio -";
      case Spacing.xs:
        return "Ratio 0.5";
      case Spacing.s:
        return "Ratio 1";
      case Spacing.m:
        return "Ratio 2";
      case Spacing.l:
        return "Ratio 3";
      case Spacing.xl:
        return "Ratio 4";
      case Spacing.xxl:
        return "Ratio 5";
    }
  }

  String get ratioSpokenValue {
    switch (this) {
      case Spacing.none:
        return "0";
      case Spacing.xs:
        return "0.5";
      case Spacing.s:
        return "1";
      case Spacing.m:
        return "2";
      case Spacing.l:
        return "3";
      case Spacing.xl:
        return "4";
      case Spacing.xxl:
        return "5";
    }
  }

  String get accessibilityLabel {
    return "${rawValue.toInt()} ${rawValue < 2 ? "pixel" : "pixels"}, "
        "Token name: $name, "
        "Ratio: $ratioSpokenValue";
  }
}
