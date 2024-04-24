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

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/app_bar/top/ods_top_app_bar.dart';
import 'package:ods_flutter/components/button/ods_button.dart';
import 'package:ods_flutter/components/divider/ods_divider.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter/theme/ods_palette.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/progress/progress_customization.dart';
import 'package:ods_flutter_demo/ui/theme/theme_selector.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutAccessibilityStatement extends StatefulWidget {
  const AboutAccessibilityStatement({Key? key}) : super(key: key);

  @override
  AboutAccessibilityStatementState createState() =>
      AboutAccessibilityStatementState();
}

class AboutAccessibilityStatementState
    extends State<AboutAccessibilityStatement> {
  @override
  Widget build(BuildContext context) {
    return ProgressCustomization(
      child: Scaffold(
        appBar: OdsAppTopBar(
            title:
                AppLocalizations.of(context)!.aboutAccessibilityStatementTitle,
            actions: [ThemeSelector()],
            navigationIcon: BackButton()),
        body: SafeArea(child: Body()),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var declaration = OdsApplication.declaration;

  Uri _url = Platform.isIOS
      ? Uri.parse(
          'https://orange-opensource.github.io/ods-flutter/accessibilityStatement/orange-design-system-ios.html')
      : Uri.parse(
          'https://orange-opensource.github.io/ods-flutter/accessibilityStatement/orange-design-system-android.html');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: spacingM),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Part CircularProgressIndicator
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 220,
                    height: 220,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(
                        begin: 0.0,
                        end: declaration.averageConformity / 100,
                      ),
                      duration: const Duration(seconds: 1),
                      builder: (
                        BuildContext context,
                        double value,
                        Widget? child,
                      ) {
                        return CircularProgressIndicator(
                          value: value,
                          color: Theme.of(context).colorScheme.primary,
                          backgroundColor:
                              Theme.of(context).brightness == Brightness.light
                                  ? grey300
                                  : grey800,
                          strokeWidth: 15,
                        );
                      },
                    ),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Text(
                        '${declaration.averageConformity}${AppLocalizations.of(context)!.aboutAccessibilityStatementCompliant}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                "This application is ${declaration.averageConformity}% compliant with WCAG",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Padding(
                padding: const EdgeInsets.all(spacingM),
                child: OdsDivider(),
              ),

              /// Part detail
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: spacingM, horizontal: spacingM),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .aboutAccessibilityStatementDate,
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              declaration.auditDate,
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: spacingM),
                            Text(
                              AppLocalizations.of(context)!
                                  .aboutAccessibilityStatementIdentity,
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .aboutAccessibilityStatementIdentityName,
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .aboutAccessibilityStatementIdentityAdress,
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: spacingM),
                            Text(
                              AppLocalizations.of(context)!
                                  .aboutAccessibilityStatementReferential,
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              declaration.referential.toString(),
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: spacingM),
                            Text(
                              AppLocalizations.of(context)!
                                  .aboutAccessibilityStatementTechnology,
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              declaration.technologies.technology,
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: OdsButton(
                      text: AppLocalizations.of(context)!
                          .aboutAccessibilityStatementDetailButton,
                      onClick: () => _launchUrl(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
