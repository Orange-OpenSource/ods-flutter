import 'package:flutter/material.dart';
import 'package:ods_flutter/guidelines/spacings.dart';

const rowSpacer = SizedBox(width: spacingM);
const componentSpacer = SizedBox(height: spacingS);
const double cardWidth = 240;
const double widthConstraint = 450;

class ComponentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle:
                  const TextStyle(fontSize: 24, decorationColor: Colors.black),
            ),
            onPressed: () {},
            child: Text('ODS components'),
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
                  title: const Center(child: Text('Radios Buttons')))),
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
                    Navigator.pushNamed(context, '/component_metarial');
                  },
                  title: const Center(child: Text('See all')))),
        ],
      ),
    );
  }
}
