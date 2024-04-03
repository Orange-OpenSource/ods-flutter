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

/// ODS OdsDropdownMenuItem.
///
/// An item displayed in a [OdsDropdownMenu].
///
///.
class OdsDropdownMenuItem<T> extends PopupMenuEntry<T> {
  const OdsDropdownMenuItem({
    Key? key,
    required this.text,
    this.value,
    this.enabled = true,
    this.icon,
  }) : super(key: key);

  ///Typically a Text
  final String text;

  ///The value that will be returned by showMenu if this entry is selected.
  final T? value;

  /// Whether the user is permitted to select this item.
  final bool enabled;

  ///Typically a single-line ListTile for menus with icons
  final Widget? icon;

  @override
  State<OdsDropdownMenuItem<T>> createState() => _OdsDropdownMenuItemState<T>();

  /// TODO: implement height
  @override
  double get height => throw UnimplementedError();

  @override
  bool represents(T? value) {
    /// TODO: implement represents
    throw UnimplementedError();
  }
}

class _OdsDropdownMenuItemState<T> extends State<OdsDropdownMenuItem<T>> {
  @override
  Widget build(BuildContext context) {
    Widget? itemMenu;

    if (widget.icon != null) {
      itemMenu = ListTile(
        leading: ExcludeSemantics(child: widget.icon),
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
