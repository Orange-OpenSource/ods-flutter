import 'package:flutter/material.dart';

/// ODS Design Chips.
///
/// Displays a customizable chips with an optional action.
///
class OdsInputChips extends StatefulWidget {
  /// Creates an ODS Action Chips.
  ///
  /// * [label] - Text displayed in the chip.
  /// * [avatar] - Widget of the icon.
  /// * [onPressed] - The action to be executed when the chips pressed is selected.
  /// * [onDeleted] - The action to be executed when the chips deleted is selected.
  const OdsInputChips({
    Key? key,
    required this.label,
    this.avatar,
    this.onPressed,
    this.onDeleted,
  }) : super(key: key);

  /// The app bar title displayed.
  final String label;

  /// The optional chip's icon.
  final Widget? avatar;

  /// The action to be executed when the button pressed is pressed.
  final void Function()? onPressed;

  /// The action to be executed when the button deleted is pressed.
  final void Function()? onDeleted;

  @override
  State<OdsInputChips> createState() => _OdsInputChipsState();
}

class _OdsInputChipsState extends State<OdsInputChips> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: widget.label,
      child: InputChip(
        label: Text(widget.label),
        avatar: widget.avatar,
        onPressed: widget.onPressed,
        onDeleted: widget.onDeleted,
      ),
    );
  }
}
