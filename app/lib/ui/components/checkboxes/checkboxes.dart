import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentCheckboxes extends StatefulWidget {
  const ComponentCheckboxes({super.key});

  @override
  State<ComponentCheckboxes> createState() => _ComponentCheckboxesState();
}

class _ComponentCheckboxesState extends State<ComponentCheckboxes> {
  bool isChecked0 = true;
  bool isChecked1 = true;
  bool isChecked2 = false;
  bool isEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          MainAppBar(AppLocalizations.of(context)!.componentCheckboxesTitle),
      body: SafeArea(
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
                child: ExcludeSemantics(
                  child: CheckboxListTile(
                    value: isChecked0,
                    title: Text(OdsApplication.foods[49].name),
                    enabled: isEnable,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked0 = value!;
                      });
                    },
                  ),
                ),
              ),
              Semantics(
                label: AppLocalizations.of(context)!
                    .componentCheckboxesButterAccessibility,
                value: isChecked2
                    ? AppLocalizations.of(context)!
                        .componentCheckboxesCheckedAccessibility
                    : AppLocalizations.of(context)!
                        .componentCheckboxesUnCheckedAccessibility,
                enabled: isEnable,
                child: ExcludeSemantics(
                  child: CheckboxListTile(
                    value: isChecked2,
                    title: Text(OdsApplication.foods[8].name),
                    enabled: isEnable,
                    onChanged: (value) {
                      setState(() {
                        isChecked2 = value!;
                      });
                    },
                  ),
                ),
              ),
              Semantics(
                label: AppLocalizations.of(context)!
                    .componentCheckboxesSugarAccessibility,
                value: AppLocalizations.of(context)!
                    .componentCheckboxesCheckedAccessibility,
                enabled: false,
                child: ExcludeSemantics(
                  child: CheckboxListTile(
                      title: Text(OdsApplication.foods[37].name),
                      value: true,
                      enabled: false,
                      onChanged: (value) {
                        setState(() {
                          isChecked2 = value!;
                        });
                      }),
                ),
              ),
              Semantics(
                label: AppLocalizations.of(context)!
                    .componentCheckboxesEggsAccessibility,
                value: AppLocalizations.of(context)!
                    .componentCheckboxesUnCheckedAccessibility,
                enabled: false,
                child: ExcludeSemantics(
                  child: CheckboxListTile(
                      title: Text(OdsApplication.foods[19].name),
                      value: false,
                      enabled: false,
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
      ),
    );
  }
}
