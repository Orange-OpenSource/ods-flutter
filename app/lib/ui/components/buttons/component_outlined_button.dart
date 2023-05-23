import 'package:flutter/material.dart';
import 'package:ods_flutter_demo/ui/components/material/component_material.dart';

class ComponentOutlinedButtons extends StatefulWidget {
  const ComponentOutlinedButtons({super.key});

  @override
  State<ComponentOutlinedButtons> createState() =>
      _ComponentOutlinedButtonsState();
}

class _ComponentOutlinedButtonsState extends State<ComponentOutlinedButtons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Outlined Buttons'),
        ),
        body: Semantics(
            header: true,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const <Widget>[
                  ButtonsVariants(isDisabled: false),
                  ButtonsVariants(isDisabled: true),
                ],
              ),
            )));
  }
}

class ButtonsVariants extends StatelessWidget {
  final bool isDisabled;

  const ButtonsVariants({super.key, required this.isDisabled});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            componentSpacer,
            OutlinedButton(
              onPressed: isDisabled ? null : () {},
              child: Text("Outlined"),
            ),
            componentSpacer,
          ],
        ),
      ),
    );
  }
}
