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

class _MenuCustomization extends InheritedWidget {
  _MenuCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final MenuCustomizationState data;

  @override
  bool updateShouldNotify(_MenuCustomization oldWidget) => true;
}

class MenuCustomization extends StatefulWidget {
  const MenuCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  MenuCustomizationState createState() => MenuCustomizationState();

  static MenuCustomizationState? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_MenuCustomization>())
        ?.data;
  }
}

class MenuCustomizationState extends State<MenuCustomization> {
  bool _hasIcon = false;
  bool _enabled = true;

  bool get hasIcon => _hasIcon;
  set hasIcon(bool value) {
    setState(() {
      _hasIcon = value;
    });
  }

  bool get enabled => _enabled;
  set enabled(bool value) {
    setState(() {
      _enabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _MenuCustomization(
      data: this,
      child: widget.child,
    );
  }
}
