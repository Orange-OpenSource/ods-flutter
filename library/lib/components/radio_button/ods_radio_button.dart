import 'package:flutter/material.dart';

/// ODS RadioButton.
///
/// The OdsCheckbox widget represents a checkbox element that can be checked or unchecked.
/// It allows for handling the checkbox state and triggering a callback when its state changes.
class OdsRadioButton<T> extends StatefulWidget {
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
  State<OdsRadioButton<T>> createState() => _OdsRadioButtonState<T>();
}

class _OdsRadioButtonState<T> extends State<OdsRadioButton<T>> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      child: Radio<T>(
        value: widget.value,
        onChanged: widget.enabled != false ? widget.onCheckedChange : null,
        groupValue: widget.groupValue,
      ),
    );
  }
}
