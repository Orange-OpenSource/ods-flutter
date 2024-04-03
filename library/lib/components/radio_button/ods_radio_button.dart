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

/// ODS RadioButton.
///
/// The OdsCheckbox widget represents a checkbox element that can be checked or unchecked.
/// It allows for handling the checkbox state and triggering a callback when its state changes.
class OdsRadioButton<T> extends StatelessWidget {
  /// Creates an ODS RadioButton.
  const OdsRadioButton({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onCheckedChange,
    this.enabled = true,
  }) : super(key: key);

  /// The value.
  final T value;

  /// The group value
  final T? groupValue;

  /// A callback function to handle changes in the checked state.
  final void Function(T?)? onCheckedChange;

  /// Controls the enabled state of the radio button. When false, this button will not be clickable.
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      child: Radio<T>(
        value: value,
        onChanged: enabled != false ? onCheckedChange : null,
        groupValue: groupValue,
      ),
    );
  }
}
