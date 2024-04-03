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
import 'package:ods_flutter/components/button/segmented/ods_segmented_button.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/buttons/segmented/segmented_button_customization.dart';
import 'package:ods_flutter_demo/ui/components/buttons/segmented/segmented_button_enum.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';
import 'package:ods_flutter_demo/ui/utilities/component_count_row.dart';

enum Foods { ham, milk, figs, eggs, oil }

class SegmentedButtons extends StatelessWidget {
  SegmentedButtons({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SegmentedButtonCustomization(
      child: Scaffold(
          bottomSheet: OdsSheetsBottom(
            sheetContent: _CustomizationContent(),
            title: AppLocalizations.of(context)!.componentCustomizeTitle,
          ),
          key: _scaffoldKey,
          appBar: MainAppBar(
              AppLocalizations.of(context)!.segmentedButtonsVariantTitle),
          body: _Body()),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  ///Single Choice
  Foods foodsView = Foods.ham;

  ///Multi Choice
  Set<Foods> selectionMulti = <Foods>{Foods.ham, Foods.milk};

  @override
  Widget build(BuildContext context) {
    final SegmentedButtonCustomizationState? customizationState =
        SegmentedButtonCustomization.of(context);

    return Padding(
      padding:
          const EdgeInsets.only(top: spacingS, left: spacingM, right: spacingM),
      child: Center(
        child: Column(
          children: [
            OdsSegmentedButton<Foods>(
              enabled: customizationState?.hasEnabled == true ? true : false,
              segments: _buttonSegmentList(context)
                  .sublist(0, customizationState?.numberOfItems),
              selected: customizationState?.selectedElement ==
                      SegmentedButtonsEnum.single
                  ? <Foods>{foodsView}
                  : selectionMulti,
              onSelectionChanged: customizationState?.selectedElement ==
                      SegmentedButtonsEnum.single
                  ? (Set<Foods> newSelection) {
                      setState(
                        () {
                          foodsView = newSelection.last;
                        },
                      );
                    }
                  : (Set<Foods> newSelection) {
                      setState(() {
                        selectionMulti = newSelection;
                      });
                    },
            ),
          ],
        ),
      ),
    );
  }

  List<ButtonSegment<Foods>> _buttonSegmentList(BuildContext context) {
    final SegmentedButtonCustomizationState? customizationState =
        SegmentedButtonCustomization.of(context);

    return <ButtonSegment<Foods>>[
      ButtonSegment<Foods>(
        value: Foods.ham,
        label: Text(
          OdsApplication.foods[32].name,
        ),
        icon: customizationState!.hasIcon ? Icon(Icons.restaurant) : null,
      ),
      ButtonSegment<Foods>(
        value: Foods.milk,
        label: Text(
          OdsApplication.foods[10].name,
        ),
        icon: customizationState.hasIcon ? Icon(Icons.restaurant) : null,
      ),
      ButtonSegment<Foods>(
        value: Foods.figs,
        label: Text(
          OdsApplication.foods[18].name,
        ),
        icon: customizationState.hasIcon ? Icon(Icons.restaurant) : null,
      ),
      ButtonSegment<Foods>(
        value: Foods.eggs,
        label: Text(
          OdsApplication.foods[19].name,
        ),
        icon: customizationState.hasIcon ? Icon(Icons.restaurant) : null,
      ),
      ButtonSegment<Foods>(
        value: Foods.oil,
        label: Text(
          OdsApplication.foods[25].name,
        ),
        icon: customizationState.hasIcon ? Icon(Icons.restaurant) : null,
      ),
    ];
  }
}

class _CustomizationContent extends StatefulWidget {
  @override
  State<_CustomizationContent> createState() => _CustomizationContentState();
}

class _CustomizationContentState extends State<_CustomizationContent> {
  ///Single Choice
  SegmentedButtonsEnum selectView = SegmentedButtonsEnum.single;

  @override
  Widget build(BuildContext context) {
    final SegmentedButtonCustomizationState? customizationState =
        SegmentedButtonCustomization.of(context);

    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(spacingM),
                child: Text(AppLocalizations.of(context)!.componentElementTypes,
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  OdsSegmentedButton<SegmentedButtonsEnum>(
                    segments: <ButtonSegment<SegmentedButtonsEnum>>[
                      ButtonSegment<SegmentedButtonsEnum>(
                        value: SegmentedButtonsEnum.multi,
                        label: Text(
                            SegmentedButtonsEnum.multi.stringValue(context)),
                      ),
                      ButtonSegment<SegmentedButtonsEnum>(
                        value: SegmentedButtonsEnum.single,
                        label: Text(
                            SegmentedButtonsEnum.single.stringValue(context)),
                      ),
                    ],
                    selected: <SegmentedButtonsEnum>{selectView},
                    onSelectionChanged:
                        (Set<SegmentedButtonsEnum> newSelection) {
                      setState(() {
                        selectView = newSelection.last;
                        customizationState?.selectedElement = selectView;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          ComponentCountRow(
              title: AppLocalizations.of(context)!.componentElementToggleCount,
              minCount:
                  SegmentedButtonCustomizationState.minNavigationItemCount,
              maxCount:
                  SegmentedButtonCustomizationState.maxNavigationItemCount,
              count: customizationState!.numberOfItems,
              onChanged: (value) {
                customizationState.numberOfItems = value;
              }),
          OdsListSwitch(
            title: AppLocalizations.of(context)!.componentElementIcon,
            checked: customizationState.hasIcon,
            onCheckedChange: (bool value) {
              customizationState.hasIcon = value;
            },
          ),
          OdsListSwitch(
            title: AppLocalizations.of(context)!.componentElementEnabled,
            checked: customizationState.hasEnabled,
            onCheckedChange: (bool value) {
              customizationState.hasEnabled = value;
            },
          ),
        ],
      ),
    );
  }
}
