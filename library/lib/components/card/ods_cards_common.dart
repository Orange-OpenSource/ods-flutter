import 'package:flutter/material.dart';

class OdsCardImage extends StatelessWidget {
  final ImageProvider imageProvider;
  final String contentDescription;
  final Alignment alignment;
  final BoxFit contentScale;
  final Color? backgroundColor;

  const OdsCardImage({
    super.key,
    required this.imageProvider,
    required this.contentDescription,
    this.alignment = Alignment.center,
    this.contentScale = BoxFit.cover,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      image: true,
      label: contentDescription,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: FadeInImage(
          placeholder: const AssetImage('assets/placeholder.png'),
          image: imageProvider,
          fit: contentScale,
          alignment: alignment,
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/placeholder.png',
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
