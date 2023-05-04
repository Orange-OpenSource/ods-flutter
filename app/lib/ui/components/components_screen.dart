import 'package:flutter/material.dart';
import 'package:ods_flutter/components/card/ods_small_card.dart';
import 'package:ods_flutter/guidelines/spacings.dart';

import '../utilities/display_image.dart';
import 'component.dart';

class ComponentsScreen extends StatefulWidget {
  @override
  State<ComponentsScreen> createState() => _ComponentsScreenState();
}

class _ComponentsScreenState extends State<ComponentsScreen> {
  Components component = Components();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.only(
                    left: spacingXs, right: spacingXs, top: spacingS),
                child: GridView.count(
                    crossAxisCount: 2,
                    children:
                        List.generate(component.getComponent().length, (index) {
                      return OdsSmallCard(
                        title: component.getName(index),
                        image: displayImage(component.getImage(index)),
                        onTap: () {
                          Navigator.pushNamed(
                              context, component.getDirections(index));
                        },
                      );
                    })))));
  }
}
