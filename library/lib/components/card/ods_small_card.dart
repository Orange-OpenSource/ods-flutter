import 'package:flutter/material.dart';
import 'package:ods_flutter/guidelines/spacings.dart';

/// ODS Small card.
///
/// Cards contain content and actions about a single subject.
///
/// A ripple effect is managed on card click.
class OdsSmallCard extends StatelessWidget {
  /// Creates an ODS Small card.
  const OdsSmallCard({
    Key? key,
    required this.title,
    required this.image,
    this.subtitle,
    this.onTap,
  }) : super(key: key);

  static const double _imageHeight = 110;

  /// The card's title displayed below the image.
  final String title;

  /// The image displayed in the card.
  ///TODO For the moment the fit of the image is handled by the provided image. It should be done in the library but we need help to do that!
  final Widget image;

  /// The optional card's subtitle displayed below the title.
  final String? subtitle;

  /// The action executed on card tap.
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          elevation: 1,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: _imageHeight,
                child: image,
              ),
              Padding(
                padding: const EdgeInsets.all(spacingM),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      if (subtitle != null)
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                    ]),
              )
            ],
          ),
        ),
      ),
      Positioned.fill(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
          ),
        ),
      )
    ]);
  }
}
