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
import 'package:ods_flutter/components/button/ods_text_button.dart';
import 'package:ods_flutter/components/chips/ods_choice_chips.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/l10n/l10n.dart';
import 'package:ods_flutter_demo/ui/components/buttons/button_customization.dart';
import 'package:ods_flutter_demo/ui/components/buttons/button_enum.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ButtonsText extends StatefulWidget {
  const ButtonsText({super.key});

  @override
  State<ButtonsText> createState() => _ButtonsTextState();
}

class _ButtonsTextState extends State<ButtonsText> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ButtonCustomization(
      child: Scaffold(
        bottomSheet: OdsSheetsBottom(
          sheetContent: _CustomizationContent(),
          title: l10n.componentCustomizeTitle,
        ),
        key: _scaffoldKey,
        appBar: MainAppBar(l10n.buttonsLowestEmphasisVariantTitle),
        body: SafeArea(child: _Body()),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final ButtonCustomizationState? customizationState =
        ButtonCustomization.of(context);

    final functionalStyle = customizationState != null
        ? (customizationState.selectedStyle == ButtonsEnum.functionalPrimary
            ? OdsTextButtonStyle.functionalPrimary
            : OdsTextButtonStyle.functionalDefault)
        : OdsTextButtonStyle.functionalDefault;

    return Semantics(
      header: true,
      child: Padding(
        padding: const EdgeInsets.only(
            left: spacingM, top: spacingL, right: spacingM, bottom: spacingM),
        child: OdsTextButton(
          text: l10n.componentButtonsExampleTitle,
          onClick: customizationState?.hasEnabled == true ? () {} : null,
          icon: customizationState?.hasIcon == true
              ? SvgPicture.asset('assets/ic_profile.svg')
              : null,
          fullWidth: customizationState?.hasFullScreen ?? false,
          style: functionalStyle,
        ),
      ),
    );
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
    final l10n = context.l10n;

    final ButtonCustomizationState? customizationState =
        ButtonCustomization.of(context);

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(spacingM),
            child: Text(
              l10n.buttonsTextFunctionalCustomizeFunctionalTitle,
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
                  ButtonsEnum currentElement = customizationState.style[index];
                  bool isSelected =
                      currentElement == customizationState.selectedStyle;
                  return Padding(
                    padding: EdgeInsets.only(right: spacingXs, left: spacingS),
                    child: OdsChoiceChip(
                      text: customizationState.style[index].stringValue(l10n),
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
          title: l10n.componentCustomizeIcon,
          checked: customizationState.hasIcon,
          onCheckedChange: (bool value) {
            customizationState.hasIcon = value;
          },
        ),
        OdsListSwitch(
          title: l10n.componentCustomizeFullScreen,
          checked: customizationState.hasFullScreen,
          onCheckedChange: (bool value) {
            customizationState.hasFullScreen = value;
          },
        ),
        OdsListSwitch(
          title: l10n.componentCustomizeEnable,
          checked: customizationState.hasEnabled,
          onCheckedChange: (bool value) {
            customizationState.hasEnabled = value;
          },
        ),
      ],
    );
  }
}
