import 'package:flutter/material.dart';
import 'package:ods_flutter/guidelines/spacings.dart';

import '../../utilities/display_image.dart';
import 'component.dart';

class ComponentDetailScreen extends StatelessWidget {
  final Component component;

  const ComponentDetailScreen({required this.component});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(component.titleRes),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            displayImage(
              component.imageRes,
              MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: spacingM,
                  right: spacingM,
                  left: spacingM,
                  bottom: spacingM),
              child: Text(
                component.descriptionRes,
                style: TextStyle(fontSize: spacingM, letterSpacing: 0.5),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount:
                  component.variants.isNotEmpty ? component.variants.length : 1,
              itemBuilder: (BuildContext context, int index) {
                return VariantEntry(variant: component.variants[index]);
              },
            ))
          ],
        ));
  }
}

class VariantEntry extends StatelessWidget {
  final Variant variant;

  const VariantEntry({required this.variant});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.play_circle_outline),
      title: Text(variant.title),
      subtitle: Text(variant.technicalName),
      onTap: () {
        Navigator.pushNamed(context, variant.route);
      },
    );
  }
}
