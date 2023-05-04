import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget displayImage(String imagePath) {
  if (imagePath.contains('svg')) {
    return SvgPicture.asset(
      imagePath,
      semanticsLabel: 'Flutter image',
      fit: BoxFit.fitHeight,
      width: double.infinity,
    );
  } else {
    return Image.asset(
      imagePath,
      semanticLabel: 'Flutter image',
      fit: BoxFit.fitHeight,
      width: double.infinity,
    );
  }
}
