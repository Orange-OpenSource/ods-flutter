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
import 'package:ods_flutter/components/button/ods_text_button.dart';
import 'package:ods_flutter/components/card/ods_cards_common.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter/theme/ods_theme.dart';

enum OdsHorizontalCardImagePosition {
  start,
  end,
}

/// ODS Horizontal card.
///
/// Cards contain content and actions about a single subject.
///
/// A ripple effect is managed on card click.
class OdsHorizontalCard extends StatelessWidget {
  const OdsHorizontalCard({
    Key? key,
    required this.title,
    required this.image,
    this.subtitle,
    this.text,
    this.firstButton,
    this.secondButton,
    this.imagePosition = OdsHorizontalCardImagePosition.start,
    this.divider = true,
    this.onClick,
  }) : super(key: key);

  static const double _imageHeight = 0;
  static const double _imageWidth = 150;
  static const double _imageMinWidth = 120;
  static const double _dividerOpacity = 0.12;

  /// The image displayed in the card.
  ///TODO For the moment the fit of the image is handled by the provided image. It should be done in the library but we need help to do that!
  final OdsCardImage image;

  /// The card's title displayed below the image.
  final String title;

  /// The optional card's subtitle displayed below the title.
  final String? subtitle;

  /// The optional card's text.
  final String? text;

  /// Optional first button. If null, button will not be shown.
  final OdsTextButton? firstButton;

  /// Optional second button in the card. If null, button will not be shown.
  final OdsTextButton? secondButton;

  /// imagePosition Position of the image within the card, it can be set to [OdsHorizontalCardImagePosition.Start] or [OdsHorizontalCardImagePosition.End]. [OdsHorizontalCardImagePosition.Start] by default.
  final OdsHorizontalCardImagePosition imagePosition;

  /// Optional divider in the card. If false, divider will not be shown.
  final bool? divider;

  /// The action executed on card tap.
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      image: false,
      label: 'Card',
      child: Stack(
        children: [
          IntrinsicHeight(
            child: SizedBox(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(odsCardRadius),
                ),
                elevation: 2,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onClick,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints:
                              const BoxConstraints(minHeight: _imageMinWidth),
                          child: IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                if (imagePosition ==
                                    OdsHorizontalCardImagePosition.start)
                                  ExcludeSemantics(
                                    child: SizedBox(
                                      width: _imageWidth,
                                      height: _imageHeight,
                                      child: image,
                                    ),
                                  ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: spacingM,
                                        top: spacingM,
                                        right: spacingM,
                                        bottom: spacingS),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        if (subtitle != null)
                                          Text(
                                            subtitle!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        if (text != null)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: spacingM),
                                            child: Text(text!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                                maxLines: 2,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (imagePosition ==
                                    OdsHorizontalCardImagePosition.end)
                                  ExcludeSemantics(
                                    child: SizedBox(
                                      width: OdsHorizontalCard._imageWidth,
                                      height: OdsHorizontalCard._imageHeight,
                                      child: ExcludeSemantics(child: image),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        ),
                        if (divider != false)
                          Divider(
                            height: 0,
                            thickness: 1,
                            indent: 0,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(_dividerOpacity),
                          ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              if (firstButton != null)
                                Padding(
                                  padding: const EdgeInsets.all(spacingS),
                                  child: firstButton,
                                ),
                              if (secondButton != null)
                                Padding(
                                  padding: const EdgeInsets.all(spacingS),
                                  child: secondButton,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
