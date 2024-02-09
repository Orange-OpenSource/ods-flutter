/*
 * Software Name : Orange Design System
 * SPDX-FileCopyrightText: Copyright (c) Orange SA
 * SPDX-License-Identifier: MIT
 *
 * This software is distributed under the MIT licence,
 * the text of which is available at https://opensource.org/license/MIT/
 * or see the "LICENSE" file for more details.
 *
 * Software description: Flutter library of reusable graphical components for Android and iOS
 */

import 'package:flutter/material.dart';

///
/// A leading icon in an [OdsChip].
///
/// Creates an instance of [OdsChipLeadingIcon].
/// * [image] - Text to be displayed into the chip
/// * [contentDescription] - Callback called on chip click.
///
class OdsChipLeadingIcon extends StatelessWidget {
  const OdsChipLeadingIcon(this.image, this.contentDescription, {super.key});

  /// The image associated to this [OdsChipLeadingAvatar].
  final ImageProvider<Object> image;

  /// The content description associated to this [OdsChipLeadingAvatar].
  final String? contentDescription;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: image,
      width: 24,
      height: 24,
      fit: BoxFit.contain,
      semanticLabel: contentDescription,
    );
  }
}

///
/// A leading icon in an [OdsChip].
///
/// Creates an instance of [OdsChipLeadingAvatar].
/// * [image] - Text to be displayed into the chip
/// * [contentDescription] - Callback called on chip click.
///
class OdsChipLeadingAvatar extends StatelessWidget {
  const OdsChipLeadingAvatar({
    super.key,
    required this.image,
    this.contentDescription,
  });

  /// The image associated to this [OdsChipLeadingAvatar].
  final ImageProvider<Object> image;

  /// The content description associated to this [OdsChipLeadingAvatar].
  final String? contentDescription;

  @override
  Widget build(BuildContext context) {
    Widget circleAvatar = CircleAvatar(
      backgroundImage: image,
      radius: 12,
      backgroundColor: Colors.transparent,
    );

    if (contentDescription != null) {
      circleAvatar = Semantics(
        label: contentDescription!,
        image: true,
        child: circleAvatar,
      );
    }

    return circleAvatar;
  }
}
