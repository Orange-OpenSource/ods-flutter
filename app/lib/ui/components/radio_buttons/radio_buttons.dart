import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter_demo/ui/components/radio_buttons/radio_buttons_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentRadioButtons extends StatefulWidget {
  const ComponentRadioButtons({Key? key}) : super(key: key);

  @override
  State<ComponentRadioButtons> createState() => _ComponentRadioButtonsState();
}

enum Options { option1, option2 }

class _ComponentRadioButtonsState extends State<ComponentRadioButtons> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RadioButtonsCustomization(
      child: Scaffold(
        bottomSheet: OdsSheetsBottom(
          content: _CustomizationContent(),
          title: AppLocalizations.of(context)!.componentCustomizeTitle,
        ),
        key: _scaffoldKey,
        appBar: MainAppBar(
            AppLocalizations.of(context)!.componentRadioButtonsTitle),
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  Options? _selectedOption = Options.option1;

  @override
  Widget build(BuildContext context) {
    final RadioButtonsCustomizationState? customizationState =
        RadioButtonsCustomization.of(context);

    return Center(
      child: Column(
        children: <Widget>[
          Radio(
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
          Radio(
            value: Options.option2,
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
        ],
      ),
    );
  }
}

class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RadioButtonsCustomizationState? customizationState =
        RadioButtonsCustomization.of(context);
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
