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
import 'package:ods_flutter/components/utilities/ods_switch_icon.dart';
import 'package:ods_flutter/l10n/gen/ods_localizations.dart';

/// ODS OdsListSwitch.
///
/// The OdsListSwitch widget represents a switch list element that can be checked or unchecked.
/// It allows for handling the OdsListSwitch list state and triggering a callback when its state changes.
/// * [checked] determines whether this switch is on or off.
/// * [onCheckedChange] is called when the user toggles the switch on or off.
class OdsListSwitch extends StatelessWidget {
  /// Creates an ODS Switch list.
  const OdsListSwitch({
    Key? key,
    required this.title,
    required this.checked,
    required this.onCheckedChange,
    this.icon,
    this.enabled = true,
  }) : super(key: key);

  /// The primary content of the list tile.
  final String title;

  /// Determines whether this switch is on or off.
  final bool checked;

  /// A callback function to handle changes in the checked state.
  final void Function(bool)? onCheckedChange;

  /// The icon to use on the thumb of this switch.
  final bool? icon;

  /// Controls the enabled state of the switch. When false, this button will not be clickable.
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    String switchValue = checked
        ? OdsLocalizations.of(context)!.componentSwitchesChecked
        : OdsLocalizations.of(context)!.componentSwitchesUnchecked;

    OdsSwitchIcon odsSwitchIcon = OdsSwitchIcon(context);

    return Semantics(
      label: title,
      value: switchValue,
      enabled: enabled,
      button: true,
      excludeSemantics: true,
      child: SwitchListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        value: checked,
        onChanged: enabled != false ? onCheckedChange : null,
        thumbIcon: icon == true ? odsSwitchIcon.thumbIcon : null,
      ),
    );
  }
}
