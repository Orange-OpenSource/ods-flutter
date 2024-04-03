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
import 'package:ods_flutter/components/app_bar/top/ods_top_app_bar.dart';
import 'package:ods_flutter/components/chips/ods_choice_chips.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/progress/ods_linear_progress_indicator.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/progress/progress_customization.dart';
import 'package:ods_flutter_demo/ui/components/progress/progress_enum.dart';
import 'package:ods_flutter_demo/ui/theme/theme_selector.dart';

class ComponentProgressLinear extends StatelessWidget {
  const ComponentProgressLinear({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProgressCustomization(
      child: Scaffold(
        bottomSheet: OdsSheetsBottom(
          sheetContent: _CustomizationContent(),
          title: AppLocalizations.of(context)!.componentCustomizeTitle,
        ),
        appBar: OdsAppTopBar(
            title: AppLocalizations.of(context)!.progressLinearVariantTitle,
            actions: [ThemeSelector()],
            navigationIcon: BackButton()),
        body: SafeArea(child: _Body()),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.all(spacingM),
          child: OdsLinearProgressIndicator(
              progress: currentProgressValue,
              label: customizationState?.hasLabel == true
                  ? AppLocalizations.of(context)!
                      .progressCircularVariantExampleLabel
                  : null,
              icon: customizationState?.hasIcon == true
                  ? const Icon(Icons.download)
                  : null,
              showCurrentValue:
                  customizationState?.hasCurrentValue == true ? true : null),
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
    final ProgressCustomizationState? customizationState =
        ProgressCustomization.of(context);
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(spacingM),
            child: Text(
              AppLocalizations.of(context)!.componentCustomizeProgressType,
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
                        .stringValue(context),
                    onClick: (selected) {
                      setState(
                        () {
                          selectedLeadingIndex = index;
                          isFiltered = selected!;
                          customizationState.selectedProgressType =
                              customizationState.progressType[index];

                          if (customizationState.selectedProgressType ==
                              ProgressEnum.indeterminate) {
                            customizationState.hasCurrentValue = false;
                          }
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
          title: AppLocalizations.of(context)!.componentCustomizeProgressLabel,
          checked: customizationState.hasLabel,
          onCheckedChange: (bool value) {
            customizationState.hasLabel = value;
          },
        ),
        OdsListSwitch(
          title: AppLocalizations.of(context)!.componentCustomizeProgressIcon,
          checked: customizationState.hasIcon,
          onCheckedChange: (bool value) {
            customizationState.hasIcon = value;
          },
        ),
        OdsListSwitch(
          title: AppLocalizations.of(context)!
              .componentCustomizeProgressCurrentValue,
          checked: customizationState.hasCurrentValue,
          onCheckedChange: customizationState.selectedProgressType ==
                  ProgressEnum.determinate
              ? (bool value) {
                  customizationState.hasCurrentValue = value;
                }
              : null,
        ),
      ],
    );
  }
}
