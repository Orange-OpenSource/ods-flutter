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

class _NavigationBarCustomization extends InheritedWidget {
  _NavigationBarCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final NavigationBarCustomizationState data;

  @override
  bool updateShouldNotify(_NavigationBarCustomization oldWidget) => true;
}

class NavigationBarCustomization extends StatefulWidget {
  const NavigationBarCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  NavigationBarCustomizationState createState() =>
      NavigationBarCustomizationState();

  static NavigationBarCustomizationState? of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<_NavigationBarCustomization>())
        ?.data;
  }
}

class NavigationBarCustomizationState
    extends State<NavigationBarCustomization> {
  static get minNavigationItemCount => 2;
  static get maxNavigationItemCount => 5;
  bool _hasBadge = true;

  int _numberOfItems = minNavigationItemCount;
  int get numberOfItems => _numberOfItems;

  set numberOfItems(int value) {
    setState(() {
      _numberOfItems = value;
    });
  }

  bool get hasBadge => _hasBadge;
  set hasBadge(bool value) {
    setState(() {
      _hasBadge = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _NavigationBarCustomization(
      data: this,
      child: widget.child,
    );
  }
}
