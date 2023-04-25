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
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text('Switches'),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
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
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OdsSwitch(
                    checked: value0,
                    icon: null,
                    enabled: false,
                    onCheckedChange: (value) {
                      setState(() {
                        value0 = value!;
                      });
                    }),
                OdsSwitch(
                    checked: value1,
                    icon: thumbIcon,
                    enabled: false,
                    onCheckedChange: (value) {
                      setState(() {
                        value1 = value!;
                      });
                    }),
              ])
        ])));
  }
}
