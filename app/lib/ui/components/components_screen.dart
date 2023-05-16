import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ods_flutter/components/card/ods_small_card.dart';
import 'package:ods_flutter/guidelines/spacings.dart';

import '../utilities/display_image.dart';
import 'component.dart';

class ComponentsScreen extends StatefulWidget {
  @override
  State<ComponentsScreen> createState() => _ComponentsScreenState();
}

class _ComponentsScreenState extends State<ComponentsScreen> {
/*
class ComponentsScreen extends StatelessWidget {
  Components group = Components();

*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(
                    left: spacingXs, right: spacingXs, top: spacingS),
                child: GridView.count(
                    crossAxisCount: 2,
                    children: odsComponents
                        .map((c) => OdsSmallCard(
                              title: c.title,
                              image: displayImage(c.imageResourceName),
                              onTap: () {
                                Get.to(c.componentScreen);
                              },
                            ))
                        .toList()))));
/*
                    children:
                        List.generate(group.getComponent().length, (index) {
                      return OdsSmallCard(
                        title: group.getName(index),
                        image: Image.asset(group.getImage(index),
                            semanticLabel: 'Flutter image',
                            fit: BoxFit.fitHeight),
                        onTap: () {
                          Navigator.pushNamed(
                              context, group.getDirections(index));
                        },
                      );
                    })))));
*/
  }
}
