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

/// ODS OdsListCheckbox.
///
/// The OdsListCheckbox widget represents a checkbox list element that can be checked or unchecked.
/// It allows for handling the checkbox list state and triggering a callback when its state changes.
class OdsListCheckbox extends StatelessWidget {
  /// Creates an ODS Checkbox list.
  const OdsListCheckbox({
    Key? key,
    required this.title,
    required this.checked,
    required this.onCheckedChange,
    this.enabled = true,
    this.indeterminate = false,
  }) : super(key: key);

  /// The value.
  final String title;

  /// The value checked.
  final bool? checked;

  /// A callback function to handle changes in the checked state.
  final void Function(bool?)? onCheckedChange;

  /// Controls the enabled state of the checkbox. When false, this button will not be clickable.
  final bool? enabled;

  /// A flag indicating whether the widget is in an indeterminate state.
  final bool indeterminate;

  @override
  Widget build(BuildContext context) {
    String checkBoxValue = checked == null
        ? OdsLocalizations.of(context)!.componentCheckboxesIndeterminate
        : checked ?? false
            ? OdsLocalizations.of(context)!.componentCheckboxesChecked
            : OdsLocalizations.of(context)!.componentCheckboxesUnchecked;

    return Semantics(
      label: title,
      value: checkBoxValue,
      enabled: enabled,
      hint: OdsLocalizations.of(context)!.componentCheckboxes,
      excludeSemantics: true,
      child: CheckboxListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        value: checked,
        onChanged: enabled != false ? onCheckedChange : null,
        tristate: indeterminate,
      ),
    );
  }
}
