import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/checkboxes/checkboxes_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentRadioButtonsList extends StatefulWidget {
  const ComponentRadioButtonsList({super.key});

  @override
  State<ComponentRadioButtonsList> createState() =>
      _ComponentRadioButtonsListState();
}

enum Options { option1, option2, option3 }

class _ComponentRadioButtonsListState extends State<ComponentRadioButtonsList> {
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
          appBar:
              MainAppBar(AppLocalizations.of(context)!.listRadioButtonsTitle),
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

  Options? _selectedOption = Options.option1;

  @override
  Widget build(BuildContext context) {
    final CheckboxesCustomizationState? customizationState =
        CheckboxesCustomization.of(context);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RadioListTile(
              title: Text(OdsApplication.recipes[0].title),
              value: Options.option1,
              groupValue: _selectedOption,
              onChanged: customizationState?.hasEnabled == true
                  ? (Options? value) {
                      setState(
                        () {
                          _selectedOption = value;
                        },
                      );
                    }
                  : null,
            ),
            RadioListTile<Options>(
              title: Text(OdsApplication.recipes[1].title),
              value: Options.option2,
              groupValue: _selectedOption,
              onChanged: customizationState?.hasEnabled == true
                  ? (value) {
                      setState(
                        () {
                          _selectedOption = value;
                        },
                      );
                    }
                  : null,
            ),
            RadioListTile<Options>(
              title: Text(OdsApplication.recipes[2].title),
              value: Options.option3,
              groupValue: _selectedOption,
              onChanged: customizationState?.hasEnabled == true
                  ? (value) {
                      setState(
                        () {
                          _selectedOption = value;
                        },
                      );
                    }
                  : null,
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
