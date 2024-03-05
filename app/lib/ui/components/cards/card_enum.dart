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

enum CardEnum { start, end }

extension CustomElementExtension on CardEnum {
  String stringValue(BuildContext context) {
    switch (this) {
      case CardEnum.start:
        return AppLocalizations.of(context)!
            .componentCardHorizontalImagePositionStart;
      case CardEnum.end:
        return AppLocalizations.of(context)!
            .componentCardHorizontalImagePositionEnd;
      default:
        return "";
    }
  }
}
