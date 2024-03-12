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
import 'package:ods_flutter/components/lists/ods_list_radio_button.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter_demo/l10n/l10n.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/checkboxes/checkboxes_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentRadioButtonsList extends StatefulWidget {
  const ComponentRadioButtonsList({super.key});

  @override
  State<ComponentRadioButtonsList> createState() =>
      _ComponentRadioButtonsListState();
}

enum Options { option1, option2, option3 }

class _ComponentRadioButtonsListState extends State<ComponentRadioButtonsList> {
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
          appBar: MainAppBar(l10n.listRadioButtonsTitle),
          body: _Body()),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  bool? isChecked0 = true;
  bool? isChecked1 = false;
  bool? isChecked2 = false;
  bool isEnable = true;
  bool isIndeterminate = true;

  Options? _selectedOption = Options.option1;

  @override
  Widget build(BuildContext context) {
    final CheckboxesCustomizationState? customizationState =
        CheckboxesCustomization.of(context);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            OdsListRadioButton(
              title: OdsApplication.recipes[0].title,
              value: Options.option1,
              groupValue: _selectedOption,
              onCheckedChange: customizationState?.hasEnabled == true
                  ? (Options? value) {
                      setState(
                        () {
                          _selectedOption = value;
                        },
                      );
                    }
                  : null,
            ),
            OdsListRadioButton<Options>(
              title: OdsApplication.recipes[1].title,
              value: Options.option2,
              groupValue: _selectedOption,
              onCheckedChange: customizationState?.hasEnabled == true
                  ? (value) {
                      setState(
                        () {
                          _selectedOption = value;
                        },
                      );
                    }
                  : null,
            ),
            OdsListRadioButton<Options>(
              title: OdsApplication.recipes[2].title,
              value: Options.option3,
              groupValue: _selectedOption,
              onCheckedChange: customizationState?.hasEnabled == true
                  ? (value) {
                      setState(
                        () {
                          _selectedOption = value;
                        },
                      );
                    }
                  : null,
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
