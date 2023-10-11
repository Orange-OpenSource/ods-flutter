import 'package:flutter/material.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter/theme/ods_palette.dart';

///
///Specifying an [OdsButtonStyle] allow to display a button with specific colors.
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

enum OdsButtonStyle {
  functionalPositive,
  functionalNegative,
  functionalPrimary,
  functionalDefault,
}

/// ODS Design Button.
///
/// Displays a customizable button with an optional icon and a title.
/// The button can expand to full screen width if specified.
class OdsButton extends StatefulWidget {
  /// Creates an ODS Button.
  ///
  /// * [title] - Text displayed in the button.
  /// * [fullScreenWidth] - Specifies whether the button should expand to full screen width.
  /// * [icon] - Widget of the icon.
  /// * [onPressed] - The action to be executed when the button is pressed.
  /// * [style] - The button's style color.
  const OdsButton({
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
  final void Function()? onPressed;

  /// The background style.
  final OdsButtonStyle style;

  @override
  State<OdsButton> createState() => _OdsButtonState();
}

class _OdsButtonState extends State<OdsButton> {
  static const double minimumWidthButtonIcon = 108;
  static const double minimumHeightButtonIcon = 40;

  OdsButtonColors getColorsForStyle(OdsButtonStyle? style) {
    switch (style) {
      case OdsButtonStyle.functionalPrimary:
        return OdsButtonColors(
            background: Theme.of(context).colorScheme.primary,
            text: Theme.of(context).colorScheme.onPrimary,
            icon: Theme.of(context).colorScheme.onPrimary,
            textDisabled: grey500);
      case OdsButtonStyle.functionalDefault:
        return OdsButtonColors(
            background: Theme.of(context).colorScheme.secondary,
            text: Theme.of(context).colorScheme.onSecondary,
            icon: Theme.of(context).colorScheme.onSecondary,
            textDisabled: grey500);
      case OdsButtonStyle.functionalPositive:
        return OdsButtonColors(
            background: positive200,
            text: Theme.of(context).colorScheme.onSecondary,
            icon: Theme.of(context).colorScheme.onSecondary,
            textDisabled: grey500);
      case OdsButtonStyle.functionalNegative:
        return OdsButtonColors(
            background: Theme.of(context).colorScheme.error,
            text: Theme.of(context).colorScheme.onSecondary,
            icon: Theme.of(context).colorScheme.onSecondary,
            textDisabled: grey500);
      default:
        return OdsButtonColors(
            background: Theme.of(context).colorScheme.primary,
            text: black900,
            textDisabled: grey500);
    }
  }

  @override
  Widget build(BuildContext context) {
    final styleButtonColor = getColorsForStyle(widget.style);

    if (widget.icon != null && widget.fullScreenWidth == false) {
      return SizedBox(
        child: FilledButton.icon(
          style: FilledButton.styleFrom(
            minimumSize:
                const Size(minimumWidthButtonIcon, minimumHeightButtonIcon),
            padding: const EdgeInsets.fromLTRB(
                spacingM, spacingS, spacingL, spacingS),
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
        ),
      );
    }

    if (widget.icon != null && widget.fullScreenWidth == true) {
      return SizedBox(
        width: double.infinity,
        child: FilledButton.icon(
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
        child: FilledButton(
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

    return FilledButton(
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
