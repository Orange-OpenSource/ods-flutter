import 'package:flutter/material.dart';

class ComponentFilledTonalButtons extends StatefulWidget {
  const ComponentFilledTonalButtons({super.key});

  @override
  State<ComponentFilledTonalButtons> createState() =>
      _ComponentFilledTonalButtonsState();
}

class _ComponentFilledTonalButtonsState
    extends State<ComponentFilledTonalButtons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filled Tonal Buttons'),
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
            FilledButton.tonal(
              onPressed: isDisabled ? null : () {},
              child: Text("Filled Tonal"),
            )
          ],
        ),
      ),
    );
  }
}
