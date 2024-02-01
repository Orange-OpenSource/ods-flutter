import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ods_flutter/components/card/ods_cards_common.dart';
import 'package:ods_flutter/components/card/ods_vertical_image_first_card.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/guidelines/guidelines_entities.dart';

class GuidelinesScreen extends StatefulWidget {
  final List<Guideline> odsGuidelines;

  GuidelinesScreen({required this.odsGuidelines});

  @override
  State<GuidelinesScreen> createState() => _GuidelinesScreenState();
}

class _GuidelinesScreenState extends State<GuidelinesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: widget.odsGuidelines.length,
        itemBuilder: (context, index) {
          var guideline = widget.odsGuidelines[index];
          return Padding(
            padding: const EdgeInsets.all(spacingS),
            child: Column(
              children: [
                OdsVerticalImageFirstCard(
                  title: guideline.title,
                  image: OdsCardImage(
                    imageProvider: AssetImage(guideline.imageResourceName),
                    contentDescription: '', //Optional
                    alignment: Alignment.center,
                    contentScale: BoxFit.cover,
                  ),
                  onClick: () {
                    Get.to(
                      guideline.screen,
                      transition: Transition.rightToLeft,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
