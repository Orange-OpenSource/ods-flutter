import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';

enum ListsLeadingEnum { none, icon, circle, wide, square }

extension CustomElementExtension on ListsLeadingEnum {
  String stringValue(BuildContext context) {
    switch (this) {
      case ListsLeadingEnum.none:
        return AppLocalizations.of(context)!.listsLeadingEnumNone;
      case ListsLeadingEnum.icon:
        return AppLocalizations.of(context)!.listsLeadingEnumIcon;
      case ListsLeadingEnum.circle:
        return AppLocalizations.of(context)!.listsLeadingEnumCircle;
      case ListsLeadingEnum.wide:
        return AppLocalizations.of(context)!.listsLeadingEnumWide;
      case ListsLeadingEnum.square:
        return AppLocalizations.of(context)!.listsLeadingEnumSquare;
      default:
        return "";
    }
  }
}
