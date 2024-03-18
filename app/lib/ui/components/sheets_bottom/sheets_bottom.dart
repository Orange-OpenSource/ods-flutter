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
import 'package:ods_flutter/components/chips/ods_filter_chips.dart';
import 'package:ods_flutter/components/lists/ods_list_item.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/components/utilities/ods_image_shape.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/l10n/l10n.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/sheets_bottom/sheets_bottom_customization.dart';
import 'package:ods_flutter_demo/ui/components/sheets_bottom/sheets_bottom_enum.dart';
import 'package:ods_flutter_demo/ui/theme/theme_selector.dart';

class ComponentSheetsBottom extends StatefulWidget {
  const ComponentSheetsBottom({super.key});
  @override
  State<ComponentSheetsBottom> createState() => _ComponentSheetsBottomState();
}

class _ComponentSheetsBottomState extends State<ComponentSheetsBottom> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SheetsBottomCustomization(
      child: Scaffold(
        bottomSheet: OdsSheetsBottom(
          sheetContent: _CustomizationContent(),
          title: l10n.sheetsBottomCustomizeTitle,
        ),
        appBar: OdsAppTopBar(
            title: l10n.componentSheetsBottomTitle,
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
  int selectedIndex = 0;
  bool isFiltered = true;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final SheetsBottomCustomizationState? customizationState =
        SheetsBottomCustomization.of(context);

    return Padding(
      padding:
          const EdgeInsets.only(left: spacingS, right: spacingM, top: spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.sheetsBottomDescriptionExample,
              style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: spacingM),
          Text(l10n.sheetsBottomSubtitleExample,
              style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: spacingM),
          Wrap(
            spacing: spacingS,
            children: List<Widget>.generate(
              customizationState!.elements.length,
              (int index) {
                SheetsBottomEnum? currentElement =
                    customizationState.elements[index];
                bool isSelected =
                    currentElement == customizationState.selectedElement;

                return OdsFilterChip(
                  text: customizationState.elements[index].stringValue(l10n),
                  onClick: (selected) {
                    setState(
                      () {
                        selectedIndex = index;
                        isFiltered = selected!;
                        customizationState.selectedElement =
                            customizationState.elements[index];
                      },
                    );
                  },
                  selected: isSelected,
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}

class _CustomizationContent extends StatefulWidget {
  @override
  State<_CustomizationContent> createState() => _CustomizationContentState();
}

class _CustomizationContentState extends State<_CustomizationContent> {
  @override
  Widget build(BuildContext context) {
    final SheetsBottomCustomizationState? customizationState =
        SheetsBottomCustomization.of(context);

    if (customizationState?.selectedElement == SheetsBottomEnum.empty) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.2,
      );
    }

    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            var recipe = OdsApplication.recipes[index];
            final odsImageShape = OdsImageShape(
                context, OdsImageShapeEnum.icon.name, recipe.getIconPath());

            return OdsListItem(
              title: recipe.title,
              image: odsImageShape.buildImage(),
            );
          },
        ),
      ],
    );
  }
}
