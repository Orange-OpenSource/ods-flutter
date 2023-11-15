import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/switches/switches_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentSwitchesList extends StatefulWidget {
  const ComponentSwitchesList({super.key});

  @override
  State<ComponentSwitchesList> createState() => _ComponentSwitchesListState();
}

class _ComponentSwitchesListState extends State<ComponentSwitchesList> {
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
              MainAppBar(AppLocalizations.of(context)!.listSwitchesSubtitle),
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
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    final SwitchesCustomizationState? customizationState =
        SwitchesCustomization.of(context);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            OdsListSwitch(
              title: OdsApplication.foods[46].name,
              checked: isChecked0,
              icon: customizationState?.hasIcon == true ? true : false,
              enabled:
                  customizationState?.hasEnabled == true ? isEnabled : false,
              onCheckedChange: (value) {
                setState(() {
                  isChecked0 = value!;
                });
              },
            ),
            OdsListSwitch(
              title: OdsApplication.foods[47].name,
              checked: isChecked1,
              icon: customizationState?.hasIcon == true ? true : false,
              enabled:
                  customizationState?.hasEnabled == true ? isEnabled : false,
              onCheckedChange: (value) {
                setState(() {
                  isChecked1 = value!;
                });
              },
            ),
            OdsListSwitch(
              title: OdsApplication.foods[48].name,
              checked: isChecked2,
              icon: customizationState?.hasIcon == true ? true : false,
              enabled:
                  customizationState?.hasEnabled == true ? isEnabled : false,
              onCheckedChange: (value) {
                setState(() {
                  isChecked2 = value!;
                });
              },
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
        OdsListSwitch(
          checked: customizationState?.hasEnabled ?? true,
          title: AppLocalizations.of(context)!
              .componentCheckboxesCustomizationEnabled,
          onCheckedChange: (bool value) {
            customizationState?.hasEnabled = value;
          },
        ),
        OdsListSwitch(
          checked: customizationState?.hasIcon ?? true,
          title: AppLocalizations.of(context)!
              .componentCheckboxesCustomizationIcon,
          onCheckedChange: (bool value) {
            customizationState?.hasIcon = value;
          },
        ),
      ],
    );
  }
}
