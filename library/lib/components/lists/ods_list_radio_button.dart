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
    /*
    String radioButtonValue = widget.value == null
        ? OdsLocalizations.of(context)!.componentCheckboxesIndeterminate
        : widget.value ?? false
        ? OdsLocalizations.of(context)!.componentCheckboxesChecked
        : OdsLocalizations.of(context)!.componentCheckboxesUnchecked;

     */

    return Semantics(
      //value: radioButtonValue,
      enabled: widget.enabled,
      hint: OdsLocalizations.of(context)!.componentCheckboxes,
      excludeSemantics: true,
      child: RadioListTile<T>(
        title: Text(widget.title),
        value: widget.value,
        onChanged: widget.enabled != false ? widget.onCheckedChange : null,
        groupValue: widget.groupValue,
      ),
    );
  }
}
