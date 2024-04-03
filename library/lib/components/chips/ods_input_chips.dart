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
import 'package:ods_flutter/theme/ods_palette.dart';

/// ODS Design Chips.
///
/// Displays a customizable chips with an optional action.
///
class OdsInputChip extends StatelessWidget {
  /// Creates an ODS Action Chips.
  ///
  /// * [text] - Text displayed in the chip.
  /// * [leadingAvatar] - Widget of the icon.
  /// * [onClick] - The action to be executed when the chips pressed is selected.
  /// * [onCancel] - The action to be executed when the chips deleted is selected.
  const OdsInputChip({
    Key? key,
    required this.text,
    this.leadingAvatar,
    this.leadingIcon,
    this.onClick,
    this.onCancel,
    this.enabled = true,
  }) : super(key: key);

  /// The app bar title displayed.
  final String text;

  /// The optional chip's icon.
  final Widget? leadingAvatar;

  /// The optional chip's icon.
  final Widget? leadingIcon;

  /// The action to be executed when the button pressed is pressed.
  final void Function()? onClick;

  /// The action to be executed when the button deleted is pressed.
  final void Function()? onCancel;

  /// Specifies whether the chips is selected or not.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: ChipTheme(
        data: ChipThemeData(
          iconTheme: const IconThemeData(color: white100),
          checkmarkColor: black900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          side: BorderSide(
            color: Theme.of(context).brightness == Brightness.light
                ? (enabled ? black900 : grey400)
                : Theme.of(context).brightness == Brightness.dark
                    ? (enabled ? white100 : grey800)
                    : grey800,
          ),
        ),
        child: MergeSemantics(
          child: InputChip(
            label: Text(text, style: Theme.of(context).textTheme.bodyMedium),
            avatar: leadingAvatar ?? leadingIcon,
            deleteIcon: null,
            onPressed: enabled != false ? onClick : null,
            onDeleted: onCancel,
          ),
        ),
      ),
    );
  }
}
