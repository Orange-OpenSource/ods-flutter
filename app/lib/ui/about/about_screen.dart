import 'package:flutter/material.dart';
import 'package:ods_flutter/l10n/ods_flutter_localizations.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Text(AppLocalizations.of(context)!.aboutPageAppDescription));
  }
}
