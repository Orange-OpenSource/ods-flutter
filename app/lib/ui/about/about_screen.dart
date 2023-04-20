import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_localizations.dart';
import 'package:ods_flutter/ods_flutter.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Text(AppLocalizations.of(context)!.aboutPageAppDescription));
  }
}
