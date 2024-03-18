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
import 'package:ods_flutter_demo/ui/guidelines/guideline_detail_screen.dart';
import 'package:ods_flutter_demo/ui/guidelines/guidelines_entities.dart';

class GuidelinesScreen extends StatelessWidget {
  final List<Guideline> odsGuidelines;

  GuidelinesScreen({required this.odsGuidelines});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: odsGuidelines.length,
        itemBuilder: (context, index) {
          var guideline = odsGuidelines[index];
          return Padding(
            padding: const EdgeInsets.all(spacingS),
            child: Column(
              children: [
                OdsVerticalImageFirstCard(
                  title: guideline.title,
                  image: OdsCardImage(
                    imageProvider: AssetImage(guideline.imageResourceName),
                    contentDescription: '', //Optional
                    alignment: Alignment.center,
                    contentScale: BoxFit.cover,
                  ),
                  onClick: () {
                    if (guideline.screen != null) {
                      Get.to(
                        guideline.screen!,
                        transition: Transition.rightToLeft,
                      );
                    } else {
                      Get.to(
                        GuidelineDetailScreen(
                          guideline: guideline,
                        ),
                        transition: Transition.rightToLeft,
                      );
                    }
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
