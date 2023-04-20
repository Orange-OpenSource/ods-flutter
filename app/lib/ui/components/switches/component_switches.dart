import 'package:flutter/material.dart';
import 'package:ods_flutter/components/ods_switch.dart';

class ComponentSwitches extends StatefulWidget {
  @override
  State<ComponentSwitches> createState() => _ComponentSwitchesState();
}

class _ComponentSwitchesState extends State<ComponentSwitches> {
  bool value0 = false;
  bool value1 = true;
  bool isEnabled = true;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>((states) {
    if (states.contains(MaterialState.selected)) {
      return const Icon(Icons.check);
    }
    return const Icon(Icons.close);
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text('Switches'),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: Container(
                color: Colors.black,
                height: 1.0,
              ),
            )),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          OdsSwitch(
              checked: value0,
              icon: null,
              enabled: isEnabled,
              onCheckedChange: (value) {
                setState(() {
                  value0 = value!;
                });
              }),
          OdsSwitch(
              checked: value1,
              icon: thumbIcon,
              enabled: isEnabled,
              onCheckedChange: (value) {
                setState(() {
                  value1 = value!;
                });
              }),
        ])));
  }
}
