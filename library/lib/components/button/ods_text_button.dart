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
class OdsTextButton extends StatefulWidget {
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

  @override
  State<OdsTextButton> createState() => _OdsTextButtonState();
}

class _OdsTextButtonState extends State<OdsTextButton> {
  static const double minimumWidthButtonIcon = 108;
  static const double minimumHeightButtonIcon = 40;

  OdsButtonColors getColorsForStyle(OdsTextButtonStyle? style) {
    switch (style) {
      case OdsTextButtonStyle.functionalPrimary:
        return OdsButtonColors(
            background: Theme.of(context).colorScheme.onSecondary,
            text: Theme.of(context).colorScheme.primary,
            icon: Theme.of(context).colorScheme.primary,
            textDisabled: grey500);
      case OdsTextButtonStyle.functionalDefault:
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

    if (widget.icon != null && widget.fullWidth == false) {
      return TextButton.icon(
        style: FilledButton.styleFrom(
          minimumSize:
              const Size(minimumWidthButtonIcon, minimumHeightButtonIcon),
          padding:
              const EdgeInsets.fromLTRB(spacingM, spacingS, spacingL, spacingS),
          backgroundColor: styleButtonColor.background,
        ),
        onPressed: widget.onClick,
        icon: widget.onClick != null
            ? colorDefaultFilter()
            : _colorEnableFilter(),
        label: Text(
          widget.text,
          style: TextStyle(
            color: widget.onClick != null
                ? styleButtonColor.text
                : styleButtonColor.textDisabled,
          ),
        ),
      );
    }

    if (widget.icon != null && widget.fullWidth == true) {
      return SizedBox(
        width: double.infinity,
        child: TextButton.icon(
          onPressed: widget.onClick,
          icon: widget.onClick != null
              ? colorDefaultFilter()
              : _colorEnableFilter(),
          label: Text(
            widget.text,
            style: TextStyle(
              color: widget.onClick != null
                  ? styleButtonColor.text
                  : styleButtonColor.textDisabled,
            ),
          ),
          style: FilledButton.styleFrom(
              backgroundColor: styleButtonColor.background),
        ),
      );
    }

    if (widget.fullWidth == true) {
      return SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: widget.onClick,
          style: FilledButton.styleFrom(
              backgroundColor: styleButtonColor.background),
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.onClick != null
                  ? styleButtonColor.text
                  : styleButtonColor.textDisabled,
            ),
          ),
        ),
      );
    }

    return TextButton(
      onPressed: widget.onClick,
      style:
          FilledButton.styleFrom(backgroundColor: styleButtonColor.background),
      child: Text(
        widget.text,
        style: TextStyle(
          color: widget.onClick != null
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
