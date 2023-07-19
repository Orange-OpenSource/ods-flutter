import 'package:flutter/material.dart';

/// ODS Design Floating Action Button Small.
///
/// Displays a customizable floating action button with an optional icon and a tooltip.
/// The floating action button
class OdsFloatingActionButtonSmall extends StatefulWidget {
  /// Creates an ODS Floating Action Button.
  ///
  /// * [tooltip] - The tooltip text displayed when hovering over the button.
  /// * [icon] - The icon widget displayed inside the button.
  /// * [onPressed] - The callback function when the button is pressed.
  const OdsFloatingActionButtonSmall({
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
  State<OdsFloatingActionButtonSmall> createState() =>
      _OdsFloatingActionButtonSmallState();
}

class _OdsFloatingActionButtonSmallState
    extends State<OdsFloatingActionButtonSmall> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: FloatingActionButton.small(
        onPressed: widget.onPressed,
        tooltip: widget.tooltip,
        child: widget.icon,
      ),
    );
  }
}
