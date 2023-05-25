import 'package:flutter/material.dart';

/// ODS Design Button.
///
/// * [title] Text displayed in the button.
/// * [enabled], Controls the state of the button. When `false`, this button will not
///  be clickable.
/// * [iconButton], If `false`, no icon will be displayed.
/// * [icon], Widget of the icon.
/// * [onPressed], used to specified the action when the button is selected.
class OdsOutlinedButton extends StatelessWidget {
  final String title;
  final bool enabled;
  final bool iconButton;
  final Widget icon;
  final Function()? onPressed;

  const OdsOutlinedButton(
      {Key? key,
      required this.title,
      required this.enabled,
      required this.iconButton,
      required this.icon,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return iconButton
        ? OutlinedButton(
            onPressed: enabled ? null : onPressed, child: Text(title))
        : OutlinedButton.icon(
            onPressed: enabled ? null : onPressed,
            icon: icon,
            label: Text(title));
  }
}
