import 'package:flutter/material.dart';

/// ODS Design Radio button.
///
/// Radio button is used to select between a number of mutually exclusive values
/// * [selected], The currently selected value for this group of radio buttons.
/// * [groupValue],determine whether the radio button is selected.
/// * [onSelectedChange], which is called when the value of the radiobutton should
///   change. It can be set to null to disable the radiobutton.
/// * [enabled], which determines if the radiobutton is selectable or not.
/// * [title], A widget to display on the opposite side of the tile from the radio button.
class OdsRadioButton<T> extends StatelessWidget {
  final T selected;
  final Function(T?) onSelectedChange;
  final T? groupValue;
  final bool enabled;
  final String title;

  const OdsRadioButton(
      {Key? key,
      required this.selected,
      required this.enabled,
      required this.title,
      required this.onSelectedChange,
      this.groupValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
        title: Text(title),
        value: selected,
        groupValue: groupValue,
        onChanged: enabled ? onSelectedChange : null);
  }
}
