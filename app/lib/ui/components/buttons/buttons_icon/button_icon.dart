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
import 'package:ods_flutter/components/button/segmented/button_icon/ods_button_icon.dart';
import 'package:ods_flutter/components/chips/ods_choice_chips.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/buttons/buttons_icon/button_icon_customization.dart';
import 'package:ods_flutter_demo/ui/components/buttons/buttons_icon/button_icon_enum.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ButtonsIcons extends StatefulWidget {
  const ButtonsIcons({super.key});

  @override
  State<ButtonsIcons> createState() => _ButtonsIconsState();
}

class _ButtonsIconsState extends State<ButtonsIcons> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ButtonIconCustomization(
      child: Scaffold(
        bottomSheet: OdsSheetsBottom(
          sheetContent: _CustomizationContent(),
          title: AppLocalizations.of(context)!.componentCustomizeTitle,
        ),
        key: _scaffoldKey,
        appBar:
            MainAppBar(AppLocalizations.of(context)!.buttonsIconVariantTitle),
        body: SafeArea(child: _Body()),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    final ButtonIconCustomizationState? customizationState =
        ButtonIconCustomization.of(context);
    final style = _determineButtonIconStyle(customizationState?.selectedStyle);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ExcludeSemantics(
              child: Text(
                selected
                    ? AppLocalizations.of(context)!.buttonsIconSelected
                    : AppLocalizations.of(context)!.buttonsIconDeselected,
              ),
            ),
            OdsButtonIcon(
              icon: Image.asset('assets/ic_heart_deselected.png'),
              selectedIcon: Image.asset(
                'assets/ic_heart_selected.png',
              ),
              style: style,
              isSelected: selected,
              isEnabled: customizationState!.hasEnabled,
              onClick: () {
                setState(() {
                  selected = !selected;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  OdsButtonIconStyle _determineButtonIconStyle(ButtonsIconEnum? selectedStyle) {
    switch (selectedStyle) {
      case ButtonsIconEnum.functionalStandard:
        return OdsButtonIconStyle.functionalStandard;
      case ButtonsIconEnum.functionalFilled:
        return OdsButtonIconStyle.functionalFilled;
      case ButtonsIconEnum.functionalTonal:
        return OdsButtonIconStyle.functionalTonal;
      case ButtonsIconEnum.functionalOutlined:
        return OdsButtonIconStyle.functionalOutlined;
      default:
        throw ArgumentError('Selected style not supported: $selectedStyle');
    }
  }
}

class _CustomizationContent extends StatefulWidget {
  _CustomizationContent();

  @override
  State<_CustomizationContent> createState() => _CustomizationContentState();
}

class _CustomizationContentState extends State<_CustomizationContent> {
  _CustomizationContentState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonIconCustomizationState? customizationState =
        ButtonIconCustomization.of(context);

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(spacingM),
            child: Text(
              AppLocalizations.of(context)!
                  .buttonsTextFunctionalCustomizeFunctionalTitle,
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
                customizationState!.style.length,
                (int index) {
                  ButtonsIconEnum currentElement =
                      customizationState.style[index];
                  bool isSelected =
                      currentElement == customizationState.selectedStyle;
                  return Padding(
                    padding: EdgeInsets.only(right: spacingXs, left: spacingS),
                    child: OdsChoiceChip(
                      text:
                          customizationState.style[index].stringValue(context),
                      selected: isSelected,
                      onClick: (selected) {
                        setState(
                          () {
                            customizationState.selectedStyle =
                                customizationState.style[index];
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        OdsListSwitch(
          title: AppLocalizations.of(context)!.componentCustomizeEnable,
          checked: customizationState.hasEnabled,
          onCheckedChange: (bool value) {
            customizationState.hasEnabled = value;
          },
        ),
      ],
    );
  }
}
