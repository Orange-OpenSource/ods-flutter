import 'package:flutter/material.dart';
import 'package:ods_flutter/components/button/ods_text_button.dart';
import 'package:ods_flutter/components/card/ods_cards_common.dart';
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
    this.firstButton,
    this.secondButton,
    this.onClick,
  }) : super(key: key);

  static const double _imageHeight = 194;

  /// The image displayed in the card.
  ///TODO For the moment the fit of the image is handled by the provided image. It should be done in the library but we need help to do that!
  final OdsCardImage image;

  /// The card's title displayed below the image.
  final String title;

  /// The optional card's subtitle displayed below the title.
  final String? subtitle;

  /// The optional card's text.
  final String? text;

  /// Optional first button. If null, button will not be shown.
  final OdsTextButton? firstButton;

  /// Optional second button in the card. If null, button will not be shown.
  final OdsTextButton? secondButton;

  /// The action executed on card tap.
  final Function()? onClick;

  @override
  State<OdsVerticalImageFirstCard> createState() =>
      _OdsVerticalImageFirstCardState();
}

class _OdsVerticalImageFirstCardState extends State<OdsVerticalImageFirstCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: widget.onClick,
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
                padding: const EdgeInsets.only(
                    left: spacingM, top: spacingM, right: spacingM),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      if (widget.subtitle != null)
                        Text(
                          widget.subtitle!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      if (widget.text != null)
                        Padding(
                          padding: const EdgeInsets.only(
                              top: spacingS, bottom: spacingS),
                          child: Text(
                            widget.text!,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(spacingNone),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      if (widget.firstButton != null)
                        Padding(
                          padding: const EdgeInsets.all(spacingNone),
                          child: widget.firstButton,
                        ),
                      if (widget.secondButton != null)
                        Padding(
                          padding: (widget.secondButton != null)
                              ? const EdgeInsets.only()
                              : const EdgeInsets.only(),
                          child: widget.secondButton,
                        ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
