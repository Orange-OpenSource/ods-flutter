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
import 'package:ods_flutter/components/app_bar/top/ods_top_app_bar.dart';
import 'package:ods_flutter/components/chips/ods_choice_chips.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/progress/ods_circular_progress_indicator.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/l10n/l10n.dart';
import 'package:ods_flutter_demo/ui/components/progress/progress_customization.dart';
import 'package:ods_flutter_demo/ui/components/progress/progress_enum.dart';
import 'package:ods_flutter_demo/ui/theme/theme_selector.dart';

class ComponentProgressCircular extends StatelessWidget {
  const ComponentProgressCircular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ProgressCustomization(
      child: Scaffold(
        bottomSheet: OdsSheetsBottom(
          sheetContent: _CustomizationContent(),
          title: l10n.componentCustomizeTitle,
        ),
        appBar: OdsAppTopBar(
            title: l10n.progressCircularVariantTitle,
            actions: [ThemeSelector()],
            navigationIcon: BackButton()),
        body: SafeArea(child: _Body()),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final ProgressCustomizationState? customizationState =
        ProgressCustomization.of(context);

    double? currentProgressValue;
    switch (customizationState?.selectedProgressType ?? "") {
      case ProgressEnum.determinate:
        currentProgressValue = 0.9;
        break;
      case ProgressEnum.indeterminate:
        currentProgressValue = null;
        break;
    }

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(spacingL),
          child: OdsCircularProgressIndicator(
              progress: currentProgressValue,
              label: customizationState?.hasLabel == true
                  ? l10n.progressCircularVariantExampleLabel
                  : null),
        ),
      ),
    );
  }
}

class _CustomizationContent extends StatefulWidget {
  @override
  State<_CustomizationContent> createState() => _CustomizationContentState();
}

class _CustomizationContentState extends State<_CustomizationContent> {
  int selectedLeadingIndex = 0;
  bool isFiltered = true;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final ProgressCustomizationState? customizationState =
        ProgressCustomization.of(context);
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(spacingM),
            child: Text(
              l10n.componentCustomizeProgressType,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List<Widget>.generate(
                  customizationState!.progressType.length, (int index) {
                ProgressEnum currentElement =
                    customizationState.progressType[index];
                bool isSelected =
                    currentElement == customizationState.selectedProgressType;
                return Padding(
                  padding: EdgeInsets.only(right: spacingXs, left: spacingS),
                  child: OdsChoiceChip(
                    text: customizationState.progressType[index]
                        .stringValue(l10n),
                    onClick: (selected) {
                      setState(
                        () {
                          selectedLeadingIndex = index;
                          isFiltered = selected!;
                          customizationState.selectedProgressType =
                              customizationState.progressType[index];
                        },
                      );
                    },
                    selected: isSelected,
                  ),
                );
              }),
            ),
          ),
        ),
        OdsListSwitch(
          title: l10n.componentCustomizeProgressLabel,
          checked: customizationState.hasLabel,
          onCheckedChange: (bool value) {
            customizationState.hasLabel = value;
          },
        ),
      ],
    );
  }
}
