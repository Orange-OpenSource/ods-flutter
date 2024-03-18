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
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/l10n/l10n.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class GuidelineColoursScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: MainAppBar(l10n.guidelinesColours),
        body: SafeArea(
          child: ListView(children: [
            Image(
              image: AssetImage('assets/il_color.png'),
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: EdgeInsets.all(spacingM),
              child: Column(
                children: [
                  Text(l10n.guidelinesColoursDescription,
                      style: Theme.of(context).textTheme.bodyMedium),
                  SizedBox(
                    height: spacingM,
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
