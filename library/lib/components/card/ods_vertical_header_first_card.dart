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

/// ODS Vertical Header First Card.
///
/// Cards contain content and actions about a single subject.
///
/// A ripple effect is managed on card click.
class OdsVerticalHeaderFirstCard extends StatefulWidget {
  const OdsVerticalHeaderFirstCard({
    Key? key,
    required this.title,
    required this.image,
    this.thumbnail,
    this.subtitle,
    this.text,
    this.firstButton,
    this.secondButton,
    this.onClick,
  }) : super(key: key);

  static const double _imageHeight = 200;

  /// The image displayed in the card.
  ///TODO For the moment the fit of the image is handled by the provided image. It should be done in the library but we need help to do that!
  final OdsCardThumbnail? thumbnail;

  /// The card's title displayed below the image.
  final String title;

  /// The image displayed in the card.
  ///TODO For the moment the fit of the image is handled by the provided image. It should be done in the library but we need help to do that!
  final OdsCardImage image;

  /// The optional card's subtitle displayed below the title.
  final String? subtitle;

  /// The optional card's text.
  final String? text;

  /// Optional first button. If null, button will not be shown.
  final OdsTextButton? firstButton;

  /// Optional second button in the card. If null, button will not be shown.
  final OdsTextButton? secondButton;

  /// The action executed on card tap.
  final Function()? onClick;

  @override
  State<OdsVerticalHeaderFirstCard> createState() =>
      _OdsVerticalHeaderFirstCardState();
}

class _OdsVerticalHeaderFirstCardState
    extends State<OdsVerticalHeaderFirstCard> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: SizedBox(
        width: double.infinity,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 2,
          child: InkWell(
            onTap: widget.onClick,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: spacingXs),
                  child: ListTile(
                    leading: widget.thumbnail,
                    title: Text(widget.title!,
                        style: Theme.of(context).textTheme.titleLarge,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    subtitle:
                        widget.subtitle != null ? Text(widget.subtitle!) : null,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: OdsVerticalHeaderFirstCard._imageHeight,
                    child: ExcludeSemantics(child: widget.image),
                  ),
                ),
                if (widget.text != null && widget.text!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(
                        left: spacingM,
                        right: spacingM,
                        top: spacingM,
                        bottom: spacingXs),
                    child: Text(
                      widget.text!,
                    ),
                  ),
                if (widget.firstButton != null || widget.secondButton != null)
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      if (widget.firstButton != null) widget.firstButton!,
                      if (widget.secondButton != null) widget.secondButton!,
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
