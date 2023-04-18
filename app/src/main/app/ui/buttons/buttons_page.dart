import 'package:flutter/material.dart';
import 'package:ods_flutter/ods_flutter.dart';
import 'package:provider/provider.dart';

import '../../domain/recipes/my_app_state.dart';

class ButtonsPage extends StatelessWidget {
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
          TextButton(
            onPressed: () {},
            child: const Text('PrimaryTextButton'),
          ),
          SizedBox(width: 10),
          TextButton(onPressed: null, child: const Text('Disabled'))
        ]),
        SizedBox(height: 10),
        Row(mainAxisSize: MainAxisSize.min, children: [
          IconButton(
              icon: const Icon(Icons.android),
              onPressed: () {},
              style: IconButton.styleFrom(
                  backgroundColor: colors.primary,
                  foregroundColor: colors.onPrimary)),
          SizedBox(width: 10),
          IconButton(
              icon: const Icon(Icons.android),
              onPressed: () {},
              style: IconButton.styleFrom(
                  backgroundColor: colors.secondary,
                  foregroundColor: colors.onSecondary)),
          SizedBox(width: 10),
          IconButton(
            icon: const Icon(Icons.android),
            onPressed: null,
          ),
        ]),
        SizedBox(height: 10),
        Row(mainAxisSize: MainAxisSize.min, children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('Primary'),
          ),
          SizedBox(width: 10),
          ElevatedButton(
              onPressed: () {},
              child: const Text('Secondary'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: colors.secondary,
                  foregroundColor: colors.onSecondary)),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: null,
            child: const Text('Disabled'),
          )
        ]),
        SizedBox(height: 10),
        Text('TODO: DropdownButton'),
        SizedBox(height: 10),
        Text('TODO: FloatingActionButton'),
        SizedBox(height: 10),
        Text('TODO: OutlinedButton'),
        SizedBox(height: 10),
        Text('TODO: PopupMenuButton'),
      ]),
    );
  }
}
