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
        return AppLocalizations.of(context)!.listsTrailingEnumNone;
      case ListsTrailingEnum.trailingSwitch:
        return AppLocalizations.of(context)!.listsTrailingEnumSwitch;
      case ListsTrailingEnum.trailingCheckbox:
        return AppLocalizations.of(context)!.listsTrailingEnumCheckbox;
      case ListsTrailingEnum.trailingText:
        return AppLocalizations.of(context)!.listsTrailingEnumText;
      case ListsTrailingEnum.trailingInfoButton:
        return AppLocalizations.of(context)!.listsTrailingEnumInfoButton;
      default:
        return "";
    }
  }
}
