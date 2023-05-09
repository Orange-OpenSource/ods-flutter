import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget displayImage(String imagePath, double? width) {
  if (imagePath.contains('svg')) {
    return SvgPicture.asset(imagePath,
        semanticsLabel: 'Flutter image', fit: BoxFit.cover, width: width);
  } else {
    return Image.asset(imagePath,
        semanticLabel: 'Flutter image', fit: BoxFit.cover, width: width);
  }
}
