import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/component_entities.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';
import 'package:ods_flutter_demo/ui/utilities/display_image.dart';

class ComponentDetailScreen extends StatelessWidget {
  final Component component;

  const ComponentDetailScreen({required this.component});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(component.title),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              displayImage(
                component.imageResourceName,
                MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: const EdgeInsets.all(spacingM),
                child: Text(
                  component.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: component.variants.length,
                itemBuilder: (BuildContext context, int index) {
                  return VariantEntry(variant: component.variants[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VariantEntry extends StatelessWidget {
  final Variant variant;

  const VariantEntry({required this.variant});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      onTap: () {
        Get.to(variant.screen);
      },
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.play_circle_outline),
          ],
        ),
        title: Text(variant.title),
        subtitle: ExcludeSemantics(
          child: Text(variant.technicalName),
        ),
      ),
    );
  }
}
