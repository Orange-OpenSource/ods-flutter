import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';

enum SheetsBottomEnum { empty, example }

extension CustomElementExtension on SheetsBottomEnum {
  String stringValue(BuildContext context) {
    switch (this) {
      case SheetsBottomEnum.empty:
        return AppLocalizations.of(context)!.sheetsBottomEnumEmpty;
      case SheetsBottomEnum.example:
        return AppLocalizations.of(context)!.sheetsBottomEnumExample;
      default:
        return "";
    }
  }
}
