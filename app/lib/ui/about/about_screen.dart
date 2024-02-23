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
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/about/changelog_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
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
                    style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(height: spacingXs),
                Text(
                    'Version ${_packageInfo.version} (build ${_packageInfo.buildNumber})',
                    style: Theme.of(context).textTheme.bodySmall),
                SizedBox(height: spacingXs),
                Text(AppLocalizations.of(context)!.aboutScreenDescription,
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.aboutMenuChangelog,
                style: Theme.of(context).textTheme.bodyMedium),
            onTap: () {
              Get.to(
                OdsAboutFileScreen(
                  fileMenuItem: 'CHANGELOG.md',
                  darkModeEnabled:
                      Theme.of(context).brightness == Brightness.light,
                ),
              );
            },
          ),
        ],
      ),
    )));
  }
}
