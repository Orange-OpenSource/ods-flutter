import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';

///Button Contained
/// * [functionalPositive] - Text displayed in the button with a functional positive style.
/// * [functionalNegative] - Text displayed in the button with a functional negative style.
/// * [functionalPrimary] - Text displayed in the button with a primary style.
/// * [functionalDefault] - Text displayed in the button with a default style.
enum ButtonsEnum {
  functionalPositive,
  functionalNegative,
  functionalPrimary,
  functionalDefault,
}

extension CustomElementExtension on ButtonsEnum {
  String stringValue(BuildContext context) {
    switch (this) {
      case ButtonsEnum.functionalPositive:
        return AppLocalizations.of(context)!.buttonsFunctionalPositiveEnum;
      case ButtonsEnum.functionalNegative:
        return AppLocalizations.of(context)!.buttonsFunctionalNegativeEnum;
      case ButtonsEnum.functionalDefault:
        return AppLocalizations.of(context)!.buttonsTextFunctionalDefaultEnum;
      case ButtonsEnum.functionalPrimary:
        return AppLocalizations.of(context)!.buttonsTextFunctionalPrimaryEnum;
    }
  }
}
