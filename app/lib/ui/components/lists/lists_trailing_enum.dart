import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';

enum ListsTrailingEnum {
  none,
  trailingSwitch,
  trailingCheckbox,
  trailingText,
  trailingInfoButton,
}

extension CustomElementExtension on ListsTrailingEnum {
  String stringValue(BuildContext context) {
    switch (this) {
      case ListsTrailingEnum.none:
        return AppLocalizations.of(context)!.listTrailingEnumNone;
      case ListsTrailingEnum.trailingSwitch:
        return AppLocalizations.of(context)!.listTrailingEnumSwitch;
      case ListsTrailingEnum.trailingCheckbox:
        return AppLocalizations.of(context)!.listTrailingEnumCheckbox;
      case ListsTrailingEnum.trailingText:
        return AppLocalizations.of(context)!.listTrailingEnumText;
      case ListsTrailingEnum.trailingInfoButton:
        return AppLocalizations.of(context)!.listTrailingEnumInfoButton;
      default:
        return "";
    }
  }
}
