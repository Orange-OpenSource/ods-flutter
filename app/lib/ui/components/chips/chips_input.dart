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
import 'package:flutter_svg/svg.dart';
import 'package:ods_flutter/components/app_bar/top/ods_top_app_bar.dart';
import 'package:ods_flutter/components/chips/ods_filter_chips.dart';
import 'package:ods_flutter/components/chips/ods_input_chips.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/l10n/l10n.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/chips/chips_customization.dart';
import 'package:ods_flutter_demo/ui/components/chips/chips_enum.dart';
import 'package:ods_flutter_demo/ui/theme/theme_selector.dart';

class ComponentChipsInput extends StatefulWidget {
  const ComponentChipsInput({super.key});
  @override
  State<ComponentChipsInput> createState() => _ComponentChipsInputState();
}

class _ComponentChipsInputState extends State<ComponentChipsInput> {
  bool isFiltered = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ChipsCustomization(
      child: Scaffold(
        bottomSheet: OdsSheetsBottom(
          sheetContent: _CustomizationContent(),
          title: l10n.componentCustomizeTitle,
        ),
        appBar: OdsAppTopBar(
            title: l10n.componentChipInput,
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

    final ChipsCustomizationState? customizationState =
        ChipsCustomization.of(context);
    var colorScheme = Theme.of(context).colorScheme;
    var colorFilter = ColorFilter.mode(colorScheme.secondary, BlendMode.srcIn);

    return Padding(
      padding:
          const EdgeInsets.only(left: spacingS, right: spacingM, top: spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.componentChipFilterDescription,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: spacingM),
          Wrap(
            spacing: spacingS,
            children: List<Widget>.generate(1, (int index) {
              return OdsInputChip(
                text: OdsApplication.recipes[index].title,
                leadingAvatar:
                    customizationState?.selectedElement == ChipsEnum.avatar
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(
                              OdsApplication.recipes[index].url,
                            ),
                          )
                        : null,
                leadingIcon:
                    customizationState?.selectedElement == ChipsEnum.icon
                        ? SvgPicture.asset("assets/recipes/ic_cooking_pot.svg",
                            colorFilter: colorFilter)
                        : null,
                onClick: customizationState?.hasEnabled == true ? () {} : null,
                onCancel: customizationState?.hasEnabled == true ? () {} : null,
                enabled: customizationState?.hasEnabled == false ? false : true,
              );
            }),
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
  int selectedIndex = 0;
  bool isFiltered = true;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final ChipsCustomizationState? customizationState =
        ChipsCustomization.of(context);

    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                l10n.componentChipsLeading,
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
                children: List<Widget>.generate(3, (int index) {
                  ChipsEnum? currentElement =
                      customizationState?.elements[index];
                  bool isSelected =
                      currentElement == customizationState?.selectedElement;
                  return Padding(
                    padding: EdgeInsets.only(right: 5, left: 10),
                    child: OdsFilterChip(
                      text: customizationState?.elements[index]
                              .stringValue(l10n) ??
                          '',
                      onClick: (selected) {
                        setState(() {
                          selectedIndex = index;
                          isFiltered = selected!;
                          customizationState?.selectedElement =
                              customizationState.elements[index];
                        });
                      },
                      selected: isSelected,
                    ),
                  );
                }),
              ),
            ),
          ),
          OdsListSwitch(
              title: l10n.componentChipsEnabled,
              checked: customizationState?.hasEnabled ?? true,
              onCheckedChange: (bool value) {
                customizationState?.hasEnabled = value;
              }),
        ],
      ),
    );
  }
}
