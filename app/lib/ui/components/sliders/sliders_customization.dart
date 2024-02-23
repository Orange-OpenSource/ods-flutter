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

class _SlidersCustomization extends InheritedWidget {
  _SlidersCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final SlidersCustomizationState data;

  @override
  bool updateShouldNotify(_SlidersCustomization oldWidget) => true;
}

class SlidersCustomization extends StatefulWidget {
  const SlidersCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  SlidersCustomizationState createState() => SlidersCustomizationState();

  static SlidersCustomizationState? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_SlidersCustomization>())
        ?.data;
  }
}

class SlidersCustomizationState extends State<SlidersCustomization> {
  bool _hasIcon = false;
  bool _displayValue = false;
  bool _stepped = false;

  bool get hasIcon => _hasIcon;
  set hasIcon(bool value) {
    setState(() {
      _hasIcon = value;
    });
  }

  bool get displayValue => _displayValue;
  set displayValue(bool value) {
    setState(() {
      _displayValue = value;
    });
  }

  bool get stepped => _stepped;
  set stepped(bool value) {
    setState(() {
      _stepped = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _SlidersCustomization(
      data: this,
      child: widget.child,
    );
  }
}
