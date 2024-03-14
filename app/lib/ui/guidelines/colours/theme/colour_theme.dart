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
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/button/ods_button.dart';
import 'package:ods_flutter/components/snackbars/ods_snackbar.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter/theme/ods_palette.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ColourTheme extends StatefulWidget {
  const ColourTheme({super.key});
  @override
  State<ColourTheme> createState() => _ColourThemeState();
}

class _ColourThemeState extends State<ColourTheme> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
          AppLocalizations.of(context)!.guidelinesColoursThemeVariantTitle),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue = Theme.of(context).brightness;
    bool isLight = brightnessValue == Brightness.light;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildRow([
              ColorItem(
                color: Theme.of(context).colorScheme.background,
                name: 'background',
                description: isLight ? 'white100' : 'black900',
                token: "Theme.of(context).colorScheme.background",
              ),
              ColorItem(
                color: Theme.of(context).colorScheme.onBackground,
                name: 'onBackground',
                description: isLight ? 'black900' : 'grey200',
                token: "Theme.of(context).colorScheme.onBackground",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: Theme.of(context).colorScheme.primary,
                name: 'primary',
                description: isLight ? 'orange200' : 'orange100',
                token: "Theme.of(context).colorScheme.primary",
              ),
              ColorItem(
                color: Theme.of(context).colorScheme.onPrimary,
                name: 'onPrimary',
                description: isLight ? 'black900' : 'black900',
                token: "Theme.of(context).colorScheme.onPrimary",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: Theme.of(context).colorScheme.secondary,
                name: 'secondary',
                description: isLight ? 'black900' : 'white100',
                token: "Theme.of(context).colorScheme.secondary",
              ),
              ColorItem(
                color: Theme.of(context).colorScheme.onSecondary,
                name: 'onSecondary',
                description: isLight ? 'white100' : 'black900',
                token: "Theme.of(context).colorScheme.onSecondary",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: Theme.of(context).colorScheme.secondaryContainer,
                name: 'secondaryContainer',
                description: isLight ? 'grey800' : 'grey400',
                token: "Theme.of(context).colorScheme.secondaryContainer",
              ),
              ColorItem(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                name: 'onSecondaryContainer',
                description: isLight ? 'grey800' : 'black900',
                token: "Theme.of(context).colorScheme.onSecondaryContainer",
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(List<ColorItem> colorItems) {
    return IntrinsicHeight(
      child: Row(
        children: colorItems,
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  final Color color;
  final String name;
  final String description;
  final String token;

  ColorItem({
    required this.color,
    required this.name,
    required this.description,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return ColorDialog(
                color: color,
                name: name,
                description: description,
                token: token,
              );
            },
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (color != Theme.of(context).colorScheme.background ||
                color != Theme.of(context).colorScheme.surface)
              Padding(
                padding: const EdgeInsets.only(right: spacingM),
                child: Container(
                  height: 170,
                  color: color,
                ),
              ),
            if (color == Theme.of(context).colorScheme.background ||
                color == Theme.of(context).colorScheme.surface)
              Padding(
                padding: const EdgeInsets.only(right: spacingM),
                child: Container(
                  height: 170,
                  decoration: BoxDecoration(
                    color: color,
                    border: Border.all(
                        color: Theme.of(context).brightness == Brightness.light
                            ? black900
                            : white100),
                  ),
                ),
              ),
            SizedBox(height: spacingM),
            Text(
              name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(description),
          ],
        ),
      ),
    );
  }
}

class ColorDialog extends StatelessWidget {
  final Color color;
  final String name;
  final String description;
  final String token;

  ColorDialog({
    required this.color,
    required this.name,
    required this.description,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (color == white100)
            Container(
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                color: color,
                border: Border.all(color: black900),
              ),
            ),
          if (color != white100)
            Container(
              width: double.infinity,
              height: 230,
              color: color,
            ),
          SizedBox(height: spacingM),
          Text(
            name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: spacingS),
          Text(
            token,
            style: TextStyle(
                fontFamily: Platform.isAndroid ? 'Roboto Mono' : 'SF Mono',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.43,
                letterSpacing: 0.25),
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: spacingM),
          OdsButton(
            text: 'Copy',
            onClick: () {
              Clipboard.setData(ClipboardData(text: token)).then((_) {
                OdsSnackbar.showSnackbarSingleLine(
                  message: 'Color token value copied to the clipboard',
                  context: context,
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
