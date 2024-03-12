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

import 'package:ods_flutter_demo/l10n/gen/ods_flutter_app_localizations.dart';
import 'package:ods_flutter_demo/ui/guidelines/colours/palette/coulour_palette.dart';
import 'package:ods_flutter_demo/ui/guidelines/colours/theme/colour_theme.dart';
import 'package:ods_flutter_demo/ui/guidelines/guidelines_entities.dart';
import 'package:ods_flutter_demo/ui/guidelines/spacings/guideline_spacings_screen.dart';
import 'package:ods_flutter_demo/ui/guidelines/typography/guideline_typography_screen.dart';

List<Guideline> guidelines(AppLocalizations l10n) {
  return [
    Guideline.withVariant(
      l10n.guidelinesColours,
      'assets/il_color.png',
      l10n.guidelinesColoursDescription,
      [
        Variant(
          l10n.guidelinesColoursThemeVariantTitle,
          l10n.guidelinesColoursThemeVariantSubtitle,
          ColourTheme(),
        ),
        Variant(
          l10n.guidelinesColoursPaletteVariantTitle,
          l10n.guidelinesColoursPaletteVariantSubtitle,
          ColourPalette(),
        ),
      ],
    ),
    Guideline(
      l10n.guidelinesSpacings,
      'assets/il_spacing.png',
      l10n.cardSmallVariantTitle,
      GuidelineSpacingsScreen(),
    ),
    Guideline(
      l10n.guidelinesTypography,
      'assets/il_typography.png',
      l10n.cardSmallVariantTitle,
      GuidelineTypographyScreen(),
    ),
  ];
}
