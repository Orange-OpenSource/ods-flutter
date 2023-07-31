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
      AppLocalizations.of(context)!.guidelinesTypography,
      'assets/il_typography.png',
      AppLocalizations.of(context)!.cardSmallVariantTitle,
      GuidelineTypographyScreen(),
    ),
    Guideline(
      AppLocalizations.of(context)!.guidelinesSpacings,
      'assets/il_spacing.png',
      AppLocalizations.of(context)!.cardSmallVariantTitle,
      GuidelineSpacingsScreen(),
    ),
  ];
}
