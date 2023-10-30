import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';

enum FloatingActionButtonEnum { defaultFab, smallFab, largeFab, extendedFab }

extension CustomElementExtension on FloatingActionButtonEnum {
  String stringValue(BuildContext context) {
    switch (this) {
      case FloatingActionButtonEnum.defaultFab:
        return AppLocalizations.of(context)!
            .componentFloatingActionButtonSizeDefault;
      case FloatingActionButtonEnum.smallFab:
        return AppLocalizations.of(context)!
            .componentFloatingActionButtonSizeSmall;
      case FloatingActionButtonEnum.largeFab:
        return AppLocalizations.of(context)!
            .componentFloatingActionButtonSizeLarge;
      case FloatingActionButtonEnum.extendedFab:
        return AppLocalizations.of(context)!
            .componentFloatingActionButtonSizeExtended;
      default:
        return "";
    }
  }
}
