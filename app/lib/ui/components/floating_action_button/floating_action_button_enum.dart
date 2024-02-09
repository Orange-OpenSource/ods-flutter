/*
 * Software Name : Orange Design System
 * SPDX-FileCopyrightText: Copyright (c) Orange SA
 * SPDX-License-Identifier: MIT
 *
 * This software is distributed under the MIT licence,
 * the text of which is available at https://opensource.org/license/MIT/
 * or see the "LICENSE" file for more details.
 *
 * Software description: Flutter library of reusable graphical components for Android and iOS
 */

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';

enum FloatingActionButtonEnum { defaultFab, smallFab, largeFab, extendedFab }

extension CustomElementExtension on FloatingActionButtonEnum {
  String stringValue(BuildContext context) {
    switch (this) {
      case FloatingActionButtonEnum.defaultFab:
        return AppLocalizations.of(context)!
            .componentFloatingActionButtonSizeDefault;
      case FloatingActionButtonEnum.smallFab:
        return AppLocalizations.of(context)!
            .componentFloatingActionButtonSizeSmall;
      case FloatingActionButtonEnum.largeFab:
        return AppLocalizations.of(context)!
            .componentFloatingActionButtonSizeLarge;
      case FloatingActionButtonEnum.extendedFab:
        return AppLocalizations.of(context)!
            .componentFloatingActionButtonSizeExtended;
      default:
        return "";
    }
  }
}
