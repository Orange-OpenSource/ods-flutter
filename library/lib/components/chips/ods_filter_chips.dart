import 'package:flutter/material.dart';

/// ODS Design Chips.
///
/// Displays a customizable chips with an optional action.
///
class OdsFilterChips extends StatefulWidget {
  /// Creates an ODS Action Chips.
  ///
  /// * [label] - Text displayed in the chip.
  /// * [avatar] - Widget of the icon.
  /// * [isSelected] - The action to be executed when the chips is pressed.
  /// * [onSelected] - The action to be executed when the chips is pressed.
  OdsFilterChips(
      {Key? key,
      required this.label,
      this.avatar,
      required this.isSelected,
      this.onSelected})
      : super(key: key);

  /// The app bar title displayed.
  final String label;

  /// The optional chip's icon.
  final Widget? avatar;

  /// Specifies whether the button should expand to full screen width.
  bool isSelected;

  final void Function(bool?)? onSelected;

  @override
  State<OdsFilterChips> createState() => _OdsFilterChipsState();
}

class _OdsFilterChipsState extends State<OdsFilterChips> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: widget.label,
      child: FilterChip(
        label: Text(widget.label),
        avatar: widget.avatar,
        selected: widget.isSelected,
        onSelected: widget.onSelected,
      ),
    );
  }
}
