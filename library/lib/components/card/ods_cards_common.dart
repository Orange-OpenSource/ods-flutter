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

class OdsCardImage extends StatelessWidget {
  final ImageProvider imageProvider;
  final String contentDescription;
  final Alignment alignment;
  final BoxFit contentScale;
  final Color? backgroundColor;

  const OdsCardImage({
    super.key,
    required this.imageProvider,
    required this.contentDescription,
    this.alignment = Alignment.center,
    this.contentScale = BoxFit.cover,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      image: true,
      label: contentDescription,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: FadeInImage(
          placeholder: const AssetImage('assets/placeholder.png'),
          image: imageProvider,
          fit: contentScale,
          alignment: alignment,
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/placeholder.png',
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}

class OdsCardThumbnail extends StatelessWidget {
  final ImageProvider imageProvider;
  final String contentDescription;
  final Alignment alignment;
  final BoxFit contentScale;
  final Color? backgroundColor;

  const OdsCardThumbnail({
    super.key,
    required this.imageProvider,
    required this.contentDescription,
    this.alignment = Alignment.center,
    this.contentScale = BoxFit.cover,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      image: true,
      label: contentDescription,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: ClipOval(
          child: FadeInImage(
            placeholder: const AssetImage('assets/placeholder.png'),
            image: imageProvider,
            fit: contentScale,
            alignment: alignment,
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'assets/placeholder.png',
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
    );
  }
}
