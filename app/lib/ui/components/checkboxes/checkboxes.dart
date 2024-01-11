import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/checkbox/ods_checkbox.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
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
            sheetContent: _CustomizationContent(),
            title: AppLocalizations.of(context)!.componentCustomizeTitle,
          ),
          key: _scaffoldKey,
          appBar: MainAppBar(AppLocalizations.of(context)!.componentCheckboxes),
          body: _Body()),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  bool? isChecked = true;
  bool isEnable = true;
  bool isIndeterminate = true;

  @override
  Widget build(BuildContext context) {
    final CheckboxesCustomizationState? customizationState =
        CheckboxesCustomization.of(context);

    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(spacingS),
              child: OdsCheckbox(
                checked: isChecked,
                onCheckedChange: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
                enabled:
                    customizationState?.hasEnabled == true ? isEnable : false,
                indeterminate: true,
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
        OdsListSwitch(
          title: AppLocalizations.of(context)!
              .componentCheckboxesCustomizationEnabled,
          checked: customizationState?.hasEnabled ?? true,
          onCheckedChange: (bool value) {
            customizationState?.hasEnabled = value;
          },
        ),
      ],
    );
  }
}
