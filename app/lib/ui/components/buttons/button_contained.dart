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
import 'package:ods_flutter/components/button/ods_button.dart';
import 'package:ods_flutter/components/chips/ods_choice_chips.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/l10n/gen/ods_flutter_app_localizations.dart';
import 'package:ods_flutter_demo/l10n/l10n.dart';
import 'package:ods_flutter_demo/ui/components/buttons/button_customization.dart';
import 'package:ods_flutter_demo/ui/components/buttons/button_enum.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

enum ButtonEmphasis {
  highEmphasis,
  mediumEmphasis,
  functional,
}

class ButtonsContained extends StatefulWidget {
  final ButtonEmphasis emphasis;

  ButtonsContained({Key? key, required this.emphasis}) : super(key: key);

  @override
  _ButtonsContainedState createState() => _ButtonsContainedState();
}

class _ButtonsContainedState extends State<ButtonsContained> {
  _ButtonsContainedState();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ButtonCustomization(
      child: Scaffold(
        bottomSheet: OdsSheetsBottom(
          sheetContent: _CustomizationContent(emphasis: widget.emphasis),
          title: l10n.componentCustomizeTitle,
        ),
        appBar: MainAppBar(_getAppBarTitle(l10n)),
        body: SafeArea(child: _Body(emphasis: widget.emphasis)),
      ),
    );
  }

  String _getAppBarTitle(AppLocalizations l10n) {
    switch (widget.emphasis) {
      case ButtonEmphasis.highEmphasis:
        return l10n.buttonsHighEmphasisVariantTitle;
      case ButtonEmphasis.mediumEmphasis:
        return l10n.buttonsMediumEmphasisVariantTitle;
      case ButtonEmphasis.functional:
        return l10n.buttonsFunctionalVariantTitle;
    }
  }
}

class _Body extends StatelessWidget {
  final ButtonEmphasis emphasis;

  _Body({required this.emphasis});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final ButtonCustomizationState? customizationState =
        ButtonCustomization.of(context);

    final functionalStyle = customizationState != null
        ? (customizationState.selectedFunctionalType ==
                ButtonsEnum.functionalPositive
            ? OdsButtonStyle.functionalPositive
            : OdsButtonStyle.functionalNegative)
        : OdsButtonStyle.functionalNegative;

    return Semantics(
      header: true,
      child: Padding(
        padding: const EdgeInsets.only(
            left: spacingM, top: spacingL, right: spacingM, bottom: spacingM),
        child: OdsButton(
          text: l10n.componentButtonsExampleTitle,
          icon: customizationState?.hasIcon == true
              ? SvgPicture.asset('assets/ic_profile.svg')
              : null,
          onClick: customizationState?.hasEnabled == true ? () {} : null,
          fullWidth: customizationState?.hasFullScreen ?? false,
          style: emphasis == ButtonEmphasis.highEmphasis
              ? OdsButtonStyle.functionalPrimary
              : emphasis == ButtonEmphasis.mediumEmphasis
                  ? OdsButtonStyle.functionalDefault
                  : functionalStyle,
        ),
      ),
    );
  }
}

class _CustomizationContent extends StatefulWidget {
  final ButtonEmphasis emphasis;

  _CustomizationContent({required this.emphasis});

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
        if (ButtonEmphasis.functional == widget.emphasis)
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(spacingM),
                  child: Text(
                    l10n.buttonsFunctionalCustomizeFunctionalTitle,
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
                      customizationState!.functionalType.length,
                      (int index) {
                        ButtonsEnum currentElement =
                            customizationState.functionalType[index];
                        bool isSelected = currentElement ==
                            customizationState.selectedFunctionalType;
                        return Padding(
                          padding:
                              EdgeInsets.only(right: spacingXs, left: spacingS),
                          child: OdsChoiceChip(
                            text: customizationState.functionalType[index]
                                .stringValue(l10n),
                            selected: isSelected,
                            onClick: (selected) {
                              setState(
                                () {
                                  customizationState.selectedFunctionalType =
                                      customizationState.functionalType[index];
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
            ],
          ),
        OdsListSwitch(
          title: l10n.componentCustomizeIcon,
          checked: customizationState?.hasIcon ?? true,
          onCheckedChange: (bool value) {
            customizationState?.hasIcon = value;
          },
        ),
        OdsListSwitch(
          title: l10n.componentCustomizeFullScreen,
          checked: customizationState?.hasFullScreen ?? true,
          onCheckedChange: (bool value) {
            customizationState?.hasFullScreen = value;
          },
        ),
        OdsListSwitch(
          title: l10n.componentCustomizeEnable,
          checked: customizationState?.hasEnabled ?? true,
          onCheckedChange: (bool value) {
            customizationState?.hasEnabled = value;
          },
        ),
      ],
    );
  }
}
