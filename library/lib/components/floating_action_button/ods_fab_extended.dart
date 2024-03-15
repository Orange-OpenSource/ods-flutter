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

/// ODS Design Extended Floating Action Button Extended.
///
/// Displays a customizable floating action button with an optional icon and a tooltip.
/// The floating action button
class OdsExtendedFloatingActionButton extends StatelessWidget {
  /// Creates an ODS Floating Action Button.
  ///
  /// * [onClick] - The callback function when the button is pressed.
  /// * [icon] - The icon widget displayed inside the button.
  const OdsExtendedFloatingActionButton({
    Key? key,
    this.onClick,
    required this.text,
    this.icon,
  }) : super(key: key);

  /// The callback function when the button is pressed.
  final void Function()? onClick;

  /// The label text displayed inside the button.
  final String text;

  /// The optional icon widget displayed inside the button.
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: FloatingActionButton.extended(
        onPressed: onClick,
        label: Text(text),
        icon: icon,
      ),
    );
  }
}
