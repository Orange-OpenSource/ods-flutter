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
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:get/get.dart';
import 'package:ods_flutter/components/lists/ods_list_item.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/about/detail/about_file_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  // TODO: correct version package insertion
  // Package Version instantiation
  PackageInfo _packageInfo = PackageInfo(
      appName: 'Unknown',
      packageName: 'Unknown',
      version: 'Unknown',
      buildNumber: 'Unknown');

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                  image: AssetImage('assets/il_about.png'),
                  width: double.infinity,
                  fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(spacingM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(AppLocalizations.of(context)!.aboutScreenTitle,
                        style: Theme.of(context).textTheme.headlineLarge),
                    SizedBox(height: spacingXs),
                    Text(
                        'Version ${_packageInfo.version} (build ${_packageInfo.buildNumber})',
                        style: Theme.of(context).textTheme.bodySmall),
                    SizedBox(height: spacingM),
                    Text(AppLocalizations.of(context)!.aboutScreenDescription,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
              OdsListItem(
                title: AppLocalizations.of(context)!.aboutMenuChangelog,
                image: ImageIcon(
                  AssetImage('assets/ic_task_list.png'),
                ),
                onClick: () {
                  Get.to(
                    OdsAboutFileScreen(
                      title: AppLocalizations.of(context)!.aboutMenuChangelog,
                      fileMenuItem: 'CHANGELOG.md',
                      darkModeEnabled:
                          Theme.of(context).brightness == Brightness.light,
                    ),
                  );
                },
              ),
              OdsListItem(
                title: "Privacy Policy",
                image: ImageIcon(
                  AssetImage('assets/ic_identity_protection.png'),
                ),
                onClick: () {
                  Get.to(
                    OdsAboutFileScreen(
                      title: "Privacy Policy",
                      fileMenuItem: 'assets/ic_about_privacy_policy.md',
                      darkModeEnabled:
                          Theme.of(context).brightness == Brightness.light,
                    ),
                  );
                },
              ),
              OdsListItem(
                title: "Terms of services",
                image: ImageIcon(
                  AssetImage('assets/ic_calendar_event_info.png'),
                ),
                onClick: () {
                  Get.to(
                    OdsAboutFileScreen(
                      title: "Terms of services",
                      fileMenuItem: 'assets/ic_about_terms_of_service.md',
                      darkModeEnabled:
                          Theme.of(context).brightness == Brightness.light,
                    ),
                  );
                },
              ),
              OdsListItem(
                title: "Third party library",
                image: ImageIcon(
                  AssetImage('assets/ic_task_list.png'),
                ),
                onClick: () {
                  Get.to(
                    OdsAboutFileScreen(
                      title: "Third party library",
                      fileMenuItem: 'THIRD_PARTY.md',
                      darkModeEnabled:
                          Theme.of(context).brightness == Brightness.light,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
