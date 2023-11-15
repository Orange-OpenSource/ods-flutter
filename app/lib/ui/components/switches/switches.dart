import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/components/switch/ods_switch.dart';
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

  @override
  Widget build(BuildContext context) {
    final SwitchesCustomizationState? customizationState =
        SwitchesCustomization.of(context);

    return Center(
      child: Column(
        children: <Widget>[
          OdsSwitch(
            checked: isChecked0,
            icon: customizationState?.hasIcon == true ? true : false,
            enabled: customizationState?.hasEnabled == true ? isEnabled : false,
            onCheckedChange: (value) {
              setState(() {
                isChecked0 = value!;
              });
            },
          ),
        ],
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
