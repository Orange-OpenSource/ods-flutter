import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/button/model/ods_button_colors.dart';
import 'package:ods_flutter/components/button/ods_filled_button.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/components/snackbars/ods_snackbars.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
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
    return ComponentSnackbarsCustomization(
      child: Scaffold(
          bottomSheet: OdsSheetsBottom(
            content: _CustomizationContent(),
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
          child: OdsFilledButton(
            onPressed: () {
              if (customizationState?.hasTwoLines == false &&
                  customizationState?.hasLongerAction == false) {
                OdsSnackbars.showSnackbarSingleLine(
                  context: context,
                  content: AppLocalizations.of(context)!
                      .componentSnackbarsSingleText,
                  label: customizationState?.hasActionButton == true
                      ? AppLocalizations.of(context)!
                          .componentSnackbarsActionExampleButtonText
                      : null,
                  onPressed: customizationState?.hasActionButton == true
                      ? () {}
                      : null,
                );
              } else if (customizationState?.hasTwoLines == true &&
                  customizationState?.hasLongerAction == false) {
                OdsSnackbars.showSnackbarTwoLines(
                  context: context,
                  content: AppLocalizations.of(context)!
                      .componentSnackbarsTwoLineActionText,
                  label: customizationState?.hasActionButton == true
                      ? AppLocalizations.of(context)!
                          .componentSnackbarsActionExampleButtonText
                      : null,
                  onPressed: customizationState?.hasActionButton == true
                      ? () {}
                      : null,
                );
              }
              if (customizationState?.hasLongerAction == true) {
                OdsSnackbars.showSnackbarLongerAction(
                  context: context,
                  content: AppLocalizations.of(context)!
                      .componentSnackbarsTwoLineLongerActionText,
                  label: AppLocalizations.of(context)!
                      .componentSnackbarsTwoLineLongerActionButton,
                  onPressed: () {},
                );
              }
            },
            title: AppLocalizations.of(context)!
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
        SwitchListTile(
          value: customizationState?.hasActionButton ?? true,
          title: Text(
              AppLocalizations.of(context)!.componentSnackBarsCustomizeAction),
          onChanged: customizationState!.isActionButtonEnabled
              ? (bool value) {
                  customizationState.hasLongerAction = false;
                  customizationState.hasActionButton = value;
                }
              : null,
        ),
        SwitchListTile(
          value: customizationState.hasTwoLines,
          title: Text(AppLocalizations.of(context)!
              .componentSnackBarsTwoLineCustomizeText),
          onChanged: customizationState.hasLongerAction == false
              ? (bool value) {
                  customizationState.hasTwoLines = value;
                }
              : null,
        ),
        SwitchListTile(
          value: customizationState.hasLongerAction,
          title: Text(AppLocalizations.of(context)!
              .componentSnackbarsTwoLineLongerActionButton),
          onChanged: customizationState.hasActionButton
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
