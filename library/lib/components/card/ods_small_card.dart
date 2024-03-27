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
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter/theme/ods_theme.dart';

/// ODS Small card.
///
/// Cards contain content and actions about a single subject.
///
/// A ripple effect is managed on card click.
class OdsSmallCard extends StatefulWidget {
  /// Creates an ODS Small card.
  const OdsSmallCard({
    Key? key,
    required this.title,
    required this.image,
    this.subtitle,
    this.onTap,
  }) : super(key: key);

  static const double _imageHeight = 110;

  /// The card's title displayed below the image.
  final String title;

  /// The image displayed in the card.
  ///TODO For the moment the fit of the image is handled by the provided image. It should be done in the library but we need help to do that!
  final Widget image;

  /// The optional card's subtitle displayed below the title.
  final String? subtitle;

  /// The action executed on card tap.
  final Function()? onTap;

  @override
  State<OdsSmallCard> createState() => _OdsSmallCardState();
}

class _OdsSmallCardState extends State<OdsSmallCard> {
  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Semantics(
        button: widget.onTap != null ? true : false,
        onTap: widget.onTap,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(odsCardRadius),
                ),
                elevation: 2,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: OdsSmallCard._imageHeight,
                      child: ExcludeSemantics(child: widget.image),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(spacingM),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: Theme.of(context).textTheme.titleMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (widget.subtitle != null)
                              Text(
                                widget.subtitle!,
                                style: Theme.of(context).textTheme.bodyMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                          ]),
                    )
                  ],
                ),
              ),
            ),
            if (widget.onTap != null)
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: widget.onTap,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
