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
import 'package:ods_flutter/components/button/ods_button.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/components/snackbars/ods_snackbar.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/snackbars/snackbars_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentSnackbars extends StatelessWidget {
  ComponentSnackbars({Key? key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ComponentSnackbarsCustomization(
      child: Scaffold(
          bottomSheet: OdsSheetsBottom(
            sheetContent: _CustomizationContent(),
            title: AppLocalizations.of(context)!.componentCustomizeTitle,
          ),
          key: _scaffoldKey,
          appBar:
              MainAppBar(AppLocalizations.of(context)!.componentSnackbarsTitle),
          body: _Body()),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(spacingM),
            child: Text(
              AppLocalizations.of(context)!
                  .componentSnackbarsDescriptionExampleText,
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
                      ? AppLocalizations.of(context)!
                          .componentSnackbarsActionExampleButtonText
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
                      ? AppLocalizations.of(context)!
                          .componentSnackbarsActionExampleButtonText
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
                  actionLabel: AppLocalizations.of(context)!
                      .componentSnackbarsTwoLineLongerActionButton,
                  onPressed: () {},
                );
              }
            },
            text: AppLocalizations.of(context)!
                .componentSnackbarsDescriptionExampleButton,
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
    final ComponentSnackbarsCustomizationState? customizationState =
        ComponentSnackbarsCustomization.of(context);
    return Column(
      children: [
        OdsListSwitch(
          title:
              AppLocalizations.of(context)!.componentSnackBarsCustomizeAction,
          checked: customizationState?.hasActionButton ?? true,
          onCheckedChange: customizationState!.isActionButtonEnabled
              ? (bool value) {
                  customizationState.hasLongerAction = false;
                  customizationState.hasActionButton = value;
                }
              : null,
        ),
        OdsListSwitch(
          title: AppLocalizations.of(context)!
              .componentSnackBarsTwoLineCustomizeText,
          checked: customizationState.hasTwoLines,
          onCheckedChange: customizationState.hasLongerAction == false
              ? (bool value) {
                  customizationState.hasTwoLines = value;
                }
              : null,
        ),
        OdsListSwitch(
          title: AppLocalizations.of(context)!
              .componentSnackbarsTwoLineLongerActionButton,
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
