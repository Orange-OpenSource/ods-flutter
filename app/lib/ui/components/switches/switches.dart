import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/ods_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/switches/switches_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentSwitches extends StatefulWidget {
  const ComponentSwitches({super.key});

  @override
  State<ComponentSwitches> createState() => _ComponentSwitchesState();
}

class _ComponentSwitchesState extends State<ComponentSwitches> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SwitchesCustomization(
      child: Scaffold(
          bottomSheet: OdsSheetsBottom(
            content: _CustomizationContent(),
            title: AppLocalizations.of(context)!.componentCustomizeTitle,
          ),
          key: _scaffoldKey,
          appBar:
              MainAppBar(AppLocalizations.of(context)!.componentSwitchesTitle),
          body: _Body()),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  bool isChecked0 = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isEnabled = true;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>((states) {
    if (states.contains(MaterialState.selected)) {
      return const Icon(Icons.check);
    }
    return const Icon(Icons.close);
  });

  @override
  Widget build(BuildContext context) {
    final SwitchesCustomizationState? customizationState =
        SwitchesCustomization.of(context);

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
                  AppLocalizations.of(context)!.switchesVariantTitleInformation,
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
              enabled: isEnabled,
              child: ListTile(
                title: Text(OdsApplication.recipes[0].title),
                trailing: OdsSwitch(
                  checked: isChecked0,
                  icon: customizationState?.hasIcon == true ? thumbIcon : null,
                  enabled: customizationState?.hasEnabled == true
                      ? isEnabled
                      : false,
                  onCheckedChange: (value) {
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
              value: isChecked1
                  ? AppLocalizations.of(context)!
                      .componentCheckboxesCheckedAccessibility
                  : AppLocalizations.of(context)!
                      .componentCheckboxesUnCheckedAccessibility,
              enabled: isEnabled,
              child: ListTile(
                title: Text(OdsApplication.recipes[1].title),
                trailing: OdsSwitch(
                  checked: isChecked1,
                  icon: customizationState?.hasIcon == true ? thumbIcon : null,
                  enabled: customizationState?.hasEnabled == true
                      ? isEnabled
                      : false,
                  onCheckedChange: (value) {
                    setState(() {
                      isChecked1 = value!;
                    });
                  },
                ),
              ),
            ),
            Semantics(
              label: AppLocalizations.of(context)!
                  .componentCheckboxesEggsAccessibility,
              value: AppLocalizations.of(context)!
                  .componentCheckboxesUnCheckedAccessibility,
              enabled: isEnabled,
              child: ExcludeSemantics(
                child: ListTile(
                  title: Text(OdsApplication.recipes[2].title),
                  trailing: OdsSwitch(
                    checked: isChecked2,
                    icon:
                        customizationState?.hasIcon == true ? thumbIcon : null,
                    enabled: customizationState?.hasEnabled == true
                        ? isEnabled
                        : false,
                    onCheckedChange: (value) {
                      setState(
                        () {
                          isChecked2 = value!;
                        },
                      );
                    },
                  ),
                ),
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
    final SwitchesCustomizationState? customizationState =
        SwitchesCustomization.of(context);
    return Column(
      children: [
        SwitchListTile(
          value: customizationState?.hasEnabled ?? true,
          title: Text(AppLocalizations.of(context)!
              .componentCheckboxesCustomizationEnabled),
          onChanged: (bool value) {
            customizationState?.hasEnabled = value;
          },
        ),
        SwitchListTile(
          value: customizationState?.hasIcon ?? true,
          title: Text(AppLocalizations.of(context)!
              .componentCheckboxesCustomizationIcon),
          onChanged: (bool value) {
            customizationState?.hasIcon = value;
          },
        ),
      ],
    );
  }
}
