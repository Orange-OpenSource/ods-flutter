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

enum TextFieldEnum { single, multi }

enum TextFieldStateEnum { stateDefault, error, disabled }

enum TextFieldTrailingEnum { none, icon, text }

extension CustomElementExtension on TextFieldEnum {
  String stringValue(AppLocalizations l10n) {
    switch (this) {
      case TextFieldEnum.single:
        return l10n.componentTextFieldInputTypeSingleLine;
      case TextFieldEnum.multi:
        return l10n.componentTextFieldInputTypeMultiline;
    }
  }
}

extension CustomStateExtension on TextFieldStateEnum {
  String stringValue(AppLocalizations l10n) {
    switch (this) {
      case TextFieldStateEnum.stateDefault:
        return l10n.componentStateDefault;
      case TextFieldStateEnum.disabled:
        return l10n.componentStateDisabled;
      case TextFieldStateEnum.error:
        return l10n.componentStateError;
    }
  }
}

extension CustomTrailingExtension on TextFieldTrailingEnum {
  String stringValue(AppLocalizations l10n) {
    switch (this) {
      case TextFieldTrailingEnum.none:
        return l10n.componentElementNone;
      case TextFieldTrailingEnum.icon:
        return l10n.componentElementIcon;
      case TextFieldTrailingEnum.text:
        return l10n.componentElementText;
    }
  }
}
