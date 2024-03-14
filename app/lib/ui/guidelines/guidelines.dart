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
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter_demo/ui/guidelines/colours/palette/coulour_palette.dart';
import 'package:ods_flutter_demo/ui/guidelines/colours/theme/colour_theme.dart';
import 'package:ods_flutter_demo/ui/guidelines/guidelines_entities.dart';
import 'package:ods_flutter_demo/ui/guidelines/spacings/guideline_spacings_screen.dart';
import 'package:ods_flutter_demo/ui/guidelines/typography/guideline_typography_screen.dart';

List<Guideline> guidelines(BuildContext context) {
  return [
    Guideline.withVariant(
      AppLocalizations.of(context)!.guidelinesColours,
      'assets/il_color.png',
      AppLocalizations.of(context)!.guidelinesColoursDescription,
      [
        Variant(
          AppLocalizations.of(context)!.guidelinesColoursThemeVariantTitle,
          AppLocalizations.of(context)!.guidelinesColoursThemeVariantSubtitle,
          ColourTheme(),
        ),
        Variant(
          AppLocalizations.of(context)!.guidelinesColoursPaletteVariantTitle,
          AppLocalizations.of(context)!.guidelinesColoursPaletteVariantSubtitle,
          ColourPalette(),
        ),
      ],
    ),
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
