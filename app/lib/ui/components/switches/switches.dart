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
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter_demo/l10n/l10n.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/switches/switches_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentSwitches extends StatefulWidget {
  const ComponentSwitches({super.key});

  @override
  State<ComponentSwitches> createState() => _ComponentSwitchesState();
}

class _ComponentSwitchesState extends State<ComponentSwitches> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SwitchesCustomization(
      child: Scaffold(
        bottomSheet: OdsSheetsBottom(
          sheetContent: _CustomizationContent(),
          title: l10n.componentCustomizeTitle,
        ),
        key: _scaffoldKey,
        appBar: MainAppBar(l10n.componentSwitchesTitle),
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  bool isChecked = true;
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    final SwitchesCustomizationState? customizationState =
        SwitchesCustomization.of(context);

    return Center(
      child: Column(
        children: <Widget>[
          OdsListSwitch(
            title: OdsApplication.foods[47].name,
            checked: isChecked,
            icon: customizationState?.hasIcon == true ? true : false,
            enabled: customizationState?.hasEnabled == true ? isEnabled : false,
            onCheckedChange: (value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}

class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final SwitchesCustomizationState? customizationState =
        SwitchesCustomization.of(context);

    return Column(
      children: [
        OdsListSwitch(
          title: l10n.componentCheckboxesCustomizationEnabled,
          checked: customizationState?.hasEnabled ?? true,
          onCheckedChange: (bool value) {
            customizationState?.hasEnabled = value;
          },
        ),
        OdsListSwitch(
          title: l10n.componentCheckboxesCustomizationIcon,
          checked: customizationState?.hasIcon ?? true,
          onCheckedChange: (bool value) {
            customizationState?.hasIcon = value;
          },
        ),
      ],
    );
  }
}
