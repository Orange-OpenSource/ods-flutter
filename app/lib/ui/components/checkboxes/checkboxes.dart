import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
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
    return CheckboxesCustomization(
      child: Scaffold(
          bottomSheet: OdsSheetsBottom(
            content: _CustomizationContent(),
            title: AppLocalizations.of(context)!.componentCustomizeTitle,
          ),
          key: _scaffoldKey,
          appBar: MainAppBar(
              AppLocalizations.of(context)!.componentCheckboxesTitle),
          body: _Body()),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  bool isChecked0 = true;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isEnable = true;

  @override
  Widget build(BuildContext context) {
    final CheckboxesCustomizationState? customizationState =
        CheckboxesCustomization.of(context);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Semantics(
                header: true,
                child: Text(
                  AppLocalizations.of(context)!
                      .checkboxesVariantTitleInformation,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            Semantics(
              label: AppLocalizations.of(context)!
                  .componentCheckboxesChocolateAccessibility,
              value: isChecked0
                  ? AppLocalizations.of(context)!
                      .componentCheckboxesCheckedAccessibility
                  : AppLocalizations.of(context)!
                      .componentCheckboxesUnCheckedAccessibility,
              enabled: isEnable,
              child: CheckboxListTile(
                value: isChecked0,
                title: Text(OdsApplication.foods[46].name),
                enabled:
                    customizationState?.hasEnabled == true ? isEnable : false,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked0 = value!;
                  });
                },
              ),
            ),
            Semantics(
              label: AppLocalizations.of(context)!
                  .componentCheckboxesButterAccessibility,
              value: isChecked1
                  ? AppLocalizations.of(context)!
                      .componentCheckboxesCheckedAccessibility
                  : AppLocalizations.of(context)!
                      .componentCheckboxesUnCheckedAccessibility,
              enabled: isEnable,
              child: CheckboxListTile(
                value: isChecked1,
                title: Text(OdsApplication.foods[47].name),
                enabled:
                    customizationState?.hasEnabled == true ? isEnable : false,
                onChanged: (value) {
                  setState(() {
                    isChecked1 = value!;
                  });
                },
              ),
            ),
            Semantics(
              label: AppLocalizations.of(context)!
                  .componentCheckboxesEggsAccessibility,
              value: AppLocalizations.of(context)!
                  .componentCheckboxesUnCheckedAccessibility,
              enabled: isEnable,
              child: ExcludeSemantics(
                child: CheckboxListTile(
                    title: Text(OdsApplication.foods[41].name),
                    value: isChecked2,
                    enabled: customizationState?.hasEnabled == true
                        ? isEnable
                        : false,
                    onChanged: (value) {
                      setState(() {
                        isChecked2 = value!;
                      });
                    }),
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
    final CheckboxesCustomizationState? customizationState =
        CheckboxesCustomization.of(context);
    return Column(
      children: [
        SwitchListTile(
            value: customizationState?.hasEnabled ?? true,
            title: Text(AppLocalizations.of(context)!
                .componentCheckboxesCustomizationEnabled),
            onChanged: (bool value) {
              customizationState?.hasEnabled = value;
            }),
      ],
    );
  }
}
