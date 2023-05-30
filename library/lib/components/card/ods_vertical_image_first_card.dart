import 'package:flutter/material.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter/theme/ods_theme.dart';

/// ODS Vertical image first card.
///
/// Cards contain content and actions about a single subject.
///
/// A ripple effect is managed on card click.
class OdsVerticalImageFirstCard extends StatefulWidget {
  /// Creates an ODS vertical image first card.
  const OdsVerticalImageFirstCard({
    Key? key,
    required this.title,
    required this.image,
    this.subtitle,
    this.text,
    this.button1Text,
    this.button2Text,
    this.onButton1Click,
    this.onButton2Click,
  }) : super(key: key);

  static const double _imageHeight = 194;

  /// The image displayed in the card.
  ///TODO For the moment the fit of the image is handled by the provided image. It should be done in the library but we need help to do that!
  final Widget image;

  /// The card's title displayed below the image.
  final String title;

  /// The optional card's subtitle displayed below the title.
  final String? subtitle;

  /// The optional card's text.
  final String? text;

  /// Optional text of the first button in the card. If not present, button will not be shown. If present, [onButton1Click] need to be handled.
  final String? button1Text;

  /// Optional text of the second button in the card. If not present, button will not be shown. If present, [onButton2Click] need to be handled.
  final String? button2Text;

  /// Optional handler for the first button click.
  final VoidCallback? onButton1Click;

  /// Optional handler for the second button click.
  final VoidCallback? onButton2Click;

  @override
  State<OdsVerticalImageFirstCard> createState() => _OdsVerticalImageFirstCardState();
}

class _OdsVerticalImageFirstCardState extends State<OdsVerticalImageFirstCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(odsCardRadius),
        ),
        elevation: 1,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: OdsVerticalImageFirstCard._imageHeight,
              child: widget.image,
            ),
            Padding(
              padding: const EdgeInsets.only(left: spacingM, top: spacingM, right: spacingM),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                if (widget.subtitle != null)
                  Text(
                    widget.subtitle!,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                if (widget.text != null)
                  Padding(
                    padding: const EdgeInsets.only(top: spacingS),
                    child: Text(
                      widget.text!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(spacingS),
              child: Row(
                children: [
                  if (widget.button1Text != null)
                    TextButton(
                      onPressed: widget.onButton1Click,
                      child: Text(widget.button1Text!),
                    ), //TODO Use ODS text button when available to display text in uppercase
                  if (widget.button2Text != null)
                    Padding(
                      padding: (widget.button1Text != null) ? const EdgeInsets.only(left: spacingS) : const EdgeInsets.only(),
                      child: TextButton(
                        onPressed: widget.onButton2Click,
                        child: Text(widget.button2Text!),
                      ), //TODO Use ODS text button when available to display text in uppercase
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
