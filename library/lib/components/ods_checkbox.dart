import 'package:flutter/material.dart';

/// ODS Design checkbox.
///
/// Checkboxes allow users to select one or more items from a set. Checkboxes can turn an option on
//  * or off.
/// * [checked], which determines whether the checkbox is checked or unchecked.
/// * [onCheckedChange], which is called when the value of the checkbox should
///   change. It can be set to null to disable the checkbox.
/// * [enabled], which determines if the checkbox is clickable or not.
/// * [title], the title of the checkbox.
class OdsCheckbox extends StatelessWidget {
  final bool checked;
  final Function(bool?) onCheckedChange;
  final bool enabled;
  final String title;

  const OdsCheckbox(
      {Key? key,
      required this.checked,
      required this.enabled,
      required this.title,
      required this.onCheckedChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Text(title),
        value: checked,
        onChanged: enabled ? onCheckedChange : null);
  }
}
