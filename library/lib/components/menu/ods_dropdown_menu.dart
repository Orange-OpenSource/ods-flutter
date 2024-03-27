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
import 'package:ods_flutter/components/menu/item/ods_dropdown_menu_Item.dart';

/// ODS DropdownMenu.
///
/// Display a scrolling menu.
///
///.
class OdsDropdownMenu<T> extends StatefulWidget {
  /// Signature used by PopupMenuButton to lazily construct the items shown when the button is presse
  final List<OdsDropdownMenuItem<T>> items;

  /// Called when the user selects a value from the popup menu created by this button
  final Function(dynamic)? selectedItem;

  const OdsDropdownMenu({
    Key? key,
    required this.items,
    this.selectedItem,
  }) : super(key: key);

  @override
  State<OdsDropdownMenu> createState() => _OdsDropdownMenuState();
}

class _OdsDropdownMenuState extends State<OdsDropdownMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      child: PopupMenuButton(
        surfaceTintColor: Colors.white,
        icon: const Icon(Icons.more_vert),
        itemBuilder: (context) {
          return widget.items;
        },
        onSelected: widget.selectedItem,
      ),
    );
  }
}
