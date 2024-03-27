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

import 'ods_chip_common.dart';

/// ODS Design Choice Chips.
///
/// Displays a customizable chips with an optional action.
///
class OdsChoiceChip extends StatefulWidget {
  /// Creates an ODS Choice Chip.
  ///
  /// * [text] - Text to be displayed into the chip
  /// * [onClick] - Callback called on chip click.
  /// * [enabled] - The action to be executed when the chips is pressed.
  /// * [leadingAvatar] - Widget of the icon.
  /// * [selected] - Specifies whether the chips is selected or not.
  ///
  const OdsChoiceChip({
    Key? key,
    required this.text,
    this.onClick,
    this.enabled = true,
    this.selected = false,
    this.leadingAvatar,
  }) : super(key: key);

  /// Text to be displayed into the chip.
  final String text;

  /// Callback called on chip click
  final void Function(bool?)? onClick;

  /// Specifies whether the chips is selected or not.
  final bool enabled;

  /// Specifies whether the chips is selected or not.
  final bool selected;

  /// The optional chip's icon.
  final OdsChipLeadingAvatar? leadingAvatar;

  @override
  State<OdsChoiceChip> createState() => _OdsChoiceChipState();
}

class _OdsChoiceChipState extends State<OdsChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: ChoiceChip(
        label: Text(widget.text, style: Theme.of(context).textTheme.bodyMedium),
        onSelected: widget.enabled != false ? widget.onClick : null,
        selected: widget.selected,
        avatar: widget.leadingAvatar,
      ),
    );
  }
}
