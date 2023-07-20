import 'package:flutter/material.dart';

/// ODS Design Chips.
///
/// Displays a customizable chips with an optional action.
///
class OdsActionChips extends StatefulWidget {
  /// Creates an ODS Action Chips.
  ///
  /// * [label] - Text displayed in the chip.
  /// * [avatar] - Widget of the icon.
  /// * [onPressed] - The action to be executed when the chips is pressed.
  const OdsActionChips({
    Key? key,
    required this.label,
    this.avatar,
    this.onPressed,
  }) : super(key: key);

  /// The app bar title displayed.
  final String label;

  /// The optional chip's icon.
  final Widget? avatar;

  /// The action to be executed when the button is pressed.
  final void Function()? onPressed;

  @override
  State<OdsActionChips> createState() => _OdsActionChipsState();
}

class _OdsActionChipsState extends State<OdsActionChips> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: widget.label,
      child: ActionChip(
        label: Text(widget.label),
        avatar: widget.avatar,
        onPressed: widget.onPressed,
      ),
    );
  }
}
