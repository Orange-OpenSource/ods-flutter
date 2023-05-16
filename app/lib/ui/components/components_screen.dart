import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ods_flutter/components/card/ods_small_card.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/utilities/display_image.dart';

import 'component.dart';

class ComponentsScreen extends StatefulWidget {
  @override
  State<ComponentsScreen> createState() => _ComponentsScreenState();
}

class _ComponentsScreenState extends State<ComponentsScreen> {
/*
class ComponentsScreen extends StatelessWidget {
  Components group = Components();
=======
  Components component = Components();
>>>>>>> a69b6da (Add display image to accept svg file)

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
*/
  }
}
