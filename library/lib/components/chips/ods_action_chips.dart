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

/// ODS Design Chips.
///
/// Displays a customizable chips with an optional action.
///
class OdsActionChip extends StatefulWidget {
  /// Creates an ODS Action Chips.
  ///
  /// * [text] - Text displayed in the chip.
  /// * [avatar] - Widget of the icon.
  /// * [onClick] - The action to be executed when the chips is pressed.
  const OdsActionChip({
    Key? key,
    required this.text,
    this.leadingIcon,
    this.onClick,
    this.enabled = true,
  }) : super(key: key);

  /// The app bar title displayed.
  final String text;

  /// The action to be executed when the button is pressed.
  final void Function()? onClick;

  /// The optional chip's icon.
  final Widget? leadingIcon;

  /// Specifies whether the chips is selected or not.
  final bool? enabled;

  @override
  State<OdsActionChip> createState() => _OdsActionChipState();
}

class _OdsActionChipState extends State<OdsActionChip> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: ActionChip(
        label: Text(widget.text),
        avatar: ExcludeSemantics(child: widget.leadingIcon),
        onPressed: widget.enabled != false ? widget.onClick : null,
      ),
    );
  }
}
