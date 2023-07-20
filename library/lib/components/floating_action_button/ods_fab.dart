import 'package:flutter/material.dart';

/// ODS Design Floating Action Button.
///
/// Displays a customizable floating action button with an optional icon and a tooltip.
/// The floating action button can expand to full screen width if specified.
class OdsFloatingActionButton extends StatefulWidget {
  /// Creates an ODS Floating Action Button.
  ///
  /// * [tooltip] - The tooltip text displayed when hovering over the button.
  /// * [icon] - The icon widget displayed inside the button.
  /// * [onPressed] - The callback function when the button is pressed.
  const OdsFloatingActionButton({
    Key? key,
    required this.tooltip,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  /// The tooltip text displayed when hovering over the button.
  final String tooltip;

  /// The optional icon widget displayed inside the button.
  final Widget? icon;

  /// The callback function when the button is pressed.
  final void Function()? onPressed;

  @override
  State<OdsFloatingActionButton> createState() =>
      _OdsFloatingActionButtonState();
}

class _OdsFloatingActionButtonState extends State<OdsFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: FloatingActionButton(
        onPressed: widget.onPressed,
        tooltip: widget.tooltip,
        child: widget.icon,
      ),
    );
  }
}
