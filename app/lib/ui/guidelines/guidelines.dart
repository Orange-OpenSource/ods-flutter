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

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter_demo/ui/guidelines/colours/guideline_colours_screen.dart';
import 'package:ods_flutter_demo/ui/guidelines/guidelines_entities.dart';
import 'package:ods_flutter_demo/ui/guidelines/spacings/guideline_spacings_screen.dart';
import 'package:ods_flutter_demo/ui/guidelines/typography/guideline_typography_screen.dart';

List<Guideline> guidelines(BuildContext context) {
  return [
    Guideline(
        AppLocalizations.of(context)!.guidelinesColours,
        'assets/il_color.png',
        AppLocalizations.of(context)!.cardSmallVariantTitle,
        GuidelineColoursScreen()),
    Guideline(
      AppLocalizations.of(context)!.guidelinesSpacings,
      'assets/il_spacing.png',
      AppLocalizations.of(context)!.cardSmallVariantTitle,
      GuidelineSpacingsScreen(),
    ),
    Guideline(
      AppLocalizations.of(context)!.guidelinesTypography,
      'assets/il_typography.png',
      AppLocalizations.of(context)!.cardSmallVariantTitle,
      GuidelineTypographyScreen(),
    ),
  ];
}
