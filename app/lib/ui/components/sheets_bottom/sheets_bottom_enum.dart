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

enum SheetsBottomEnum { empty, example }

extension CustomElementExtension on SheetsBottomEnum {
  String stringValue(BuildContext context) {
    switch (this) {
      case SheetsBottomEnum.empty:
        return AppLocalizations.of(context)!.sheetsBottomEnumEmpty;
      case SheetsBottomEnum.example:
        return AppLocalizations.of(context)!.sheetsBottomEnumExample;
      default:
        return "";
    }
  }
}
