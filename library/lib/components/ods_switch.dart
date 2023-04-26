import 'package:flutter/material.dart';

/// ODS Design Switch.
///
///   Switch is used to toggle the on/off state of a single setting.
/// * [checked], To specify whether the switch is checked or not.
/// * [onCheckedChange], Called when the user toggles the switch on or off.
///   It can be set to null to disable the switch.
/// * [enabled], which help to determine if the switch is disable or not.
/// * [icon], The icon to use on the thumb of this switch.
class OdsSwitch extends StatelessWidget {
  final bool checked;
  final Function(bool?) onCheckedChange;
  final bool enabled;
  final MaterialStateProperty<Icon?>? icon;

  const OdsSwitch(
      {Key? key,
      required this.checked,
      required this.enabled,
      required this.icon,
      required this.onCheckedChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
        thumbIcon: icon,
        value: checked,
        onChanged: enabled ? onCheckedChange : null);
  }
}
