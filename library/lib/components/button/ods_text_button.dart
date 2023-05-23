import 'package:flutter/material.dart';

/// ODS Design Button.
///
///   OdsButton is used to toggle the on/off state of a single setting.
///   It can be set to null to disable the switch.
///  * [title] Text displayed in the button
/// * [enabled], Controls the enabled state of the button. When `false`, this button will not
//  be clickable
/// * [iconButton], If `false`, no icon will be displayed.
/// * [icon], Widget of the icon.
class OdsTextButton extends StatelessWidget {
  final String title;
  final bool enabled;
  final bool iconButton;
  final Widget icon;
  final Function()? onPressed;

  const OdsTextButton(
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
        ? TextButton(onPressed: enabled ? null : onPressed, child: Text(title))
        : TextButton.icon(
            onPressed: enabled ? null : onPressed,
            icon: icon,
            label: Text(title));
  }
}
