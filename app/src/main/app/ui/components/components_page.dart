import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/recipes/my_app_state.dart';

class ComponentsPage extends StatelessWidget {
  double _currentSliderValue = 20;
  bool light = true;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(mainAxisSize: MainAxisSize.min, children: [
          Slider(
            value: 20,
            max: 100,
            divisions: 5,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              // _currentSliderValue = value
            },
          )
        ]),
        Switch(
          // This bool value toggles the switch.
          value: light,
          activeColor: colors.primary,
          onChanged: (bool value) {
            // This is called when the user toggles the switch.
            /* setState(() {
                  light = value;
                });*/
          },
        ),
        Text('TODO: '),
      ]),
    );
  }
}
