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

enum OdsImageShapeEnum {
  none,
  icon,
  circle,
  wide,
  square,
}

class OdsImageShape {
  final String? shape;
  final BuildContext context;
  final String? url;

  OdsImageShape(this.context, this.shape, this.url);

  Widget? buildImage() {
    var colorScheme = Theme.of(context).colorScheme;
    var activeColorFilter =
        ColorFilter.mode(colorScheme.secondary, BlendMode.srcIn);

    if (shape == OdsImageShapeEnum.none.name) {
      return null;
    } else if (shape == OdsImageShapeEnum.icon.name) {
      return SvgPicture.asset(
        url!,
        fit: BoxFit.cover,
        width: 55,
        height: 45,
        colorFilter: activeColorFilter,
        placeholderBuilder: (context) => Image.asset(
          'assets/placeholder.png',
          fit: BoxFit.cover,
          width: 55,
          height: 45,
        ),
      );
    } else if (shape == OdsImageShapeEnum.circle.name) {
      return CircleAvatar(
        backgroundImage: NetworkImage(url!),
        radius: 25,
      );
    } else if (shape == OdsImageShapeEnum.wide.name) {
      return FadeInImage(
        placeholder: const AssetImage('assets/placeholder.png'),
        image: NetworkImage(url!),
        fit: BoxFit.cover,
        alignment: Alignment.center,
        width: 110,
        height: 74,
        imageErrorBuilder: (context, error, stackTrace) {
          return const Image(
            image: AssetImage('assets/placeholder.png'),
            fit: BoxFit.cover,
            alignment: Alignment.center,
            width: 110,
            height: 74,
          );
        },
      );
    } else if (shape == OdsImageShapeEnum.square.name) {
      return FadeInImage(
        placeholder: const AssetImage('assets/placeholder.png'),
        image: NetworkImage(url!),
        fit: BoxFit.cover,
        alignment: Alignment.center,
        width: 60,
        height: 74,
        imageErrorBuilder: (context, error, stackTrace) {
          return const Image(
            image: AssetImage('assets/placeholder.png'),
            fit: BoxFit.cover,
            alignment: Alignment.center,
            width: 60,
            height: 74,
          );
        },
      );
    }
    return null;
  }
}
