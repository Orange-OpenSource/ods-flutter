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
import 'package:flutter_svg/svg.dart';
import 'package:ods_flutter/components/button/ods_text_button.dart';
import 'package:ods_flutter/components/chips/ods_choice_chips.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/buttons/button_customization.dart';
import 'package:ods_flutter_demo/ui/components/buttons/button_enum.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ButtonsText extends StatelessWidget {
  ButtonsText({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ButtonCustomization(
      child: Scaffold(
        bottomSheet: OdsSheetsBottom(
          sheetContent: _CustomizationContent(),
          title: AppLocalizations.of(context)!.componentCustomizeTitle,
        ),
        key: _scaffoldKey,
        appBar: MainAppBar(
            AppLocalizations.of(context)!.buttonsLowestEmphasisVariantTitle),
        body: SafeArea(child: _Body()),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          text: AppLocalizations.of(context)!.componentButtonsExampleTitle,
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
  Widget build(BuildContext context) {
    final ButtonCustomizationState? customizationState =
        ButtonCustomization.of(context);

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
                  ButtonsEnum currentElement = customizationState.style[index];
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
          title: AppLocalizations.of(context)!.componentCustomizeIcon,
          checked: customizationState.hasIcon,
          onCheckedChange: (bool value) {
            customizationState.hasIcon = value;
          },
        ),
        OdsListSwitch(
          title: AppLocalizations.of(context)!.componentCustomizeFullScreen,
          checked: customizationState.hasFullScreen,
          onCheckedChange: (bool value) {
            customizationState.hasFullScreen = value;
          },
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
