import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';

enum ProgressEnum {
  determinate,
  indeterminate,
}

extension CustomElementExtension on ProgressEnum {
  String stringValue(BuildContext context) {
    switch (this) {
      case ProgressEnum.determinate:
        return AppLocalizations.of(context)!.progressTypeDeterminateEnum;
      case ProgressEnum.indeterminate:
        return AppLocalizations.of(context)!.progressTypeIndeterminateEnum;
      default:
        return "";
    }
  }
}
