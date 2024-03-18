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

enum ProgressEnum {
  determinate,
  indeterminate,
}

extension CustomElementExtension on ProgressEnum {
  String stringValue(AppLocalizations l10n) {
    switch (this) {
      case ProgressEnum.determinate:
        return l10n.progressTypeDeterminateEnum;
      case ProgressEnum.indeterminate:
        return l10n.progressTypeIndeterminateEnum;
    }
  }
}
