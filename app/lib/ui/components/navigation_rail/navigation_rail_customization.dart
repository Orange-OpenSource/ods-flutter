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
import 'package:ods_flutter_demo/ui/components/navigation_rail/navigation_rail_enum.dart';

class _NavigationRailCustomization extends InheritedWidget {
  _NavigationRailCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final NavigationRailCustomizationState data;

  @override
  bool updateShouldNotify(_NavigationRailCustomization oldWidget) => true;
}

class NavigationRailCustomization extends StatefulWidget {
  const NavigationRailCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  NavigationRailCustomizationState createState() =>
      NavigationRailCustomizationState();

  static NavigationRailCustomizationState? of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<_NavigationRailCustomization>())
        ?.data;
  }
}

class NavigationRailCustomizationState
    extends State<NavigationRailCustomization> {
  static get minNavigationItemCount => 2;
  static get maxNavigationItemCount => 5;
  bool _hasBadge = true;
  bool _hasTrailing = false;

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

  bool get hasTrailing => _hasTrailing;
  set hasTrailing(bool value) {
    setState(() {
      _hasTrailing = value;
    });
  }

  /// Enum
  List<NavigationRailsEnum> _elements = [
    NavigationRailsEnum.none,
    NavigationRailsEnum.firstIcon,
    NavigationRailsEnum.secondIcon,
  ];
  NavigationRailsEnum _selectedElement = NavigationRailsEnum.none;

  List<NavigationRailsEnum> get elements => _elements;
  set elements(List<NavigationRailsEnum> value) {
    setState(() {
      _elements = value;
    });
  }

  NavigationRailsEnum get selectedElement => _selectedElement;

  set selectedElement(NavigationRailsEnum value) {
    setState(() {
      _selectedElement = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _NavigationRailCustomization(
      data: this,
      child: widget.child,
    );
  }
}
