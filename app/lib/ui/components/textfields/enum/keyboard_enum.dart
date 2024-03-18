/*
 * Software Name : Orange Design System
 * SPDX-FileCopyrightText: Copyright (c) Orange SA
 * SPDX-License-Identifier: MIT
 *
 * This software is distributed under the MIT license,
 * the text of which is available at https://opensource.org/license/MIT/
 * or see the "LICENSE" file for more details.
 *
 * Software description: Flutter library of reusable graphical components for Android and iOS
 */

import 'package:ods_flutter_demo/l10n/gen/ods_flutter_app_localizations.dart';

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
  String stringValue(AppLocalizations l10n) {
    switch (this) {
      case KeyboardTypeEnum.text:
        return l10n.componentTextFieldKeyboardTypeText;
      case KeyboardTypeEnum.decimal:
        return l10n.componentTextFieldKeyboardTypeDecimal;
      case KeyboardTypeEnum.email:
        return l10n.componentTextFieldKeyboardTypeEmail;
      case KeyboardTypeEnum.number:
        return l10n.componentTextFieldKeyboardTypeNumber;
      case KeyboardTypeEnum.phone:
        return l10n.componentTextFieldKeyboardTypePhone;
      case KeyboardTypeEnum.url:
        return l10n.componentTextFieldKeyboardTypeUrl;
    }
  }
}

extension CustomKeyboardActionExtension on KeyboardActionEnum {
  String stringValue(AppLocalizations l10n) {
    switch (this) {
      case KeyboardActionEnum.none:
        return l10n.componentTextFieldKeyboardActionNone;
      case KeyboardActionEnum.defaultAction:
        return l10n.componentTextFieldKeyboardActionDefault;
      case KeyboardActionEnum.done:
        return l10n.componentTextFieldKeyboardActionDone;
      case KeyboardActionEnum.go:
        return l10n.componentTextFieldKeyboardActionGo;
      case KeyboardActionEnum.search:
        return l10n.componentTextFieldKeyboardActionSearch;
      case KeyboardActionEnum.send:
        return l10n.componentTextFieldKeyboardActionSend;
      case KeyboardActionEnum.previous:
        return l10n.componentTextFieldKeyboardActionPrevious;
      case KeyboardActionEnum.next:
        return l10n.componentTextFieldKeyboardActionNext;
    }
  }
}
