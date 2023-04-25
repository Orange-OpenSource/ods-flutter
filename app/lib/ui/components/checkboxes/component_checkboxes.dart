import 'package:flutter/material.dart';
import 'package:ods_flutter/components/ods_checkbox.dart';

class ComponentCheckboxes extends StatefulWidget {
  const ComponentCheckboxes({super.key});

  @override
  State<ComponentCheckboxes> createState() => _ComponentCheckboxesState();
}

class _ComponentCheckboxesState extends State<ComponentCheckboxes> {
  bool isChecked0 = true;
  bool isChecked1 = true;
  bool isChecked2 = false;
  bool isEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('Checkboxes'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.black,
              height: 1.0,
            ),
          )),
      body: Column(
        children: <Widget>[
          OdsCheckbox(
              checked: isChecked0,
              title: 'Chocolate',
              enabled: isEnable,
              onCheckedChange: (bool? value) {
                setState(() {
                  isChecked0 = value!;
                });
              }),
          OdsCheckbox(
            checked: isChecked2,
            title: 'Butter',
            enabled: isEnable,
            onCheckedChange: (value) {
              setState(() {
                isChecked2 = value!;
              });
            },
          ),
          OdsCheckbox(
              title: 'Sugar',
              checked: true,
              enabled: false,
              onCheckedChange: (value) {
                setState(() {
                  isChecked2 = value!;
                });
              }),
          OdsCheckbox(
              title: 'Eggs',
              checked: false,
              enabled: false,
              onCheckedChange: (value) {
                setState(() {
                  isChecked2 = value!;
                });
              }),
        ],
      ),
    );
  }
}
