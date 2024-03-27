/*
 * Software Name : Orange Design System
 * SPDX-FileCopyrightText: Copyright (c) Orange SA
 * SPDX-License-Identifier: MIT
 *
 * This software is distributed under the MIT license,
 * the text of which is available at https://opensource.org/license/MIT/
 * or see the "LICENSE" file for more details.
 *
 * Software description: Flutter library of reusable graphical components for Android and iOS
 */

import 'package:flutter/material.dart';

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
  final Function(T)? selectedItem;

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
    return DropdownMenu(
      label: Text(widget.label),
      enabled: widget.enabled,
      onSelected: widget.selectedItem,
      dropdownMenuEntries: widget.items,
    );
  }
}
