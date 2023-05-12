import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ods_flutter_demo/ui/guidelines/typography/guideline_typography_screen.dart';

class GuidelinesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Card(
            child: ListTile(
              onTap: () {
                Get.to(GuidelineTypographyScreen());
              },
              title: const Center(child: Text('Typography')),
            ),
          ),
        ],
      ),
    ));
  }
}
