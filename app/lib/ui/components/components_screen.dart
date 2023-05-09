import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ods_flutter/components/card/ods_small_card.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/utilities/display_image.dart';

import 'component.dart';

class ComponentsScreen extends StatefulWidget {
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
                    children: OdsComponents.map((c) => OdsSmallCard(
                          title: c.titleRes,
                          image: displayImage(c.imageRes),
                          onTap: () {
                            Get.to(c.varaintsScreen);
                          },
                        )).toList()))));
  }
}
