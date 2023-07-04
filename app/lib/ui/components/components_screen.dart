import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ods_flutter/components/card/ods_small_card.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/component_entities.dart';
import 'package:ods_flutter_demo/ui/components/detail_screen.dart';
import 'package:ods_flutter_demo/ui/utilities/display_image.dart';

class ComponentsScreen extends StatefulWidget {
  final List<Component> odsComponents;

  ComponentsScreen({required this.odsComponents});

  @override
  State<ComponentsScreen> createState() => _ComponentsScreenState();
}

class _ComponentsScreenState extends State<ComponentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: spacingXs, right: spacingXs, top: spacingS),
          child: GridView.count(
            crossAxisCount: 2,
            children: widget
                .odsComponents // Access the list using widget.odsComponents
                .map((component) => OdsSmallCard(
                      title: component.title,
                      image: displayImage(
                          component.imageResourceName, double.infinity),
                      onTap: () {
                        Get.to(
                            ComponentDetailScreen(
                              component: component,
                            ),
                            transition: Transition.rightToLeft);
                      },
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
