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
import 'package:ods_flutter/components/card/ods_cards_common.dart';
import 'package:ods_flutter/components/card/ods_vertical_image_first_card.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/modules/modules_entities.dart';

class ModulesScreen extends StatelessWidget {
  ModulesScreen({required this.odsModules});

  final List<Module> odsModules;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: odsModules.length,
        itemBuilder: (context, index) {
          var module = odsModules[index];
          return Padding(
            padding: const EdgeInsets.all(spacingS),
            child: Column(
              children: [
                OdsVerticalImageFirstCard(
                  title: module.title,
                  image: OdsCardImage(
                    imageProvider: AssetImage(module.imageResourceName),
                    contentDescription: '', //Optional
                    alignment: Alignment.center,
                    contentScale: BoxFit.cover,
                  ),
                  onClick: () {
                    Get.to(
                      module.screen,
                      transition: Transition.rightToLeft,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
