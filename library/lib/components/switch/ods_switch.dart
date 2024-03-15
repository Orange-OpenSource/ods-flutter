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
import 'package:ods_flutter/l10n/l10n.dart';

/// ODS OdsSwitch.
///
///  Switch is used to toggle the on/off state of a single setting.
class OdsSwitch extends StatefulWidget {
  /// Creates an ODS Switch .
  const OdsSwitch({
    Key? key,
    required this.checked,
    required this.onCheckedChange,
    this.icon,
    this.enabled = true,
  }) : super(key: key);

  /// The value checked.
  final bool checked;

  /// A callback function to handle changes in the checked state.
  final void Function(bool)? onCheckedChange;

  /// The icon to use on the thumb of this switch.
  final bool? icon;

  /// Controls the enabled state of the switch. When false, this button will not be clickable.
  final bool? enabled;

  @override
  State<OdsSwitch> createState() => _OdsSwitchState();
}

class _OdsSwitchState extends State<OdsSwitch> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.odsL10n;

    final switchValue = widget.checked
        ? l10n.componentSwitchesChecked
        : l10n.componentSwitchesUnchecked;

    final odsSwitchIcon = OdsSwitchIcon(context);

    return Semantics(
      value: switchValue,
      enabled: widget.enabled,
      button: true,
      excludeSemantics: true,
      child: Switch(
          thumbIcon: widget.icon == true ? odsSwitchIcon.thumbIcon : null,
          value: widget.checked,
          onChanged: widget.enabled == true ? widget.onCheckedChange : null),
    );
  }
}
