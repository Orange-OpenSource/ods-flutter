import 'package:flutter/material.dart';

/// ODS Design Button.
///
/// Displays a customizable button with an optional icon and a title.
/// The button can expand to full screen width if specified.
class OdsOutlinedButton extends StatefulWidget {
  /// Creates an ODS Outlined Button.
  ///
  /// * [title] - Text displayed in the button.
  /// * [fullScreenWidth] - Specifies whether the button should expand to full screen width.
  /// * [icon] - Widget of the icon.
  /// * [onPressed] - The action to be executed when the button is pressed.
  const OdsOutlinedButton({
    Key? key,
    required this.title,
    required this.fullScreenWidth,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  /// The button's title displayed inside the button.
  final String title;

  /// Specifies whether the button should expand to full screen width.
  final bool fullScreenWidth;

  /// The optional button's icon.
  final Widget? icon;

  /// The action to be executed when the button is pressed.
  final void Function()? onPressed;

  @override
  State<OdsOutlinedButton> createState() => _OdsOutlinedButtonState();
}

class _OdsOutlinedButtonState extends State<OdsOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.icon != null && widget.fullScreenWidth == false) {
      return OutlinedButton.icon(
        onPressed: widget.onPressed,
        icon: widget.onPressed != null ? widget.icon! : _colorFilter(),
        label: Text(widget.title),
      );
    }

    if (widget.icon != null && widget.fullScreenWidth == true) {
      return SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
          onPressed: widget.onPressed,
          icon: widget.onPressed != null ? widget.icon! : _colorFilter(),
          label: Text(widget.title),
        ),
      );
    }

    if (widget.fullScreenWidth == true) {
      return SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: widget.onPressed,
          child: Text(widget.title),
        ),
      );
    }

    return OutlinedButton(
      onPressed: widget.onPressed,
      child: Text(widget.title),
    );
  }

  Widget _colorFilter() {
    return ColorFiltered(
      colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
      child: widget.icon,
    );
  }
}
