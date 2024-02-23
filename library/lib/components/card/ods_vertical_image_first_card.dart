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
import 'package:ods_flutter/components/button/ods_button.dart';
import 'package:ods_flutter/components/button/ods_outlined_button.dart';
import 'package:ods_flutter/components/card/ods_cards_common.dart';
import 'package:ods_flutter/guidelines/spacings.dart';

/// ODS Vertical image first card.
///
/// Cards contain content and actions about a single subject.
///
/// A ripple effect is managed on card click.
class OdsVerticalImageFirstCard extends StatefulWidget {
  /// Creates an ODS vertical image first card.
  const OdsVerticalImageFirstCard({
    Key? key,
    required this.title,
    required this.image,
    this.subtitle,
    this.text,
    this.firstButton,
    this.secondButton,
    this.onClick,
  }) : super(key: key);

  static const double _imageHeight = 200;

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
  final OdsOutlinedButton? firstButton;

  /// Optional second button in the card. If null, button will not be shown.
  final OdsButton? secondButton;

  /// The action executed on card tap.
  final Function()? onClick;

  @override
  State<OdsVerticalImageFirstCard> createState() =>
      _OdsVerticalImageFirstCardState();
}

class _OdsVerticalImageFirstCardState extends State<OdsVerticalImageFirstCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IntrinsicHeight(
          child: SizedBox(
            width: double.infinity,
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 2,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: widget.onClick,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: OdsVerticalImageFirstCard._imageHeight,
                          child: widget.image,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: spacingM, left: spacingM),
                        child: Text(
                          widget.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      if (widget.subtitle != null)
                        Padding(
                          padding: const EdgeInsets.only(left: spacingM),
                          child: Text(
                            widget.subtitle!,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      if (widget.text != null && widget.text!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(
                              left: spacingM, right: spacingM, top: spacingS),
                          child: Text(
                            widget.text!,
                          ),
                        ),
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
          ),
        ),
      ],
    );
  }
}
