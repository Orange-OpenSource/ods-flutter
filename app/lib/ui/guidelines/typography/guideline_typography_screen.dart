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
import 'package:ods_flutter/components/divider/ods_divider.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/l10n/l10n.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class GuidelineTypographyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final textStyleItems = [
      _TextStyleItem(
          name: 'Headline L',
          textStyle: Theme.of(context).textTheme.headlineLarge,
          code: 'Theme.of(context).textTheme.headlineLarge'),
      _TextStyleItem(
          name: 'Headline M',
          textStyle: Theme.of(context).textTheme.headlineMedium,
          code: 'Theme.of(context).textTheme.headlineMedium'),
      _TextStyleItem(
          name: 'Headline S',
          textStyle: Theme.of(context).textTheme.headlineSmall,
          code: 'Theme.of(context).textTheme.headlineSmall'),
      _TextStyleItem(
          name: 'Title L',
          textStyle: Theme.of(context).textTheme.titleLarge,
          code: 'Theme.of(context).textTheme.titleLarge'),
      _TextStyleItem(
          name: 'Title M',
          textStyle: Theme.of(context).textTheme.titleMedium,
          code: 'Theme.of(context).textTheme.titleMedium'),
      _TextStyleItem(
          name: 'Title S',
          textStyle: Theme.of(context).textTheme.titleSmall,
          code: 'Theme.of(context).textTheme.titleSmall'),
      _TextStyleItem(
          name: 'Body L',
          textStyle: Theme.of(context).textTheme.bodyLarge,
          code: 'Theme.of(context).textTheme.bodyLarge'),
      _TextStyleItem(
          name: 'Body M',
          textStyle: Theme.of(context).textTheme.bodyMedium,
          code: 'Theme.of(context).textTheme.bodyMedium'),
      _TextStyleItem(
          name: 'Body S',
          textStyle: Theme.of(context).textTheme.bodySmall,
          code: 'Theme.of(context).textTheme.bodySmall'),
      _TextStyleItem(
          name: 'Label L',
          textStyle: Theme.of(context).textTheme.labelLarge,
          code: 'Theme.of(context).textTheme.labelLarge'),
      _TextStyleItem(
          name: 'Label M',
          textStyle: Theme.of(context).textTheme.labelMedium,
          code: 'Theme.of(context).textTheme.labelMedium'),
      _TextStyleItem(
          name: 'Label S',
          textStyle: Theme.of(context).textTheme.labelSmall,
          code: 'Theme.of(context).textTheme.labelSmall'),
    ];

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: MainAppBar(l10n.guidelinesTypography),
        body: SafeArea(
          child: ListView(children: [
            Image(
              image: AssetImage('assets/il_typography.png'),
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: EdgeInsets.all(spacingM),
              child: Column(
                children: [
                  Platform.isAndroid
                      ? Text(
                          l10n.guidelinesTypographyAndroidDescription,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      : Text(
                          l10n.guidelinesTypographyAppleDescription,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                  SizedBox(
                    height: spacingM,
                  ),
                  ...textStyleItems.map((textStyleItem) =>
                      _TextStyleWidget(textStyleItem: textStyleItem))
                ],
              ),
            )
          ]),
        ));
  }
}

class _TextStyleWidget extends StatelessWidget {
  const _TextStyleWidget({
    Key? key,
    required this.textStyleItem,
  }) : super(key: key);

  final _TextStyleItem textStyleItem;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: spacingS),
          Text(
            textStyleItem.name,
            style: textStyleItem.textStyle,
          ),
          SizedBox(height: spacingXs),
          Text(
            textStyleItem.code,
            style: Theme.of(context).textTheme.labelMedium,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: spacingS),
          OdsDivider(),
        ],
      ),
    );
  }
}

class _TextStyleItem {
  const _TextStyleItem({
    required this.name,
    required this.textStyle,
    required this.code,
  });

  final String name;
  final TextStyle? textStyle;
  final String code;
}
