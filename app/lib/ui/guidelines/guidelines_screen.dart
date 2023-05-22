import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
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
              title: Center(
                  child:
                      Text(AppLocalizations.of(context)!.guidelinesTypography)),
            ),
          ),
        ],
      ),
    ));
  }
}
