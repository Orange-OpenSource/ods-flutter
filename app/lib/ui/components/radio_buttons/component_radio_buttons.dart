import 'package:flutter/material.dart';

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
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text('Radio Buttons'),
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
