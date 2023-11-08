import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';

enum ListsLeadingEnum { none, icon, circle, wide, square }

extension CustomElementExtension on ListsLeadingEnum {
  String stringValue(BuildContext context) {
    switch (this) {
      case ListsLeadingEnum.none:
        return AppLocalizations.of(context)!.listLeadingEnumNone;
      case ListsLeadingEnum.icon:
        return AppLocalizations.of(context)!.listLeadingEnumIcon;
      case ListsLeadingEnum.circle:
        return AppLocalizations.of(context)!.listLeadingEnumCircle;
      case ListsLeadingEnum.wide:
        return AppLocalizations.of(context)!.listLeadingEnumWide;
      case ListsLeadingEnum.square:
        return AppLocalizations.of(context)!.listLeadingEnumSquare;
      default:
        return "";
    }
  }
}
