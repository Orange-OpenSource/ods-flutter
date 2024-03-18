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
import 'package:ods_flutter/components/lists/ods_list_item.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/l10n/l10n.dart';
import 'package:ods_flutter_demo/ui/guidelines/spacings/guideline_spacings_image.dart';
import 'package:ods_flutter_demo/ui/guidelines/spacings/spacing.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class GuidelineSpacingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    const spacingItems = Spacing.values;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: MainAppBar(l10n.guidelinesSpacings),
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
                  l10n.guidelinesSpacingsDescription,
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

                  return OdsListItem(
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
