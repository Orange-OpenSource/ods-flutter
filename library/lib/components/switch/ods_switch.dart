import 'package:flutter/material.dart';
import 'package:ods_flutter/components/utilities/ods_switch_icon.dart';
import 'package:ods_flutter/l10n/gen/ods_localizations.dart';

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
  final bool? icon;

  const OdsSwitch({
    Key? key,
    required this.checked,
    required this.onCheckedChange,
    this.icon,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OdsSwitchIcon odsSwitchIcon = OdsSwitchIcon(context);

    String switchValue = checked
        ? OdsLocalizations.of(context)!.componentSwitchesChecked
        : OdsLocalizations.of(context)!.componentSwitchesUnchecked;

    return Semantics(
      value: switchValue,
      enabled: enabled,
      button: true,
      excludeSemantics: true,
      child: Switch(
          thumbIcon: icon == true ? odsSwitchIcon.thumbIcon : null,
          value: checked,
          onChanged: enabled ? onCheckedChange : null),
    );
  }
}
