import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/lists/ods_list_checkbox.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/checkboxes/checkboxes_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentCheckboxesList extends StatefulWidget {
  const ComponentCheckboxesList({super.key});

  @override
  State<ComponentCheckboxesList> createState() =>
      _ComponentCheckboxesListState();
}

class _ComponentCheckboxesListState extends State<ComponentCheckboxesList> {
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
          appBar: MainAppBar(AppLocalizations.of(context)!.listCheckboxesTitle),
          body: _Body()),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  bool? isChecked0 = true;
  bool? isChecked1 = false;
  bool? isChecked2 = false;
  bool isEnable = true;
  bool isIndeterminate = true;

  @override
  Widget build(BuildContext context) {
    final CheckboxesCustomizationState? customizationState =
        CheckboxesCustomization.of(context);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            OdsListCheckbox(
              checked: isChecked0,
              title: OdsApplication.foods[46].name,
              enabled:
                  customizationState?.hasEnabled == true ? isEnable : false,
              indeterminate: true,
              onCheckedChange: (value) {
                setState(() {
                  isChecked0 = value;
                });
              },
            ),
            OdsListCheckbox(
              checked: isChecked1,
              title: OdsApplication.foods[47].name,
              enabled:
                  customizationState?.hasEnabled == true ? isEnable : false,
              indeterminate: true,
              onCheckedChange: (value) {
                setState(() {
                  isChecked1 = value;
                });
              },
            ),
            OdsListCheckbox(
              title: OdsApplication.foods[41].name,
              checked: isChecked2,
              enabled:
                  customizationState?.hasEnabled == true ? isEnable : false,
              indeterminate: true,
              onCheckedChange: (value) {
                setState(() {
                  isChecked2 = value;
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
          },
        ),
      ],
    );
  }
}
