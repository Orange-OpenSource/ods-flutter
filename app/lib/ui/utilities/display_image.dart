import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///
/// displayImage is used to return a specific widget based on image type
/// * [imagePath] represent the path of the image
/// * [width] represent the width of the image
/// * [semanticsLabel] optional label
Widget displayImage(String imagePath, double? width, {String? semanticsLabel}) {
  if (imagePath.contains('svg')) {
    return SvgPicture.asset(imagePath,
        semanticsLabel: semanticsLabel, fit: BoxFit.cover, width: width);
  } else {
    return Image.asset(imagePath,
        semanticLabel: semanticsLabel, fit: BoxFit.cover, width: width);
  }
}
