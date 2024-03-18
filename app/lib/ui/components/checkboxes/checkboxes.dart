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
import 'package:ods_flutter/components/lists/ods_list_checkbox.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/l10n/l10n.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/checkboxes/checkboxes_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentCheckboxes extends StatefulWidget {
  const ComponentCheckboxes({super.key});

  @override
  State<ComponentCheckboxes> createState() => _ComponentCheckboxesState();
}

class _ComponentCheckboxesState extends State<ComponentCheckboxes> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CheckboxesCustomization(
      child: Scaffold(
          bottomSheet: OdsSheetsBottom(
            sheetContent: _CustomizationContent(),
            title: l10n.componentCustomizeTitle,
          ),
          key: _scaffoldKey,
          appBar: MainAppBar(l10n.componentCheckboxes),
          body: _Body()),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  bool? isChecked = true;
  bool isEnable = true;
  bool isIndeterminate = true;

  @override
  Widget build(BuildContext context) {
    final CheckboxesCustomizationState? customizationState =
        CheckboxesCustomization.of(context);

    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(spacingS),
              child: OdsListCheckbox(
                checked: isChecked,
                title: OdsApplication.foods[46].name,
                enabled:
                    customizationState?.hasEnabled == true ? isEnable : false,
                indeterminate: true,
                onCheckedChange: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final CheckboxesCustomizationState? customizationState =
        CheckboxesCustomization.of(context);
    return Column(
      children: [
        OdsListSwitch(
          title: l10n.componentCheckboxesCustomizationEnabled,
          checked: customizationState?.hasEnabled ?? true,
          onCheckedChange: (bool value) {
            customizationState?.hasEnabled = value;
          },
        ),
      ],
    );
  }
}
