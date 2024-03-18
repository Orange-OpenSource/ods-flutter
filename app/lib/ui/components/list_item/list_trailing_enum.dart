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

enum ListTrailingEnum {
  none,
  trailingSwitch,
  trailingCheckbox,
  trailingText,
  trailingInfoButton,
}

extension CustomElementExtension on ListTrailingEnum {
  String stringValue(AppLocalizations l10n) {
    switch (this) {
      case ListTrailingEnum.none:
        return l10n.listTrailingEnumNone;
      case ListTrailingEnum.trailingSwitch:
        return l10n.listTrailingEnumSwitch;
      case ListTrailingEnum.trailingCheckbox:
        return l10n.listTrailingEnumCheckbox;
      case ListTrailingEnum.trailingText:
        return l10n.listTrailingEnumText;
      case ListTrailingEnum.trailingInfoButton:
        return l10n.listTrailingEnumInfoButton;
      default:
        return "";
    }
  }
}
