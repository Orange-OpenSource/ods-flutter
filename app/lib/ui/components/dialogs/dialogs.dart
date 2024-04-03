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

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/app_bar/top/ods_top_app_bar.dart';
import 'package:ods_flutter/components/button/ods_button.dart';
import 'package:ods_flutter/components/dialogs/ods_alert_dialog.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/dialogs/dialogs_customization.dart';
import 'package:ods_flutter_demo/ui/theme/theme_selector.dart';

class ComponentDialogs extends StatelessWidget {
  const ComponentDialogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogsCustomization(
      child: Scaffold(
        bottomSheet: OdsSheetsBottom(
          sheetContent: _CustomizationContent(),
          title: AppLocalizations.of(context)!.componentCustomizeTitle,
        ),
        appBar: OdsAppTopBar(
            title: AppLocalizations.of(context)!.componentDialogsTitle,
            actions: [ThemeSelector()],
            navigationIcon: BackButton()),
        body: SafeArea(child: _Body()),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DialogsCustomizationState? customizationState =
        DialogsCustomization.of(context);
    var recipe =
        OdsApplication.recipes[Random().nextInt(OdsApplication.recipes.length)];

    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(spacingM),
              child: Text(
                  AppLocalizations.of(context)!.dialogsVariantExampleLabel),
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.center,
              spacing: spacingM,
              children: [
                OdsButton(
                  text: AppLocalizations.of(context)!
                      .dialogsVariantExampleOpenButton,
                  style: OdsButtonStyle.functionalPrimary,
                  onClick: () => OdsAlertDialog.openDialog(
                    context: context,
                    text: recipe.description,
                    confirmButton: OdsAlertDialogButton(
                      text: customizationState?.hasDismissButton == true
                          ? AppLocalizations.of(context)!
                              .dialogsVariantExampleAcceptButton
                          : AppLocalizations.of(context)!
                              .dialogsVariantExampleOkButton,
                      onClick: () => Navigator.of(context).pop(),
                    ),
                    title: customizationState?.hasTitle == true
                        ? recipe.title
                        : null,
                    dismissButton: customizationState?.hasDismissButton == true
                        ? OdsAlertDialogButton(
                            text: AppLocalizations.of(context)!
                                .dialogsVariantExampleDeclineButton,
                            onClick: () => Navigator.of(context).pop(),
                          )
                        : null,
                  ),
                ),
                /*
                OdsButton(
                  text: AppLocalizations.of(context)!
                      .dialogsVariantExampleOpenFullDialogsButton,
                  fullWidth: false,
                  style: OdsButtonStyle.functionalPrimary,
                  onClick: () => OdsAlertDialog.openFullscreenDialog(
                    context: context,
                    text: recipe.title,
                    body: Padding(
                      padding: const EdgeInsets.all(spacingL),
                      child: Text(recipe.description),
                    ),
                    buttonRight: AppLocalizations.of(context)!
                        .dialogsVariantExampleCloseButton,
                    onButtonRightClick: () => Navigator.of(context).pop(),
                  ),
                ),
                */
              ],
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
    final DialogsCustomizationState? customizationState =
        DialogsCustomization.of(context);
    return Column(
      children: [
        OdsListSwitch(
          title: AppLocalizations.of(context)!.componentCustomizeDialogsTitle,
          checked: customizationState?.hasTitle ?? true,
          onCheckedChange: (bool value) {
            customizationState?.hasTitle = value;
          },
        ),
        OdsListSwitch(
          title: AppLocalizations.of(context)!
              .componentCustomizeDialogsDismissButton,
          checked: customizationState?.hasDismissButton ?? true,
          onCheckedChange: (bool value) {
            customizationState?.hasDismissButton = value;
          },
        ),
      ],
    );
  }
}
