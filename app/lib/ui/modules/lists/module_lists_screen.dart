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
import 'package:ods_flutter/components/chips/ods_choice_chips.dart';
import 'package:ods_flutter/components/lists/ods_list_item.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/components/utilities/ods_image_shape.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/l10n/l10n.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/list_item/list_customization.dart';
import 'package:ods_flutter_demo/ui/components/list_item/list_leading_enum.dart';
import 'package:ods_flutter_demo/ui/components/list_item/list_trailing_enum.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ModuleListsStandard extends StatefulWidget {
  const ModuleListsStandard({super.key});

  @override
  State<ModuleListsStandard> createState() => _ModuleListsStandardState();
}

class _ModuleListsStandardState extends State<ModuleListsStandard> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ListCustomization(
      child: Scaffold(
        key: _scaffoldKey,
        bottomSheet: OdsSheetsBottom(
          sheetContent: _CustomizationContent(),
          title: l10n.componentCustomizeTitle,
        ),
        appBar: MainAppBar(l10n.moduleLists),
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
  List<bool> selectionControls =
      List.filled(OdsApplication.recipes.length, true);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final ListCustomizationState? customizationState =
        ListCustomization.of(context);
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: ListView.builder(
        itemCount: OdsApplication.recipes.length - 4,
        itemBuilder: (context, index) {
          var recipe = OdsApplication.recipes[index];
          bool isSelectionControl = selectionControls[index];
          var url = "";
          switch (customizationState?.selectedLeadingElement ?? "") {
            case ListLeadingEnum.icon:
              url = recipe.getIconPath();
              break;
            case ListLeadingEnum.circle:
              url = recipe.url;
              break;
            case ListLeadingEnum.square:
              url = recipe.url;
              break;
            case ListLeadingEnum.wide:
              url = recipe.url;
              break;
            case ListLeadingEnum.none:
              // TODO: Handle this case.
              break;
          }

          final odsImageShape = OdsImageShape(
              context, customizationState?.selectedLeadingElement.name, url);

          return OdsListItem(
            title: recipe.title,
            subtitle: customizationState?.hasSubtitle == true
                ? recipe.subtitle
                : null,
            image: odsImageShape.buildImage(),
            icon: customizationState?.selectedTrailingElement ==
                    ListTrailingEnum.trailingInfoButton
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.info),
                    color: colorScheme.secondary)
                : null,
            text: customizationState?.selectedTrailingElement ==
                    ListTrailingEnum.trailingText
                ? l10n.listTrailingExampleDetails
                : null,
            divider: true,
            value: isSelectionControl,
            onChangedSwitch: customizationState?.selectedTrailingElement ==
                    ListTrailingEnum.trailingSwitch
                ? (value) {
                    setState(() {
                      selectionControls[index] = value ?? false;
                    });
                  }
                : null,
            onChangedCheckBox: customizationState?.selectedTrailingElement ==
                    ListTrailingEnum.trailingCheckbox
                ? (value) {
                    setState(() {
                      selectionControls[index] = value ?? false;
                    });
                  }
                : null,
            onClick: () {},
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
  int selectedStandardTrailingIndex = 0;
  bool isLeadingFiltered = true;
  bool isTrailingFiltered = true;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final ListCustomizationState? customizationState =
        ListCustomization.of(context);
    return SafeArea(
      child: Column(
        children: [
          OdsListSwitch(
              title: l10n.listCustomizationSubtitle,
              checked: customizationState?.hasSubtitle ?? true,
              onCheckedChange: (bool value) {
                customizationState?.hasSubtitle = value;
              }),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(spacingM),
              child: Text(
                l10n.listLeadingCustomizationTitle,
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
                  ListLeadingEnum currentElement =
                      customizationState.leadingElements[index];
                  bool isSelected = currentElement ==
                      customizationState.selectedLeadingElement;
                  return Padding(
                    padding: EdgeInsets.only(right: spacingXs, left: spacingS),
                    child: OdsChoiceChip(
                      text: customizationState.leadingElements[index]
                          .stringValue(l10n),
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
                l10n.listTrailingCustomizationTitle,
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
                  ListTrailingEnum currentElement =
                      customizationState.trailingElements[index];
                  bool isSelected = currentElement ==
                      customizationState.selectedTrailingElement;
                  return Padding(
                    padding: EdgeInsets.only(right: spacingXs, left: spacingS),
                    child: OdsChoiceChip(
                      text: customizationState.trailingElements[index]
                          .stringValue(l10n),
                      onClick: (selected) {
                        setState(
                          () {
                            selectedStandardTrailingIndex = index;
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
