import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';

enum KeyboardTypeEnum { text, decimal, email, number, phone, url }

enum KeyboardActionEnum {
  none,
  defaultAction,
  done,
  go,
  search,
  send,
  previous,
  next
}

extension CustomElementExtension on KeyboardTypeEnum {
  String stringValue(BuildContext context) {
    switch (this) {
      case KeyboardTypeEnum.text:
        return AppLocalizations.of(context)!.componentTextFieldKeyboardTypeText;
      case KeyboardTypeEnum.decimal:
        return AppLocalizations.of(context)!
            .componentTextFieldKeyboardTypeDecimal;
      case KeyboardTypeEnum.email:
        return AppLocalizations.of(context)!
            .componentTextFieldKeyboardTypeEmail;
      case KeyboardTypeEnum.number:
        return AppLocalizations.of(context)!
            .componentTextFieldKeyboardTypeNumber;
      case KeyboardTypeEnum.phone:
        return AppLocalizations.of(context)!
            .componentTextFieldKeyboardTypePhone;
      case KeyboardTypeEnum.url:
        return AppLocalizations.of(context)!.componentTextFieldKeyboardTypeUrl;
      default:
        return "";
    }
  }
}

extension CustomKeyboardActionExtension on KeyboardActionEnum {
  String stringValue(BuildContext context) {
    switch (this) {
      case KeyboardActionEnum.none:
        return AppLocalizations.of(context)!
            .componentTextFieldKeyboardActionNone;
      case KeyboardActionEnum.defaultAction:
        return AppLocalizations.of(context)!
            .componentTextFieldKeyboardActionDefault;
      case KeyboardActionEnum.done:
        return AppLocalizations.of(context)!
            .componentTextFieldKeyboardActionDone;
      case KeyboardActionEnum.go:
        return AppLocalizations.of(context)!.componentTextFieldKeyboardActionGo;
      case KeyboardActionEnum.search:
        return AppLocalizations.of(context)!
            .componentTextFieldKeyboardActionSearch;
      case KeyboardActionEnum.send:
        return AppLocalizations.of(context)!
            .componentTextFieldKeyboardActionSend;
      case KeyboardActionEnum.previous:
        return AppLocalizations.of(context)!
            .componentTextFieldKeyboardActionPrevious;
      case KeyboardActionEnum.next:
        return AppLocalizations.of(context)!
            .componentTextFieldKeyboardActionNext;
      default:
        return "";
    }
  }
}
