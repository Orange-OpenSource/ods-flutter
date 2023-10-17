import 'package:flutter/material.dart';

/// ODS Design Large Floating Action Button.
///
/// Displays a customizable floating action button with an optional icon and a tooltip.
/// The floating action button
class OdsLargeFloatingActionButton extends StatefulWidget {
  /// Creates an ODS Floating Action Button.
  ///
  /// * [icon] - The icon widget displayed inside the button.
  /// * [onClick] - The callback function when the button is pressed.
  /// * [semanticsLabel] - The description accessibility button.
  const OdsLargeFloatingActionButton({
    Key? key,
    this.onClick,
    required this.icon,
    this.semanticsLabel = "Floating action",
  }) : super(key: key);

  /// The optional icon widget displayed inside the button.
  final Widget? icon;

  /// The callback function when the button is pressed.
  final void Function()? onClick;

  /// The optional description accessibility floating button.
  final String? semanticsLabel;

  @override
  State<OdsLargeFloatingActionButton> createState() =>
      _OdsLargeFloatingActionButtonState();
}

class _OdsLargeFloatingActionButtonState
    extends State<OdsLargeFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: widget.semanticsLabel,
      child: FloatingActionButton.large(
        onPressed: widget.onClick,
        child: widget.icon,
      ),
    );
  }
}
