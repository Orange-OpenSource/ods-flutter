import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget displayImage(String imagePath, {String? semanticsLabel}) {
  if (imagePath.contains('svg')) {
    return SvgPicture.asset(
      imagePath,
      semanticsLabel: semanticsLabel,
      fit: BoxFit.cover,
    );
  } else {
    return Image.asset(
      imagePath,
      semanticLabel: semanticsLabel,
      fit: BoxFit.cover,
    );
  }
}
