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
import 'package:ods_flutter/components/button/ods_outlined_button.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/l10n/l10n.dart';
import 'package:ods_flutter_demo/ui/components/buttons/button_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ButtonsOutlined extends StatefulWidget {
  const ButtonsOutlined({super.key});

  @override
  State<ButtonsOutlined> createState() => _ButtonsOutlinedState();
}

class _ButtonsOutlinedState extends State<ButtonsOutlined> {
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
        appBar: MainAppBar(l10n.buttonsLowEmphasisVariantTitle),
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

    final l10n = context.l10n;

    return Semantics(
      header: true,
      child: Padding(
        padding: const EdgeInsets.only(
            left: spacingM, top: spacingL, right: spacingM, bottom: spacingM),
        child: OdsOutlinedButton(
          text: l10n.componentButtonsExampleTitle,
          onClick: customizationState?.hasEnabled == true ? () {} : null,
          icon: customizationState?.hasIcon == true
              ? SvgPicture.asset('assets/ic_profile.svg')
              : null,
          fullWidth: customizationState?.hasFullScreen ?? false,
        ),
      ),
    );
  }
}

class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final ButtonCustomizationState? customizationState =
        ButtonCustomization.of(context);
    return Column(
      children: [
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
