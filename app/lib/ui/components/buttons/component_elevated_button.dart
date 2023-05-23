import 'package:flutter/material.dart';

class ComponentElevatedButtons extends StatefulWidget {
  const ComponentElevatedButtons({super.key});

  @override
  State<ComponentElevatedButtons> createState() => _ElevatedButtonsState();
}

class _ElevatedButtonsState extends State<ComponentElevatedButtons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Elevated Buttons'),
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
          ),
        ));
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
            ElevatedButton(
              onPressed: isDisabled ? null : () {},
              child: Text("Outlined"),
            ),
          ],
        ),
      ),
    );
  }
}
