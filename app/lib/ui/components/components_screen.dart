/*
 * Software Name : Orange Design System
 * SPDX-FileCopyrightText: Copyright (c) Orange SA
 * SPDX-License-Identifier: MIT
 *
 * This software is distributed under the MIT license,
 * the text of which is available at https://opensource.org/license/MIT/
 * or see the "LICENSE" file for more details.
 *
 * Software description: Flutter library of reusable graphical components for Android and iOS
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ods_flutter/components/card/ods_small_card.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/component_detail_screen.dart';
import 'package:ods_flutter_demo/ui/components/component_entities.dart';
import 'package:ods_flutter_demo/ui/utilities/display_image.dart';

class ComponentsScreen extends StatelessWidget {
  final List<Component> odsComponents;

  ComponentsScreen({required this.odsComponents});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    int crossAxisCount;
    double childAspectRatio;

    if (width >= 1024) {
      /// Desktop && Tablet
      crossAxisCount = 5;
      childAspectRatio = 1.0;
    } else if (width >= 640) {
      /// Mobile Paysage
      crossAxisCount = 3;
      childAspectRatio = 0.9;
    } else {
      /// Mobile Portrait
      crossAxisCount = 2;
      childAspectRatio = 0.97;
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(spacingS),
        child: GridView.count(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          children: odsComponents.map(
            (component) {
              return Column(
                children: [
                  OdsSmallCard(
                    title: component.title,
                    image: displayImage(
                        component.imageResourceName, double.infinity),
                    onTap: () {
                      Get.to(
                        ComponentDetailScreen(
                          component: component,
                        ),
                        transition: Transition.rightToLeft,
                      );
                    },
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
