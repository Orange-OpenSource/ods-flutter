import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';

enum CardEnum { start, end }

extension CustomElementExtension on CardEnum {
  String stringValue(BuildContext context) {
    switch (this) {
      case CardEnum.start:
        return AppLocalizations.of(context)!
            .componentCardHorizontalImagePositionStart;
      case CardEnum.end:
        return AppLocalizations.of(context)!
            .componentCardHorizontalImagePositionEnd;
      default:
        return "";
    }
  }
}
