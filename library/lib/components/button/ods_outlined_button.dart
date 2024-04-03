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

/// ODS Design Button.
///
/// Displays a customizable button with an optional icon and a title.
/// The button can expand to full screen width if specified.
class OdsOutlinedButton extends StatelessWidget {
  /// Creates an ODS Outlined Button.
  ///
  /// * [text] - Text displayed in the button.
  /// * [onClick] - The action to be executed when the button is pressed.
  /// * [icon] - Widget of the icon.
  /// * [fullWidth] - Specifies whether the button should expand to full screen width.
  const OdsOutlinedButton({
    Key? key,
    required this.text,
    this.onClick,
    this.icon,
    this.fullWidth = false,
  }) : super(key: key);

  /// The button's title displayed inside the button.
  final String text;

  /// The action to be executed when the button is pressed.
  final void Function()? onClick;

  /// The optional button's icon.
  final Widget? icon;

  /// Specifies whether the button should expand to full screen width.
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    ///Color Filter
    Widget colorDefaultFilter() {
      return ColorFiltered(
        colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
        child: icon,
      );
    }

    Widget colorEnableFilter() {
      return ColorFiltered(
        colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        child: icon,
      );
    }

    if (icon != null && fullWidth == false) {
      return OutlinedButton.icon(
        onPressed: onClick,
        icon: ExcludeSemantics(
          excluding: true,
          child: onClick != null ? colorDefaultFilter() : colorEnableFilter(),
        ),
        label: Text(text),
      );
    }

    if (icon != null && fullWidth == true) {
      return SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
          onPressed: onClick,
          icon: ExcludeSemantics(
            excluding: true,
            child: onClick != null ? colorDefaultFilter() : colorEnableFilter(),
          ),
          label: Text(text),
        ),
      );
    }

    if (fullWidth == true) {
      return SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: onClick,
          child: Text(text),
        ),
      );
    }

    return OutlinedButton(
      onPressed: onClick,
      child: Text(text),
    );
  }
}
