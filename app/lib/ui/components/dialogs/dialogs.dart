import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/app_bar/top/ods_top_app_bars.dart';
import 'package:ods_flutter/components/button/model/ods_button_colors.dart';
import 'package:ods_flutter/components/button/ods_filled_button.dart';
import 'package:ods_flutter/components/dialogs/ods_alert_dialog.dart';
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
          content: _CustomizationContent(),
          title: AppLocalizations.of(context)!.componentCustomizeTitle,
        ),
        appBar: OdsAppTopBars(
            title: AppLocalizations.of(context)!.componentDialogsTitle,
            actions: [ThemeSelector()],
            leading: BackButton()),
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
                OdsFilledButton(
                  title: AppLocalizations.of(context)!
                      .dialogsVariantExampleOpenButton,
                  style: OdsTextButtonStyle.functionalPrimary,
                  onPressed: () => OdsAlertDialog.openDialog(
                    context: context,
                    titleText: customizationState?.hasTitle == true
                        ? recipe.title
                        : null,
                    text: recipe.description,
                    confirmButtonText:
                        customizationState?.hasDismissButton == true
                            ? AppLocalizations.of(context)!
                                .dialogsVariantExampleAcceptButton
                            : AppLocalizations.of(context)!
                                .dialogsVariantExampleOkButton,
                    onConfirmButtonClick: () => Navigator.of(context).pop(),
                    dismissButtonDescription:
                        customizationState?.hasDismissButton == true
                            ? DismissButtonDescription(
                                dismissButtonText: AppLocalizations.of(context)!
                                    .dialogsVariantExampleDeclineButton,
                                onDismissButtonClick: () =>
                                    Navigator.of(context).pop(),
                              )
                            : null,
                  ),
                ),
                OdsFilledButton(
                  title: AppLocalizations.of(context)!
                      .dialogsVariantExampleOpenFullDialogsButton,
                  fullScreenWidth: false,
                  style: OdsTextButtonStyle.functionalPrimary,
                  onPressed: () => OdsAlertDialog.openFullscreenDialog(
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
    final DialogsCustomizationState? customizationState =
        DialogsCustomization.of(context);
    return Column(
      children: [
        SwitchListTile(
          value: customizationState?.hasTitle ?? true,
          title: Text(
              AppLocalizations.of(context)!.componentCustomizeDialogsTitle),
          onChanged: (bool value) {
            customizationState?.hasTitle = value;
          },
        ),
        SwitchListTile(
          value: customizationState?.hasDismissButton ?? true,
          title: Text(AppLocalizations.of(context)!
              .componentCustomizeDialogsDismissButton),
          onChanged: (bool value) {
            customizationState?.hasDismissButton = value;
          },
        ),
      ],
    );
  }
}
