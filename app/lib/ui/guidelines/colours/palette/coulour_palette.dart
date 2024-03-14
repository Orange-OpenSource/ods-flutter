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

class ColourPalette extends StatefulWidget {
  const ColourPalette({super.key});
  @override
  State<ColourPalette> createState() => _ColourPaletteState();
}

class _ColourPaletteState extends State<ColourPalette> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
          AppLocalizations.of(context)!.guidelinesColoursPaletteVariantTitle),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildRow([
              ColorItem(
                color: orange100,
                name: 'Orange 100',
                description: '#FF7900',
                token: "orange100",
              ),
              ColorItem(
                color: orange200,
                name: 'Orange 200',
                description: '#F16E00',
                token: "orange200",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: white100,
                name: 'White 100',
                description: '#FFFFFF',
                token: "white100",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: grey200,
                name: 'Gray 200',
                description: '#EEEEEE',
                token: "grey200",
              ),
              ColorItem(
                color: grey300,
                name: 'Gray 300',
                description: '#DDDDDD',
                token: "grey300",
              ),
              ColorItem(
                color: grey400,
                name: 'Gray 400',
                description: '#CCCCCC',
                token: "grey400",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: grey500,
                name: 'Gray 500',
                description: '#999999',
                token: "grey500",
              ),
              ColorItem(
                color: grey600,
                name: 'Gray 600',
                description: '##666666',
                token: "grey600",
              ),
              ColorItem(
                color: obsGrey700,
                name: 'Gray 700',
                description: '#595959',
                token: "obsGrey700",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: grey800,
                name: 'Gray 800',
                description: '#333333',
                token: "grey800",
              ),
              ColorItem(
                color: grey900,
                name: 'Gray 900',
                description: '#141414',
                token: "grey900",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: black900,
                name: 'Black 900',
                description: '#000000',
                token: "black900",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: positive100,
                name: 'Forest 100',
                description: '#66CC66',
                token: "positive100",
              ),
              ColorItem(
                color: positive200,
                name: 'Forest 200',
                description: '#228722',
                token: "positive200",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: negative100,
                name: 'Fire 100',
                description: '#FF4D4D',
                token: "negative100",
              ),
              ColorItem(
                color: negative200,
                name: 'Fire 200',
                description: '#CD3C14',
                token: "negative200",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: info100,
                name: 'Water 100',
                description: '#6699FF',
                token: "info100",
              ),
              ColorItem(
                color: info200,
                name: 'Water 200',
                description: '#4170D8',
                token: "info200",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: alert100,
                name: 'Sun 100',
                description: '#FFCC00',
                token: "alert100",
              ),
              ColorItem(
                color: alert200,
                name: 'Sun 200',
                description: '#8F7200',
                token: "alert200",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: blue100,
                name: 'Blue 100',
                description: '#B5E8F7',
                token: "blue100",
              ),
              ColorItem(
                color: blue200,
                name: 'Blue 200',
                description: '#80CEEF',
                token: "blue200",
              ),
              ColorItem(
                color: blue300,
                name: 'Blue 300',
                description: '#4BB4E6',
                token: "blue300",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: blue400,
                name: 'Blue 400',
                description: '#3E9DD6',
                token: "blue400",
              ),
              ColorItem(
                color: blue500,
                name: 'Blue 500',
                description: '#237ECA',
                token: "blue500",
              ),
              ColorItem(
                color: blue600,
                name: 'Blue 600',
                description: '#085EBD',
                token: "blue600",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: green100,
                name: 'Green 100',
                description: '#B8EBD6',
                token: "green100",
              ),
              ColorItem(
                color: green200,
                name: 'Green 200',
                description: '#84D5AF',
                token: "green200",
              ),
              ColorItem(
                color: green300,
                name: 'Green 300',
                description: '#50BE87',
                token: "green300",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: green400,
                name: 'Green 400',
                description: '#27A971',
                token: "green400",
              ),
              ColorItem(
                color: green500,
                name: 'Green 500',
                description: '#198C51',
                token: "green500",
              ),
              ColorItem(
                color: green600,
                name: 'Green 600',
                description: '#0A6E31',
                token: "green600",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: pink100,
                name: 'Pink 100',
                description: '#FFE8F7',
                token: "pink100",
              ),
              ColorItem(
                color: pink200,
                name: 'Pink 200',
                description: '#FFCEEF',
                token: "pink200",
              ),
              ColorItem(
                color: pink300,
                name: 'Pink 300',
                description: '#FFB4E6',
                token: "pink300",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: pink400,
                name: 'Pink 400',
                description: '#FF8AD4',
                token: "pink400",
              ),
              ColorItem(
                color: pink500,
                name: 'Pink 500',
                description: '#D573BB',
                token: "pink500",
              ),
              ColorItem(
                color: pink600,
                name: 'Pink 600',
                description: '#BC4D9A',
                token: "pink600",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: purple100,
                name: 'Purple 100',
                description: '#D9C2F0',
                token: "purple100",
              ),
              ColorItem(
                color: purple200,
                name: 'Purple 200',
                description: '#C1A4E4',
                token: "purple200",
              ),
              ColorItem(
                color: purple300,
                name: 'Purple 300',
                description: '#A885D8',
                token: "purple300",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: purple400,
                name: 'Purple 400',
                description: '#9373BD',
                token: "purple400",
              ),
              ColorItem(
                color: purple500,
                name: 'Purple 500',
                description: '#6E4AA7',
                token: "purple500",
              ),
              ColorItem(
                color: purple600,
                name: 'Purple 600',
                description: '#492191',
                token: "purple600",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: yellow100,
                name: 'Yellow 100',
                description: '#FFF6B6',
                token: "yellow100",
              ),
              ColorItem(
                color: yellow200,
                name: 'Yellow 200',
                description: '#FFE45B',
                token: "yellow200",
              ),
              ColorItem(
                color: yellow300,
                name: 'Yellow 300',
                description: '#FFD200',
                token: "yellow300",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: yellow400,
                name: 'Yellow 400',
                description: '#FFD400',
                token: "yellow400",
              ),
              ColorItem(
                color: yellow500,
                name: 'Yellow 500',
                description: '#B98F11',
                token: "yellow500",
              ),
              ColorItem(
                color: yellow600,
                name: 'Yellow 600',
                description: '#9D6E06',
                token: "yellow600",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: organic100,
                name: 'Organic 100',
                description: '#F9F5F0',
                token: "organic100",
              ),
              ColorItem(
                color: organic200,
                name: 'Organic 200',
                description: '#F4CFB2',
                token: "organic200",
              ),
              ColorItem(
                color: organic300,
                name: 'Organic 300',
                description: '#C19372',
                token: "organic300",
              ),
            ]),
            SizedBox(height: 20),
            _buildRow([
              ColorItem(
                color: organic400,
                name: 'Organic 400',
                description: '#714E46',
                token: "organic400",
              ),
              ColorItem(
                color: organic500,
                name: 'Organic 500',
                description: '#62342D',
                token: "organic500",
              ),
              ColorItem(
                color: organic600,
                name: 'Organic 600',
                description: '#482E26',
                token: "organic600",
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
                  height: 110,
                  width: 110,
                  color: color,
                ),
              ),
            if (color == Theme.of(context).colorScheme.background ||
                color == Theme.of(context).colorScheme.surface)
              Padding(
                padding: const EdgeInsets.only(right: spacingM),
                child: Container(
                  height: 110,
                  width: 110,
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
            Text(
              token,
              style: TextStyle(
                  fontFamily: Platform.isAndroid ? 'Roboto Mono' : 'SF Mono',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.43,
                  letterSpacing: 0.25),
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
            text: AppLocalizations.of(context)!
                .guidelineColourCopyToClipboardButtonTitle,
            onClick: () {
              Clipboard.setData(ClipboardData(text: token)).then((_) {
                OdsSnackbar.showSnackbarSingleLine(
                    message: AppLocalizations.of(context)!
                        .guidelineColourCopyToClipboardToast,
                    context: context);
              });
            },
          )
        ],
      ),
    );
  }
}
