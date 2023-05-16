import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/template/component.dart';
import 'package:ods_flutter_demo/ui/utilities/display_image.dart';

class ComponentDetailScreen extends StatelessWidget {
  final OdsComponent component;

  const ComponentDetailScreen({required this.component});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(component.title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            displayImage(
              component.imageResourceName,
              MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: spacingM,
                  right: spacingM,
                  left: spacingM,
                  bottom: spacingM),
              child: Text(
                component.description,
                style: TextStyle(fontSize: spacingM, letterSpacing: 0.5),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: component.variants.length,
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
        Get.to(variant.screen);
      },
    );
  }
}
