import 'package:flutter/material.dart';
import 'package:ods_flutter/components/button/model/ods_button_colors.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter/theme/ods_palette.dart';

/// ODS Design Button.
///
/// Displays a customizable button with an optional icon and a title.
/// The button can expand to full screen width if specified.
class OdsTextButton extends StatefulWidget {
  /// Creates an ODS Text Button.
  ///
  /// * [title] - Text displayed in the button.
  /// * [fullScreenWidth] - Specifies whether the button should expand to full screen width.
  /// * [icon] - Widget of the icon.
  /// * [onPressed] - The action to be executed when the button is pressed.
  /// * [style] - The button's style color.
  const OdsTextButton({
    Key? key,
    required this.title,
    this.fullScreenWidth = false,
    this.icon,
    this.onPressed,
    required this.style,
  }) : super(key: key);

  /// The button's title displayed inside the button.
  final String title;

  /// Specifies whether the button should expand to full screen width.
  final bool fullScreenWidth;

  /// The optional button's icon.
  final Widget? icon;

  /// The action to be executed when the button is pressed.
  final Function()? onPressed;

  /// The background style.
  final OdsButtonStyle style;

  @override
  State<OdsTextButton> createState() => _OdsTextButtonState();
}

class _OdsTextButtonState extends State<OdsTextButton> {
  static const double minimumWidthButtonIcon = 108;
  static const double minimumHeightButtonIcon = 40;

  OdsButtonColors getColorsForStyle(OdsButtonStyle? style) {
    switch (style) {
      case OdsButtonStyle.functionalPrimary:
        return OdsButtonColors(
            background: Theme.of(context).colorScheme.onSecondary,
            text: Theme.of(context).colorScheme.primary,
            icon: Theme.of(context).colorScheme.primary,
            textDisabled: grey500);
      case OdsButtonStyle.functionalDefault:
        return OdsButtonColors(
            background: Theme.of(context).colorScheme.onSecondary,
            text: Theme.of(context).colorScheme.onSurface,
            icon: Theme.of(context).colorScheme.secondary,
            textDisabled: grey500);
      default:
        return OdsButtonColors(
            background: Theme.of(context).colorScheme.onSecondary,
            text: Theme.of(context).colorScheme.secondary,
            icon: Theme.of(context).colorScheme.onSecondary,
            textDisabled: grey500);
    }
  }

  @override
  Widget build(BuildContext context) {
    final styleButtonColor = getColorsForStyle(widget.style);

    if (widget.icon != null && widget.fullScreenWidth == false) {
      return TextButton.icon(
        style: FilledButton.styleFrom(
          minimumSize:
              const Size(minimumWidthButtonIcon, minimumHeightButtonIcon),
          padding:
              const EdgeInsets.fromLTRB(spacingM, spacingS, spacingL, spacingS),
          backgroundColor: styleButtonColor.background,
        ),
        onPressed: widget.onPressed,
        icon: widget.onPressed != null
            ? colorDefaultFilter()
            : _colorEnableFilter(),
        label: Text(
          widget.title,
          style: TextStyle(
            color: widget.onPressed != null
                ? styleButtonColor.text
                : styleButtonColor.textDisabled,
          ),
        ),
      );
    }

    if (widget.icon != null && widget.fullScreenWidth == true) {
      return SizedBox(
        width: double.infinity,
        child: TextButton.icon(
          onPressed: widget.onPressed,
          icon: widget.onPressed != null
              ? colorDefaultFilter()
              : _colorEnableFilter(),
          label: Text(
            widget.title,
            style: TextStyle(
              color: widget.onPressed != null
                  ? styleButtonColor.text
                  : styleButtonColor.textDisabled,
            ),
          ),
          style: FilledButton.styleFrom(
              backgroundColor: styleButtonColor.background),
        ),
      );
    }

    if (widget.fullScreenWidth == true) {
      return SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: widget.onPressed,
          style: FilledButton.styleFrom(
              backgroundColor: styleButtonColor.background),
          child: Text(
            widget.title,
            style: TextStyle(
              color: widget.onPressed != null
                  ? styleButtonColor.text
                  : styleButtonColor.textDisabled,
            ),
          ),
        ),
      );
    }

    return TextButton(
      onPressed: widget.onPressed,
      style:
          FilledButton.styleFrom(backgroundColor: styleButtonColor.background),
      child: Text(
        widget.title,
        style: TextStyle(
          color: widget.onPressed != null
              ? styleButtonColor.text
              : styleButtonColor.textDisabled,
        ),
      ),
    );
  }

  ///Color Filter
  Widget colorDefaultFilter() {
    final styleButtonColor = getColorsForStyle(widget.style);
    return ColorFiltered(
      colorFilter: ColorFilter.mode(styleButtonColor.icon!, BlendMode.srcIn),
      child: widget.icon,
    );
  }

  Widget _colorEnableFilter() {
    return ColorFiltered(
      colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
      child: widget.icon,
    );
  }
}
