import 'package:flutter/material.dart';
import 'package:ods_flutter/guidelines/spacings.dart';

class OdsSmallCard extends StatelessWidget {
  final String title;
  final Widget image;
  String? subtitle;
  Function()? onTap;

  OdsSmallCard({
    Key? key,
    required this.title,
    required this.image,
    this.subtitle,
    this.onTap,
  }) : super(key: key);

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
                height: 110,
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
