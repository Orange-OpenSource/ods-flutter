import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';

class ComponentRadioButtons extends StatefulWidget {
  @override
  State<ComponentRadioButtons> createState() => _ComponentRadioButtonsState();
}

enum Options { option1, option2, option3 }

class _ComponentRadioButtonsState extends State<ComponentRadioButtons> {
  Options? _selectedOption = Options.option1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.componentRadioButtonsTitle),
        ),
        body: Column(
          children: <Widget>[
            RadioListTile<Options>(
              title: Text('Summer Salad'),
              value: Options.option1,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<Options>(
              title: Text('Brocoli Soup'),
              value: Options.option2,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<Options>(
              title: Text('Pesta Farfalle'),
              value: Options.option3,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
          ],
        ));
  }
}
