import 'package:flutter/material.dart';
import 'package:ods_flutter/components/ods_localized_component.dart';

class ComponentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 24),
            ),
            onPressed: () {},
            child: Text('ODS components'),
          ),
          Card(
            child: ListTile(title: OdsLocalizedComponent()),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/component_cards');
              },
              title: const Center(child: Text('Cards')),
            ),
          ),
          Card(
              child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/component_checkboxes');
            },
            title: const Center(child: Text('Checkboxes')),
          )),
          Card(
              child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/component_radioButtons');
                  },
                  title: const Center(child: Text('Radio Buttons')))),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/component_switches');
              },
              title: const Center(child: Text('Switches')),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle:
                  const TextStyle(fontSize: 24, decorationColor: Colors.black),
            ),
            onPressed: () {},
            child: Text('Material'),
          ),
          Card(
              child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/component_material');
                  },
                  title: const Center(child: Text('See all')))),
        ],
      ),
    );
  }
}
