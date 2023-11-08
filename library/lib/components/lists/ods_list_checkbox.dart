import 'package:flutter/material.dart';
import 'package:ods_flutter/l10n/gen/ods_localizations.dart';

/// ODS OdsListCheckbox.
///
/// The OdsListCheckbox widget represents a checkbox list element that can be checked or unchecked.
/// It allows for handling the checkbox list state and triggering a callback when its state changes.
class OdsListCheckbox extends StatefulWidget {
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

  /// A flag indicating whether the widget is enabled.
  final bool? enabled;

  /// A flag indicating whether the widget is in an indeterminate state.
  final bool indeterminate;

  @override
  State<OdsListCheckbox> createState() => _OdsListCheckboxState();
}

class _OdsListCheckboxState extends State<OdsListCheckbox> {
  @override
  Widget build(BuildContext context) {
    String checkBoxValue = widget.checked == null
        ? OdsLocalizations.of(context)!.componentCheckboxesIndeterminate
        : widget.checked ?? false
            ? OdsLocalizations.of(context)!.componentCheckboxesChecked
            : OdsLocalizations.of(context)!.componentCheckboxesUnchecked;

    return Semantics(
      label: widget.title,
      value: checkBoxValue,
      enabled: widget.enabled,
      hint: OdsLocalizations.of(context)!.componentCheckboxes,
      excludeSemantics: true,
      child: CheckboxListTile(
        title: Text(widget.title),
        value: widget.checked,
        onChanged: widget.enabled != false ? widget.onCheckedChange : null,
        tristate: widget.indeterminate,
      ),
    );
  }
}
