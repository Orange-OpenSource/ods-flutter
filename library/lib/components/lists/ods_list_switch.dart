import 'package:flutter/material.dart';
import 'package:ods_flutter/components/utilities/ods_switch_icon.dart';
import 'package:ods_flutter/l10n/gen/ods_localizations.dart';

/// ODS OdsListSwitch.
///
/// The OdsListSwitch widget represents a switch list element that can be checked or unchecked.
/// It allows for handling the OdsListSwitch list state and triggering a callback when its state changes.
class OdsListSwitch extends StatefulWidget {
  /// Creates an ODS Switch list.
  const OdsListSwitch({
    Key? key,
    required this.title,
    required this.checked,
    required this.onCheckedChange,
    this.icon,
    this.enabled = true,
  }) : super(key: key);

  /// The value.
  final String title;

  /// The value checked.
  final bool checked;

  /// A callback function to handle changes in the checked state.
  final void Function(bool)? onCheckedChange;

  /// The icon to use on the thumb of this switch.
  final bool? icon;

  /// Controls the enabled state of the switch. When false, this button will not be clickable.
  final bool? enabled;

  @override
  State<OdsListSwitch> createState() => _OdsListSwitchState();
}

class _OdsListSwitchState extends State<OdsListSwitch> {
  @override
  Widget build(BuildContext context) {
    String switchValue = widget.checked
        ? OdsLocalizations.of(context)!.componentSwitchesChecked
        : OdsLocalizations.of(context)!.componentSwitchesUnchecked;

    OdsSwitchIcon odsSwitchIcon = OdsSwitchIcon(context);

    return Semantics(
      label: widget.title,
      value: switchValue,
      enabled: widget.enabled,
      button: true,
      excludeSemantics: true,
      child: SwitchListTile(
        title: Text(widget.title),
        value: widget.checked,
        onChanged: widget.enabled != false ? widget.onCheckedChange : null,
        thumbIcon: widget.icon == true ? odsSwitchIcon.thumbIcon : null,
      ),
    );
  }
}
