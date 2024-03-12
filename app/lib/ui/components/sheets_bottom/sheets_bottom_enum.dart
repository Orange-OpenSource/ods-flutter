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

enum SheetsBottomEnum { empty, example }

extension CustomElementExtension on SheetsBottomEnum {
  String stringValue(AppLocalizations l10n) {
    switch (this) {
      case SheetsBottomEnum.empty:
        return l10n.sheetsBottomEnumEmpty;
      case SheetsBottomEnum.example:
        return l10n.sheetsBottomEnumExample;
    }
  }
}
