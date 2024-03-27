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
import 'package:ods_flutter/l10n/gen/ods_localizations.dart';

/// ODS OdsListRadioButton.
///
/// The OdsCheckbox widget represents a checkbox element that can be checked or unchecked.
/// It allows for handling the checkbox state and triggering a callback when its state changes.
class OdsListRadioButton<T> extends StatefulWidget {
  /// Creates an ODS OdsListRadioButton.
  const OdsListRadioButton({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onCheckedChange,
    this.enabled = true,
  }) : super(key: key);

  /// The primary content of the list tile
  final String title;

  /// The value.
  final T value;

  /// The group value
  final T? groupValue;

  /// A callback function to handle changes in the checked state.
  final void Function(T?)? onCheckedChange;

  /// Controls the enabled state of the radio button. When false, this button will not be clickable.
  final bool? enabled;

  @override
  State<OdsListRadioButton<T>> createState() => _OdsRadioButtonState<T>();
}

class _OdsRadioButtonState<T> extends State<OdsListRadioButton<T>> {
  @override
  Widget build(BuildContext context) {
    String radioButtonValue = widget.value == widget.groupValue
        ? OdsLocalizations.of(context)!.componentRadioButtonSelected
        : OdsLocalizations.of(context)!.componentRadioButtonUnselected;

    return Semantics(
      label: widget.title,
      value: radioButtonValue,
      enabled: widget.enabled,
      hint: OdsLocalizations.of(context)!.componentRadioButton,
      excludeSemantics: true,
      child: RadioListTile<T>(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        value: widget.value,
        onChanged: widget.enabled != false ? widget.onCheckedChange : null,
        groupValue: widget.groupValue,
      ),
    );
  }
}
