import 'package:flutter/material.dart';
import 'package:ods_flutter/guidelines/spacings.dart';

/// ODS OdsExposedDropdownMenu.
///
/// A dropdown menu that can be opened from a TextField.
///
///.
class OdsExposedDropdownMenu<T> extends StatefulWidget {
  /// Descriptions of the menu items in the [OdsExposedDropdownMenu]
  final List<DropdownMenuEntry> items;

  /// Text describes the input field
  final String label;

  /// An optional Icon at the front of the text input field
  final Widget? leadingIcon;

  /// Determine if the DropdownMenu is enabled
  final bool enabled;

  /// The callback is called when a selection is made.
  final Function(dynamic)? selectedItem;

  const OdsExposedDropdownMenu({
    Key? key,
    required this.items,
    required this.label,
    this.leadingIcon,
    this.selectedItem,
    this.enabled = true,
  }) : super(key: key);

  @override
  State<OdsExposedDropdownMenu> createState() => _OdsExposedDropdownMenuState();
}

class _OdsExposedDropdownMenuState extends State<OdsExposedDropdownMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(spacingS),
          child: DropdownMenu<dynamic>(
            requestFocusOnTap: true,
            label: Text(widget.label),
            enabled: widget.enabled,
            onSelected: widget.selectedItem,
            dropdownMenuEntries: widget.items,
          ),
        ),
      ],
    );
  }
}
