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
        return AppLocalizations.of(context)!.listTrailingEnumNone;
      case ListsTrailingEnum.trailingSwitch:
        return AppLocalizations.of(context)!.listTrailingEnumSwitch;
      case ListsTrailingEnum.trailingCheckbox:
        return AppLocalizations.of(context)!.listTrailingEnumCheckbox;
      case ListsTrailingEnum.trailingText:
        return AppLocalizations.of(context)!.listTrailingEnumText;
      case ListsTrailingEnum.trailingInfoButton:
        return AppLocalizations.of(context)!.listTrailingEnumInfoButton;
      default:
        return "";
    }
  }
}
