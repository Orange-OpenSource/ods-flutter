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
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter/theme/ods_palette.dart';

///
///Specifying an [OdsTextButtonStyle] allow to display a button with specific colors.
///
///
class OdsButtonColors {
  final Color background;
  final Color text;
  final Color? icon;
  final Color? textDisabled;

  OdsButtonColors(
      {required this.background,
      required this.text,
      this.icon,
      this.textDisabled});
}

enum OdsTextButtonStyle {
  functionalPrimary,
  functionalDefault,
}

/// ODS Design Button.
///
/// Displays a customizable button with an optional icon and a title.
/// The button can expand to full screen width if specified.
class OdsTextButton extends StatelessWidget {
  /// Creates an ODS Text Button.
  ///
  /// * [text] - Text displayed in the button.
  /// * [fullWidth] - Specifies whether the button should expand to full screen width.
  /// * [icon] - Widget of the icon.
  /// * [onClick] - The action to be executed when the button is pressed.
  /// * [style] - The button's style color.
  const OdsTextButton({
    Key? key,
    required this.text,
    this.onClick,
    this.fullWidth = false,
    this.icon,
    this.style = OdsTextButtonStyle.functionalDefault,
  }) : super(key: key);

  /// The button's title displayed inside the button.
  final String text;

  /// The action to be executed when the button is pressed.
  final Function()? onClick;

  /// Specifies whether the button should expand to full screen width.
  final bool fullWidth;

  /// The optional button's icon.
  final Widget? icon;

  /// The background style.
  final OdsTextButtonStyle style;

  static const double minimumWidthButtonIcon = 108;
  static const double minimumHeightButtonIcon = 40;

  @override
  Widget build(BuildContext context) {
    OdsButtonColors getColorsForStyle(OdsTextButtonStyle? style) {
      switch (style) {
        case OdsTextButtonStyle.functionalPrimary:
          return OdsButtonColors(
              background: Colors.transparent,
              text: Theme.of(context).colorScheme.primary,
              icon: Theme.of(context).colorScheme.primary,
              textDisabled: grey500);
        case OdsTextButtonStyle.functionalDefault:
          return OdsButtonColors(
              background: Colors.transparent,
              text: Theme.of(context).colorScheme.onSurface,
              icon: Theme.of(context).colorScheme.secondary,
              textDisabled: grey500);
        default:
          return OdsButtonColors(
              background: Colors.transparent,
              text: Theme.of(context).colorScheme.secondary,
              icon: Theme.of(context).colorScheme.onSecondary,
              textDisabled: grey500);
      }
    }

    ///Color Filter
    Widget colorDefaultFilter() {
      final styleButtonColor = getColorsForStyle(style);
      return ColorFiltered(
        colorFilter: ColorFilter.mode(styleButtonColor.icon!, BlendMode.srcIn),
        child: icon,
      );
    }

    Widget _colorEnableFilter() {
      return ColorFiltered(
        colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        child: icon,
      );
    }

    final styleButtonColor = getColorsForStyle(style);

    if (icon != null && fullWidth == false) {
      return TextButton.icon(
        style: FilledButton.styleFrom(
          minimumSize:
              const Size(minimumWidthButtonIcon, minimumHeightButtonIcon),
          padding:
              const EdgeInsets.fromLTRB(spacingM, spacingS, spacingL, spacingS),
          backgroundColor: styleButtonColor.background,
        ),
        onPressed: onClick,
        icon: ExcludeSemantics(
          excluding: true,
          child: onClick != null ? colorDefaultFilter() : _colorEnableFilter(),
        ),
        label: Text(
          text,
          style: TextStyle(
            color: onClick != null
                ? styleButtonColor.text
                : styleButtonColor.textDisabled,
          ),
        ),
      );
    }

    if (icon != null && fullWidth == true) {
      return SizedBox(
        width: double.infinity,
        child: TextButton.icon(
          onPressed: onClick,
          icon: ExcludeSemantics(
            excluding: true,
            child:
                onClick != null ? colorDefaultFilter() : _colorEnableFilter(),
          ),
          label: Text(
            text,
            style: TextStyle(
              color: onClick != null
                  ? styleButtonColor.text
                  : styleButtonColor.textDisabled,
            ),
          ),
          style: FilledButton.styleFrom(
              backgroundColor: styleButtonColor.background),
        ),
      );
    }

    if (fullWidth == true) {
      return SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: onClick,
          style: FilledButton.styleFrom(
              backgroundColor: styleButtonColor.background),
          child: Text(
            text,
            style: TextStyle(
              color: onClick != null
                  ? styleButtonColor.text
                  : styleButtonColor.textDisabled,
            ),
          ),
        ),
      );
    }

    return TextButton(
      onPressed: onClick,
      style:
          FilledButton.styleFrom(backgroundColor: styleButtonColor.background),
      child: Text(
        text,
        style: TextStyle(
          color: onClick != null
              ? styleButtonColor.text
              : styleButtonColor.textDisabled,
        ),
      ),
    );
  }
}
