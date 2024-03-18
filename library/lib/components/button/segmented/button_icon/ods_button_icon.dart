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

///
///Specifying an [OdsButtonIconStyle] allow to display a button with specific colors.
///
///

enum OdsButtonIconStyle {
  functionalFilled,
  functionalTonal,
  functionalOutlined,
  functionalStandard,
}

/// ODS Design Button.
///
/// Displays a customizable button with an optional icon and a title.
/// The button can expand to full screen width if specified.
class OdsButtonIcon extends StatefulWidget {
  /// Creates an ODS Button.
  ///
  /// * [isSelected] - The optional selection state of the icon button.
  /// * [isEnabled] - The optional selection state enabled/disabled of the icon button.
  /// * [icon] - The icon to display inside the button.
  /// * [onClick] - The action to be executed when the button is pressed.
  /// * [selectedIcon] - The icon to display inside the button when [isSelected] is true. This property can be null
  /// * [style] - The button's style color.
  const OdsButtonIcon({
    Key? key,
    required this.icon,
    this.selectedIcon,
    this.isSelected = false,
    this.isEnabled = true,
    this.onClick,
    this.style = OdsButtonIconStyle.functionalStandard,
  }) : super(key: key);

  /// The optional selection state of the icon button.
  final bool isSelected;

  /// The optional selection state enabled/disabled of the icon button.
  final bool isEnabled;

  /// The icon to display inside the button.
  final Widget icon;

  /// The icon to display inside the button when [isSelected] is true. This property
  /// can be null.
  final Widget? selectedIcon;

  /// The action to be executed when the button is pressed.
  final void Function()? onClick;

  /// The button's style color.
  final OdsButtonIconStyle style;

  @override
  State<OdsButtonIcon> createState() => _OdsButtonState();
}

class _OdsButtonState extends State<OdsButtonIcon> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    ButtonStyle? getColorsForStyle(OdsButtonIconStyle style) {
      switch (style) {
        case OdsButtonIconStyle.functionalStandard:
          return null;
        case OdsButtonIconStyle.functionalFilled:
          return enabledFilledButtonStyle(widget.isSelected, colors);
        case OdsButtonIconStyle.functionalTonal:
          return enabledFilledTonalButtonStyle(widget.isSelected, colors);
        case OdsButtonIconStyle.functionalOutlined:
          return enabledOutlinedButtonStyle(widget.isSelected, colors);
      }
    }

    final styleButtonColor = getColorsForStyle(widget.style);

    return IconButton(
      visualDensity: VisualDensity.standard,
      isSelected: widget.isSelected,
      icon: colorDeselectedFilter(colors),
      selectedIcon: colorSelectedFilter(widget.isSelected, colors),
      onPressed: widget.isEnabled ? widget.onClick : null,
      style: styleButtonColor,
    );
  }

  ///Color Filter
  Widget colorDeselectedFilter(ColorScheme colors) {
    switch (widget.style) {
      case OdsButtonIconStyle.functionalStandard:
        return ColorFiltered(
          colorFilter: widget.isEnabled
              ? ColorFilter.mode(colors.secondary, BlendMode.srcIn)
              : ColorFilter.mode(
                  colors.onSurface.withOpacity(0.38), BlendMode.srcIn),
          child: widget.icon,
        );
      case OdsButtonIconStyle.functionalFilled:
        return ColorFiltered(
          colorFilter: widget.isEnabled
              ? ColorFilter.mode(colors.primary, BlendMode.srcIn)
              : ColorFilter.mode(
                  colors.onSurface.withOpacity(0.38), BlendMode.srcIn),
          child: widget.icon,
        );
      case OdsButtonIconStyle.functionalTonal:
        return ColorFiltered(
          colorFilter: widget.isEnabled
              ? ColorFilter.mode(colors.secondary, BlendMode.srcIn)
              : ColorFilter.mode(
                  colors.onSurface.withOpacity(0.38), BlendMode.srcIn),
          child: widget.icon,
        );
      case OdsButtonIconStyle.functionalOutlined:
        return ColorFiltered(
          colorFilter: widget.isEnabled
              ? ColorFilter.mode(colors.secondary, BlendMode.srcIn)
              : ColorFilter.mode(
                  colors.onSurface.withOpacity(0.38), BlendMode.srcIn),
          child: widget.icon,
        );
      default:
        return widget.icon;
    }
  }

  Widget? colorSelectedFilter(bool selected, ColorScheme colors) {
    switch (widget.style) {
      case OdsButtonIconStyle.functionalStandard:
        return ColorFiltered(
          colorFilter: widget.isEnabled
              ? ColorFilter.mode(colors.primary, BlendMode.srcIn)
              : ColorFilter.mode(
                  colors.onSurface.withOpacity(0.38), BlendMode.srcIn),
          child: widget.selectedIcon,
        );
      case OdsButtonIconStyle.functionalFilled:
        return ColorFiltered(
          colorFilter: widget.isEnabled
              ? ColorFilter.mode(colors.onPrimary, BlendMode.srcIn)
              : ColorFilter.mode(
                  colors.onSurface.withOpacity(0.38), BlendMode.srcIn),
          child: widget.selectedIcon,
        );
      case OdsButtonIconStyle.functionalTonal:
        return ColorFiltered(
          colorFilter: widget.isEnabled
              ? ColorFilter.mode(colors.onSecondary, BlendMode.srcIn)
              : ColorFilter.mode(
                  colors.onSurface.withOpacity(0.38), BlendMode.srcIn),
          child: widget.selectedIcon,
        );
      case OdsButtonIconStyle.functionalOutlined:
        return ColorFiltered(
          colorFilter: widget.isEnabled
              ? ColorFilter.mode(colors.primary, BlendMode.srcIn)
              : ColorFilter.mode(
                  colors.onSurface.withOpacity(0.38), BlendMode.srcIn),
          child: widget.selectedIcon,
        );
      default:
        return widget.selectedIcon;
    }
  }

  ///Button Style
  ButtonStyle enabledFilledButtonStyle(bool selected, ColorScheme colors) {
    return IconButton.styleFrom(
      foregroundColor: selected ? colors.onPrimary : colors.primary,
      backgroundColor: selected ? colors.primary : colors.tertiaryContainer,
      disabledForegroundColor: colors.onSurface.withOpacity(0.38),
      disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
      hoverColor: selected
          ? colors.onPrimary.withOpacity(0.08)
          : colors.primary.withOpacity(0.08),
      focusColor: selected
          ? colors.onPrimary.withOpacity(0.12)
          : colors.primary.withOpacity(0.12),
      highlightColor: selected
          ? colors.onPrimary.withOpacity(0.12)
          : colors.primary.withOpacity(0.12),
    );
  }

  ButtonStyle enabledFilledTonalButtonStyle(bool selected, ColorScheme colors) {
    return IconButton.styleFrom(
      foregroundColor:
          selected ? colors.onSecondaryContainer : colors.onSurfaceVariant,
      backgroundColor:
          selected ? colors.secondaryContainer : colors.surfaceVariant,
      disabledForegroundColor: colors.onSurface.withOpacity(0.38),
      disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
      hoverColor: selected
          ? colors.onSecondaryContainer.withOpacity(0.08)
          : colors.onSurfaceVariant.withOpacity(0.08),
      focusColor: selected
          ? colors.onSecondaryContainer.withOpacity(0.12)
          : colors.onSurfaceVariant.withOpacity(0.12),
      highlightColor: selected
          ? colors.onSecondaryContainer.withOpacity(0.12)
          : colors.onSurfaceVariant.withOpacity(0.12),
    );
  }

  ButtonStyle enabledOutlinedButtonStyle(bool selected, ColorScheme colors) {
    return IconButton.styleFrom(
      backgroundColor: Colors.transparent,
      hoverColor: selected
          ? colors.onInverseSurface.withOpacity(0.08)
          : colors.onSurfaceVariant.withOpacity(0.08),
      focusColor: selected
          ? colors.onInverseSurface.withOpacity(0.12)
          : colors.onSurfaceVariant.withOpacity(0.12),
      highlightColor: selected
          ? colors.onSurface.withOpacity(0.12)
          : colors.onSurface.withOpacity(0.12),
      side: BorderSide(
        color: !widget.isEnabled
            ? colors.onSurface.withOpacity(0.38)
            : (selected ? colors.primary : colors.outline),
      ),
    ).copyWith(
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return colors.primary;
        }

        return null;
      }),
    );
  }
}
