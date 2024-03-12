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
import 'package:ods_flutter/components/app_bar/top/ods_top_app_bar.dart';
import 'package:ods_flutter/components/button/ods_button.dart';
import 'package:ods_flutter/components/dialogs/ods_alert_dialog.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/l10n/l10n.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/dialogs/dialogs_customization.dart';
import 'package:ods_flutter_demo/ui/theme/theme_selector.dart';

class ComponentDialogs extends StatelessWidget {
  const ComponentDialogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return DialogsCustomization(
      child: Scaffold(
        bottomSheet: OdsSheetsBottom(
          sheetContent: _CustomizationContent(),
          title: l10n.componentCustomizeTitle,
        ),
        appBar: OdsAppTopBar(
            title: l10n.componentDialogsTitle,
            actions: [ThemeSelector()],
            navigationIcon: BackButton()),
        body: SafeArea(child: _Body()),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

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
              child: Text(l10n.dialogsVariantExampleLabel),
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.center,
              spacing: spacingM,
              children: [
                OdsButton(
                  text: l10n.dialogsVariantExampleOpenButton,
                  style: OdsButtonStyle.functionalPrimary,
                  onClick: () => OdsAlertDialog.openDialog(
                    context: context,
                    text: recipe.description,
                    confirmButton: OdsAlertDialogButton(
                      text: customizationState?.hasDismissButton == true
                          ? l10n.dialogsVariantExampleAcceptButton
                          : l10n.dialogsVariantExampleOkButton,
                      onClick: () => Navigator.of(context).pop(),
                    ),
                    title: customizationState?.hasTitle == true
                        ? recipe.title
                        : null,
                    dismissButton: customizationState?.hasDismissButton == true
                        ? OdsAlertDialogButton(
                            text: l10n.dialogsVariantExampleDeclineButton,
                            onClick: () => Navigator.of(context).pop(),
                          )
                        : null,
                  ),
                ),
                /*
                OdsButton(
                  text: l10n
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
                    buttonRight: l10n
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

class _CustomizationContent extends StatefulWidget {
  @override
  State<_CustomizationContent> createState() => _CustomizationContentState();
}

class _CustomizationContentState extends State<_CustomizationContent> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final DialogsCustomizationState? customizationState =
        DialogsCustomization.of(context);

    return Column(
      children: [
        OdsListSwitch(
          title: l10n.componentCustomizeDialogsTitle,
          checked: customizationState?.hasTitle ?? true,
          onCheckedChange: (bool value) {
            customizationState?.hasTitle = value;
          },
        ),
        OdsListSwitch(
          title: l10n.componentCustomizeDialogsDismissButton,
          checked: customizationState?.hasDismissButton ?? true,
          onCheckedChange: (bool value) {
            customizationState?.hasDismissButton = value;
          },
        ),
      ],
    );
  }
}
