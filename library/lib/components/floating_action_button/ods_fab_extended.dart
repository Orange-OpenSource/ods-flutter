import 'package:flutter/material.dart';

/// ODS Design Floating Action Button Extended.
///
/// Displays a customizable floating action button with an optional icon and a tooltip.
/// The floating action button
class OdsFloatingActionButtonExtended extends StatefulWidget {
  /// Creates an ODS Floating Action Button.
  ///
  /// * [tooltip] - The tooltip text displayed when hovering over the button.
  /// * [icon] - The icon widget displayed inside the button.
  /// * [onPressed] - The callback function when the button is pressed.
  const OdsFloatingActionButtonExtended({
    Key? key,
    required this.tooltip,
    required this.label,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  /// The tooltip text displayed when hovering over the button.
  final String tooltip;

  /// The label text displayed inside the button.
  final String label;

  /// The optional icon widget displayed inside the button.
  final Widget? icon;

  /// The callback function when the button is pressed.
  final void Function()? onPressed;

  @override
  State<OdsFloatingActionButtonExtended> createState() =>
      _OdsFloatingActionButtonExtendedState();
}

class _OdsFloatingActionButtonExtendedState
    extends State<OdsFloatingActionButtonExtended> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: FloatingActionButton.extended(
        onPressed: widget.onPressed,
        tooltip: widget.tooltip,
        label: Text(widget.label),
        icon: widget.icon,
      ),
    );
  }
}
