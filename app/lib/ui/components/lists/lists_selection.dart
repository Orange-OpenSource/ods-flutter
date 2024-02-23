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
import 'package:ods_flutter/components/chips/ods_choice_chips.dart';
import 'package:ods_flutter/components/lists/ods_list_selection_item.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/components/utilities/ods_image_shape.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/lists/lists_customization.dart';
import 'package:ods_flutter_demo/ui/components/lists/lists_leading_enum.dart';
import 'package:ods_flutter_demo/ui/components/lists/lists_trailing_enum.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentListsSelection extends StatefulWidget {
  const ComponentListsSelection({super.key});

  @override
  State<ComponentListsSelection> createState() =>
      _ComponentListsSelectionState();
}

class _ComponentListsSelectionState extends State<ComponentListsSelection> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListsCustomization(
      child: Scaffold(
        key: _scaffoldKey,
        bottomSheet: OdsSheetsBottom(
          sheetContent: _CustomizationContent(),
          title: AppLocalizations.of(context)!.componentCustomizeTitle,
        ),
        appBar: MainAppBar(AppLocalizations.of(context)!.listSelectionTitle),
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  List<bool> switchValues = List.filled(OdsApplication.recipes.length, true);

  @override
  Widget build(BuildContext context) {
    final ListsCustomizationState? customizationState =
        ListsCustomization.of(context);

    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: ListView.builder(
        itemCount: OdsApplication.recipes.length - 4,
        itemBuilder: (context, index) {
          var recipe = OdsApplication.recipes[index];
          bool isSwitched = switchValues[index];

          var url = "";
          switch (customizationState?.selectedLeadingElement ?? "") {
            case ListsLeadingEnum.icon:
              url = recipe.getIconPath();
              break;
            case ListsLeadingEnum.circle:
              url = recipe.url;
              break;
            case ListsLeadingEnum.square:
              url = recipe.url;
              break;
            case ListsLeadingEnum.wide:
              url = recipe.url;
              break;
            case ListsLeadingEnum.none:
              // TODO: Handle this case.
              break;
          }

          final odsImageShape = OdsImageShape(
              context, customizationState?.selectedLeadingElement.name, url);

          return OdsListSelectionItem(
            title: recipe.title,
            subtitle: customizationState?.hasSubtitle == true
                ? recipe.subtitle
                : null,
            image: odsImageShape.buildImage(),
            value: isSwitched,
            onChangedSwitch: customizationState?.selectedTrailingElement ==
                    ListsTrailingEnum.trailingSwitch
                ? (value) {
                    setState(() {
                      switchValues[index] = value ?? false;
                    });
                  }
                : null,
            onChangedCheckBox: customizationState?.selectedTrailingElement ==
                    ListsTrailingEnum.trailingCheckbox
                ? (value) {
                    setState(() {
                      switchValues[index] = value ?? false;
                    });
                  }
                : null,
          );
        },
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
  int selectedTrailingIndex = 0;
  bool isLeadingFiltered = true;
  bool isTrailingFiltered = true;

  @override
  Widget build(BuildContext context) {
    final ListsCustomizationState? customizationState =
        ListsCustomization.of(context);
    return SafeArea(
      child: Column(
        children: [
          OdsListSwitch(
              title: AppLocalizations.of(context)!.listCustomizationSubtitle,
              checked: customizationState?.hasSubtitle ?? true,
              onCheckedChange: (bool value) {
                customizationState?.hasSubtitle = value;
              }),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(spacingM),
              child: Text(
                AppLocalizations.of(context)!.listLeadingCustomizationTitle,
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
                    customizationState!.leadingElements.length, (int index) {
                  ListsLeadingEnum currentElement =
                      customizationState.leadingElements[index];
                  bool isSelected = currentElement ==
                      customizationState.selectedLeadingElement;
                  return Padding(
                    padding: EdgeInsets.only(right: spacingXs, left: spacingS),
                    child: OdsChoiceChip(
                      text: customizationState.leadingElements[index]
                          .stringValue(context),
                      onClick: (selected) {
                        setState(
                          () {
                            selectedLeadingIndex = index;
                            isLeadingFiltered = selected!;
                            customizationState.selectedLeadingElement =
                                customizationState.leadingElements[index];
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
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(spacingM),
              child: Text(
                AppLocalizations.of(context)!.listTrailingCustomizationTitle,
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
                    customizationState.trailingElements.length, (int index) {
                  ListsTrailingEnum currentElement =
                      customizationState.trailingElements[index];
                  bool isSelected = currentElement ==
                      customizationState.selectedTrailingElement;
                  return Padding(
                    padding: EdgeInsets.only(right: spacingXs, left: spacingS),
                    child: OdsChoiceChip(
                      text: customizationState.trailingElements[index]
                          .stringValue(context),
                      onClick: (selected) {
                        setState(
                          () {
                            selectedTrailingIndex = index;
                            isTrailingFiltered = selected!;
                            customizationState.selectedTrailingElement =
                                customizationState.trailingElements[index];
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
        ],
      ),
    );
  }
}
