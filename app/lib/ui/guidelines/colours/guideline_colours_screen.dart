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
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class GuidelineColoursScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: MainAppBar(AppLocalizations.of(context)!.guidelinesColours),
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
                  Text(
                      AppLocalizations.of(context)!
                          .guidelinesColoursDescription,
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
