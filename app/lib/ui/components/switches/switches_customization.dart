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

class _SwitchesCustomization extends InheritedWidget {
  _SwitchesCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final SwitchesCustomizationState data;

  @override
  bool updateShouldNotify(_SwitchesCustomization oldWidget) => true;
}

class SwitchesCustomization extends StatefulWidget {
  const SwitchesCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  SwitchesCustomizationState createState() => SwitchesCustomizationState();

  static SwitchesCustomizationState? of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<_SwitchesCustomization>())
        ?.data;
  }
}

class SwitchesCustomizationState extends State<SwitchesCustomization> {
  bool _hasEnabled = true;
  bool _hasIcon = false;

  bool get hasEnabled => _hasEnabled;
  set hasEnabled(bool value) {
    setState(() {
      _hasEnabled = value;
    });
  }

  bool get hasIcon => _hasIcon;
  set hasIcon(bool value) {
    setState(() {
      _hasIcon = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _SwitchesCustomization(
      data: this,
      child: widget.child,
    );
  }
}
