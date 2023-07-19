import 'package:flutter/material.dart';

/// ODS Design Floating Action Button Large.
///
/// Displays a customizable floating action button with an optional icon and a tooltip.
/// The floating action button
class OdsFloatingActionButtonLarge extends StatefulWidget {
  /// Creates an ODS Floating Action Button.
  ///
  /// * [tooltip] - The tooltip text displayed when hovering over the button.
  /// * [icon] - The icon widget displayed inside the button.
  /// * [onPressed] - The callback function when the button is pressed.
  const OdsFloatingActionButtonLarge({
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
  State<OdsFloatingActionButtonLarge> createState() =>
      _OdsFloatingActionButtonLargeState();
}

class _OdsFloatingActionButtonLargeState
    extends State<OdsFloatingActionButtonLarge> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: FloatingActionButton.large(
        onPressed: widget.onPressed,
        tooltip: widget.tooltip,
        child: widget.icon,
      ),
    );
  }
}
