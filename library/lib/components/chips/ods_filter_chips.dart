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
class OdsFilterChip extends StatefulWidget {
  /// Creates an ODS Fliter Chip.
  ///
  /// * [text] - Text to be displayed into the chip
  /// * [onClick] - Callback called on chip click.
  /// * [enabled] - The action to be executed when the chips is pressed.
  /// * [leadingAvatar] - Widget of the icon.
  /// * [selected] - Specifies whether the chips is selected or not.
  ///
  const OdsFilterChip({
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
  final void Function(bool)? onClick;

  /// Specifies whether the chips is selected or not.
  final bool enabled;

  /// Specifies whether the chips is selected or not.
  final bool selected;

  /// The optional chip's icon.
  final Widget? leadingAvatar;

  @override
  State<OdsFilterChip> createState() => _OdsFilterChipState();
}

class _OdsFilterChipState extends State<OdsFilterChip> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: FilterChip(
        label: Text(widget.text, style: Theme.of(context).textTheme.bodyMedium),
        onSelected: widget.enabled != false ? widget.onClick : null,
        selected: widget.selected,
        avatar: widget.leadingAvatar,
      ),
    );

    /*
    return Semantics(
      button: true,
      label: widget.label,
      child: ChipTheme(
        data: ChipThemeData(
          iconTheme: const IconThemeData(color: black900),
          checkmarkColor: black900,
          selectedColor: orange200,
          deleteIconColor: black900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          labelStyle: const TextStyle(
            color: ChipLabelColor(),
          ),
        ),
        child: FilterChip(
          label: Text(widget.label),
          avatar: widget.avatar,
          selected: widget.isSelected,
          onSelected: widget.onSelected,
        ),
      ),
    );

     */
  }
}
