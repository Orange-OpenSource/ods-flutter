/*
 * Software Name : Orange Design System
 * SPDX-FileCopyrightText: Copyright (c) Orange SA
 * SPDX-License-Identifier: MIT
 *
 * This software is distributed under the MIT licence,
 * the text of which is available at https://opensource.org/license/MIT/
 * or see the "LICENSE" file for more details.
 *
 * Software description: Flutter library of reusable graphical components for Android and iOS
 */

import 'package:flutter/material.dart';

class GuidelineSpacingImage extends StatelessWidget {
  final double spacing;

  GuidelineSpacingImage({required this.spacing});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: 60,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  color: colorScheme.tertiaryContainer,
                ),
              ),
              Expanded(
                child: Container(
                  color: colorScheme.scrim,
                ),
              ),
              Expanded(
                child: Container(
                  color: colorScheme.tertiaryContainer,
                ),
              ),
            ],
          ),
          Container(
            width: spacing,
            color: Colors.blue[400],
          ),
        ],
      ),
    );
  }
}
