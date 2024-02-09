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
import 'package:ods_flutter/components/lists/ods_list_standard_item.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/guidelines/spacings/guideline_spacings_image.dart';
import 'package:ods_flutter_demo/ui/guidelines/spacings/spacing.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class GuidelineSpacingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Spacing> spacingItems = Spacing.values.toList();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: MainAppBar(AppLocalizations.of(context)!.guidelinesSpacings),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(spacingS),
                child: Image.asset(
                  'assets/il_spacing.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: spacingS),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacingM),
                child: Text(
                  AppLocalizations.of(context)!.guidelinesSpacingsDescription,
                ),
              ),
              SizedBox(
                height: spacingM,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: spacingItems.length,
                itemBuilder: (context, index) {
                  var spacing = spacingItems[index];

                  return OdsListStandardItem(
                    title: spacing.name,
                    subtitle: "${spacing.rawValue.toInt()} px",
                    image: GuidelineSpacingImage(
                      spacing: spacing.rawValue,
                    ),
                    text: spacing.ratio,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
