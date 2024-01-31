import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';

enum TextFieldEnum { single, multi }

enum TextFieldStateEnum { stateDefault, error, disabled }

enum TextFieldTrailingEnum { none, icon, text }

extension CustomElementExtension on TextFieldEnum {
  String stringValue(BuildContext context) {
    switch (this) {
      case TextFieldEnum.single:
        return AppLocalizations.of(context)!
            .componentTextFieldInputTypeSingleLine;
      case TextFieldEnum.multi:
        return AppLocalizations.of(context)!
            .componentTextFieldInputTypeMultiline;
      default:
        return "";
    }
  }
}

extension CustomStateExtension on TextFieldStateEnum {
  String stringValue(BuildContext context) {
    switch (this) {
      case TextFieldStateEnum.stateDefault:
        return AppLocalizations.of(context)!.componentStateDefault;
      case TextFieldStateEnum.disabled:
        return AppLocalizations.of(context)!.componentStateDisabled;
      case TextFieldStateEnum.error:
        return AppLocalizations.of(context)!.componentStateError;
      default:
        return "";
    }
  }
}

extension CustomTrailingExtension on TextFieldTrailingEnum {
  String stringValue(BuildContext context) {
    switch (this) {
      case TextFieldTrailingEnum.none:
        return AppLocalizations.of(context)!.componentElementNone;
      case TextFieldTrailingEnum.icon:
        return AppLocalizations.of(context)!.componentElementIcon;
      case TextFieldTrailingEnum.text:
        return AppLocalizations.of(context)!.componentElementText;
      default:
        return "";
    }
  }
}
