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
import 'package:ods_flutter/components/button/ods_button.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/components/snackbars/ods_snackbar.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/l10n/l10n.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/snackbars/snackbars_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentSnackbars extends StatefulWidget {
  const ComponentSnackbars({Key? key}) : super(key: key);

  @override
  State<ComponentSnackbars> createState() => _ComponentSnackbarsState();
}

class _ComponentSnackbarsState extends State<ComponentSnackbars> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ComponentSnackbarsCustomization(
      child: Scaffold(
          bottomSheet: OdsSheetsBottom(
            sheetContent: _CustomizationContent(),
            title: l10n.componentCustomizeTitle,
          ),
          key: _scaffoldKey,
          appBar: MainAppBar(l10n.componentSnackbarsTitle),
          body: _Body()),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(spacingM),
            child: Text(
              l10n.componentSnackbarsDescriptionExampleText,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          _SnackBarsVariants(),
        ],
      ),
    );
  }
}

class _SnackBarsVariants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final ComponentSnackbarsCustomizationState? customizationState =
        ComponentSnackbarsCustomization.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: OdsButton(
            onClick: () {
              if (customizationState?.hasTwoLines == false &&
                  customizationState?.hasLongerAction == false) {
                OdsSnackbar.showSnackbarSingleLine(
                  context: context,
                  message: OdsApplication.recipes[21].description,
                  actionLabel: customizationState?.hasActionButton == true
                      ? l10n.componentSnackbarsActionExampleButtonText
                      : null,
                  onPressed: customizationState?.hasActionButton == true
                      ? () {}
                      : null,
                );
              } else if (customizationState?.hasTwoLines == true &&
                  customizationState?.hasLongerAction == false) {
                OdsSnackbar.showSnackbarTwoLines(
                  context: context,
                  message: OdsApplication.recipes[7].description,
                  actionLabel: customizationState?.hasActionButton == true
                      ? l10n.componentSnackbarsActionExampleButtonText
                      : null,
                  onPressed: customizationState?.hasActionButton == true
                      ? () {}
                      : null,
                );
              }
              if (customizationState?.hasLongerAction == true) {
                OdsSnackbar.showSnackbarLongerAction(
                  context: context,
                  message: OdsApplication.recipes[7].description,
                  actionLabel: l10n.componentSnackbarsTwoLineLongerActionButton,
                  onPressed: () {},
                );
              }
            },
            text: l10n.componentSnackbarsDescriptionExampleButton,
            style: OdsButtonStyle.functionalPrimary,
          ),
        ),
      ],
    );
  }
}

class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final ComponentSnackbarsCustomizationState? customizationState =
        ComponentSnackbarsCustomization.of(context);
    return Column(
      children: [
        OdsListSwitch(
          title: l10n.componentSnackBarsCustomizeAction,
          checked: customizationState?.hasActionButton ?? true,
          onCheckedChange: customizationState!.isActionButtonEnabled
              ? (bool value) {
                  customizationState.hasLongerAction = false;
                  customizationState.hasActionButton = value;
                }
              : null,
        ),
        OdsListSwitch(
          title: l10n.componentSnackBarsTwoLineCustomizeText,
          checked: customizationState.hasTwoLines,
          onCheckedChange: customizationState.hasLongerAction == false
              ? (bool value) {
                  customizationState.hasTwoLines = value;
                }
              : null,
        ),
        OdsListSwitch(
          title: l10n.componentSnackbarsTwoLineLongerActionButton,
          checked: customizationState.hasLongerAction,
          onCheckedChange: customizationState.hasActionButton
              ? (bool value) {
                  customizationState.hasTwoLines = false;
                  customizationState.hasLongerAction = value;
                }
              : null,
        ),
      ],
    );
  }
}
