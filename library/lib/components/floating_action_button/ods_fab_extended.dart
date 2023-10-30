import 'package:flutter/material.dart';

/// ODS Design Extended Floating Action Button Extended.
///
/// Displays a customizable floating action button with an optional icon and a tooltip.
/// The floating action button
class OdsExtendedFloatingActionButton extends StatefulWidget {
  /// Creates an ODS Floating Action Button.
  ///
  /// * [onClick] - The callback function when the button is pressed.
  /// * [icon] - The icon widget displayed inside the button.
  const OdsExtendedFloatingActionButton({
    Key? key,
    this.onClick,
    required this.text,
    this.icon,
  }) : super(key: key);

  /// The callback function when the button is pressed.
  final void Function()? onClick;

  /// The label text displayed inside the button.
  final String text;

  /// The optional icon widget displayed inside the button.
  final Widget? icon;

  @override
  State<OdsExtendedFloatingActionButton> createState() =>
      _OdsExtendedFloatingActionButtonState();
}

class _OdsExtendedFloatingActionButtonState
    extends State<OdsExtendedFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: FloatingActionButton.extended(
        onPressed: widget.onClick,
        label: Text(widget.text),
        icon: widget.icon,
      ),
    );
  }
}
