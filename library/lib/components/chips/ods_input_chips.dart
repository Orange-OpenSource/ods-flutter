import 'package:flutter/material.dart';
import 'package:ods_flutter/theme/ods_palette.dart';

/// ODS Design Chips.
///
/// Displays a customizable chips with an optional action.
///
class OdsInputChip extends StatefulWidget {
  /// Creates an ODS Action Chips.
  ///
  /// * [text] - Text displayed in the chip.
  /// * [leadingAvatar] - Widget of the icon.
  /// * [onClick] - The action to be executed when the chips pressed is selected.
  /// * [onCancel] - The action to be executed when the chips deleted is selected.
  const OdsInputChip({
    Key? key,
    required this.text,
    this.leadingAvatar,
    this.leadingIcon,
    this.onClick,
    this.onCancel,
    this.enabled = true,
  }) : super(key: key);

  /// The app bar title displayed.
  final String text;

  /// The optional chip's icon.
  final Widget? leadingAvatar;

  /// The optional chip's icon.
  final Widget? leadingIcon;

  /// The action to be executed when the button pressed is pressed.
  final void Function()? onClick;

  /// The action to be executed when the button deleted is pressed.
  final void Function()? onCancel;

  /// Specifies whether the chips is selected or not.
  final bool enabled;

  @override
  State<OdsInputChip> createState() => _OdsInputChipsState();
}

class _OdsInputChipsState extends State<OdsInputChip> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: widget.text,
      child: ChipTheme(
        data: ChipThemeData(
          iconTheme: const IconThemeData(color: white100),
          checkmarkColor: black900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          side: BorderSide(
            color: Theme.of(context).brightness == Brightness.light
                ? (widget.enabled ? black900 : grey400)
                : Theme.of(context).brightness == Brightness.dark
                    ? (widget.enabled ? white100 : grey800)
                    : grey800,
          ),
        ),
        child: InputChip(
          label: Text(widget.text),
          avatar: widget.leadingAvatar ?? widget.leadingIcon,
          deleteIcon: null,
          onPressed: widget.enabled != false ? widget.onClick : null,
          onDeleted: widget.onCancel,
        ),
      ),
    );
  }
}
