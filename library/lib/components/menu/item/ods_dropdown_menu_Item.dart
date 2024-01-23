import 'package:flutter/material.dart';

/// ODS OdsDropdownMenuItem.
///
/// An item displayed in a [OdsDropdownMenu].
///
///.
class OdsDropdownMenuItem<T> extends PopupMenuEntry<T> {
  ///Typically a Text
  final String text;

  ///The value that will be returned by showMenu if this entry is selected.
  final String? value;

  /// Whether the user is permitted to select this item.
  final bool enabled;

  ///Typically a single-line ListTile for menus with icons
  final Widget? icon;

  const OdsDropdownMenuItem({
    Key? key,
    required this.text,
    this.value,
    this.enabled = true,
    this.icon,
  }) : super(key: key);

  @override
  State<OdsDropdownMenuItem> createState() => _OdsDropdownMenuItemState();

  @override

  /// TODO: implement height
  double get height => throw UnimplementedError();

  @override
  bool represents(T? value) {
    /// TODO: implement represents
    throw UnimplementedError();
  }
}

class _OdsDropdownMenuItemState extends State<OdsDropdownMenuItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget? itemMenu;

    if (widget.icon != null) {
      itemMenu = ListTile(
        leading: widget.icon,
        title: Text(widget.text),
      );
    } else {
      itemMenu = Text(widget.text);
    }

    return PopupMenuItem(
      value: widget.value,
      enabled: widget.enabled,
      child: itemMenu,
    );
  }
}
