import 'package:flutter/material.dart';
import 'package:ods_flutter/components/ods_radiobutton.dart';

import '../components_screen.dart';

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
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text('Radio Buttons'),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: Container(
                color: Colors.black,
                height: 1.0,
              ),
            )),
        body: Column(
          children: <Widget>[
            OdsRadioButton<Options>(
              title: 'Summer Salad',
              selected: Options.option1,
              enabled: true,
              groupValue: _selectedOption,
              onSelectedChange: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            OdsRadioButton<Options>(
              title: 'Brocoli Soup',
              selected: Options.option2,
              groupValue: _selectedOption,
              enabled: true,
              onSelectedChange: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            OdsRadioButton<Options>(
              title: 'Pesta Farfalle',
              selected: Options.option3,
              groupValue: _selectedOption,
              enabled: false,
              onSelectedChange: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
          ],
        ));
  }
}