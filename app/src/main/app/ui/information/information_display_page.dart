import 'package:flutter/material.dart';
import 'package:ods_flutter/ods_flutter.dart';
import 'package:provider/provider.dart';

import '../../domain/recipes/my_app_state.dart';

class InformationDisplaysPage extends StatelessWidget {
  var calculator = Calculator();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(mainAxisSize: MainAxisSize.min, children: [
          Chip(
            avatar: CircleAvatar(
              child: const Text('A'),
            ),
            label: const Text('Chip'),
          )
        ]),
        SizedBox(height: 10),
        Tooltip(
          message: 'I am a Tooltip',
          child: Text('Hover over the text to show a tooltip.'),
        ),
        SizedBox(height: 10),
        Text('TODO: '),
      ]),
    );
  }
}
