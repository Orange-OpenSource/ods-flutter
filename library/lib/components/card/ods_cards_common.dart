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
import 'package:flutter_svg/flutter_svg.dart';

class OdsCardImage extends StatelessWidget {
  final dynamic image;
  final String contentDescription;
  final Alignment alignment;
  final BoxFit contentScale;
  final Color? backgroundColor;

  const OdsCardImage({
    super.key,
    required this.image,
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
          image: _getImageProvider(),
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

  ImageProvider _getImageProvider() {
    if (image is String) {
      if (image.startsWith('http') || image.startsWith('https')) {
        return NetworkImage(image);
      } else {
        return AssetImage(image);
      }
    } else if (image is ImageProvider) {
      return image;
    } else {
      return const AssetImage('assets/placeholder.png');
    }
  }
}

class OdsCardThumbnail extends StatelessWidget {
  final dynamic image;
  final String contentDescription;
  final Alignment alignment;
  final BoxFit contentScale;
  final Color? backgroundColor;

  const OdsCardThumbnail({
    Key? key,
    required this.image,
    required this.contentDescription,
    this.alignment = Alignment.center,
    this.contentScale = BoxFit.cover,
    this.backgroundColor,
  }) : super(key: key);

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
          child: image.endsWith('.svg')
              ? SvgPicture.asset(
                  image,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.secondary,
                    BlendMode.srcIn,
                  ),
                  fit: contentScale,
                  alignment: alignment,
                  placeholderBuilder: (context) => Image.asset(
                    'assets/placeholder.png',
                    fit: BoxFit.cover,
                  ),
                )
              : FadeInImage(
                  placeholder: const AssetImage('assets/placeholder.png'),
                  image: _getImageProvider(),
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

  ImageProvider _getImageProvider() {
    if (image is String) {
      if (image.startsWith('http') || image.startsWith('https')) {
        return NetworkImage(image);
      } else {
        return AssetImage(image);
      }
    } else if (image is ImageProvider) {
      return image;
    } else {
      return const AssetImage('assets/placeholder.png');
    }
  }
}
