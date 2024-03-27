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
import 'package:ods_flutter/components/lists/ods_list_radio_button.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/radio_buttons/radio_buttons_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentRadioButtons extends StatefulWidget {
  const ComponentRadioButtons({Key? key}) : super(key: key);

  @override
  State<ComponentRadioButtons> createState() => _ComponentRadioButtonsState();
}

enum Options { option1, option2 }

class _ComponentRadioButtonsState extends State<ComponentRadioButtons> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RadioButtonsCustomization(
      child: Scaffold(
        bottomSheet: OdsSheetsBottom(
          sheetContent: _CustomizationContent(),
          title: AppLocalizations.of(context)!.componentCustomizeTitle,
        ),
        key: _scaffoldKey,
        appBar: MainAppBar(AppLocalizations.of(context)!.componentRadioButtons),
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
  Options? _selectedOption = Options.option1;

  @override
  Widget build(BuildContext context) {
    final RadioButtonsCustomizationState? customizationState =
        RadioButtonsCustomization.of(context);

    return Center(
      child: Column(
        children: <Widget>[
          OdsListRadioButton(
            title: OdsApplication.recipes[0].title,
            value: Options.option1,
            groupValue: _selectedOption,
            enabled: customizationState?.hasEnabled,
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
            enabled: customizationState?.hasEnabled,
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
    );
  }
}

class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RadioButtonsCustomizationState? customizationState =
        RadioButtonsCustomization.of(context);
    return Column(
      children: [
        OdsListSwitch(
          title: AppLocalizations.of(context)!
              .componentCheckboxesCustomizationEnabled,
          checked: customizationState?.hasEnabled ?? true,
          onCheckedChange: (bool value) {
            customizationState?.hasEnabled = value;
          },
        ),
      ],
    );
  }
}
