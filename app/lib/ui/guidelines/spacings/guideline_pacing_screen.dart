import 'package:flutter/material.dart';

class GuidelineSpacingImage extends StatelessWidget {
  final double spacing;

  GuidelineSpacingImage({required this.spacing});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: 60,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  color: colorScheme.tertiaryContainer,
                ),
              ),
              Expanded(
                child: Container(
                  color: colorScheme.scrim,
                ),
              ),
              Expanded(
                child: Container(
                  color: colorScheme.tertiaryContainer,
                ),
              ),
            ],
          ),
          Container(
            width: spacing,
            color: Colors.blue[400],
          ),
        ],
      ),
    );
  }
}
