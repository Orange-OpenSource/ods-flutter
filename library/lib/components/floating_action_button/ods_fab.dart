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

/// ODS Design Floating Action Button.
///
/// Displays a customizable floating action button with an optional icon and a tooltip.
/// The floating action button can expand to full screen width if specified.
class OdsFloatingActionButton extends StatefulWidget {
  /// Creates an ODS Floating Action Button.
  ///
  /// * [onClick] - The callback function when the button is pressed.
  /// * [icon] - The icon widget displayed inside the button.
  /// * [semanticsLabel] - The description accessibility button.
  const OdsFloatingActionButton({
    Key? key,
    this.onClick,
    required this.icon,
    this.semanticsLabel = "Floating action",
  }) : super(key: key);

  /// The optional icon widget displayed inside the button.
  final Widget? icon;

  /// The callback function when the button is pressed.
  final void Function()? onClick;

  /// The optional description accessibility floating button.
  final String? semanticsLabel;

  @override
  State<OdsFloatingActionButton> createState() =>
      _OdsFloatingActionButtonState();
}

class _OdsFloatingActionButtonState extends State<OdsFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: widget.semanticsLabel,
      excludeSemantics: true,
      child: FloatingActionButton(
        onPressed: widget.onClick,
        child: widget.icon,
      ),
    );
  }
}
