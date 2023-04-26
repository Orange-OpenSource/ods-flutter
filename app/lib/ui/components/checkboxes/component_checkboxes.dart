import 'package:flutter/material.dart';

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
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('Checkboxes'),
      ),
      body: Column(
        children: <Widget>[
          CheckboxListTile(
              value: isChecked0,
              title: Text('Chocolate'),
              enabled: isEnable,
              onChanged: (bool? value) {
                setState(() {
                  isChecked0 = value!;
                });
              }),
          CheckboxListTile(
            value: isChecked2,
            title: Text('Butter'),
            enabled: isEnable,
            onChanged: (value) {
              setState(() {
                isChecked2 = value!;
              });
            },
          ),
          CheckboxListTile(
              title: Text('Sugar'),
              value: true,
              enabled: false,
              onChanged: (value) {
                setState(() {
                  isChecked2 = value!;
                });
              }),
          CheckboxListTile(
              title: Text('Eggs'),
              value: false,
              enabled: false,
              onChanged: (value) {
                setState(() {
                  isChecked2 = value!;
                });
              }),
        ],
      ),
    );
  }
}
