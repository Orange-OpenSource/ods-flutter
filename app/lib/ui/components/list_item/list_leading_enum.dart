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

enum ListLeadingEnum { none, icon, circle, wide, square }

extension CustomElementExtension on ListLeadingEnum {
  String stringValue(BuildContext context) {
    switch (this) {
      case ListLeadingEnum.none:
        return AppLocalizations.of(context)!.listLeadingEnumNone;
      case ListLeadingEnum.icon:
        return AppLocalizations.of(context)!.listLeadingEnumIcon;
      case ListLeadingEnum.circle:
        return AppLocalizations.of(context)!.listLeadingEnumCircle;
      case ListLeadingEnum.wide:
        return AppLocalizations.of(context)!.listLeadingEnumWide;
      case ListLeadingEnum.square:
        return AppLocalizations.of(context)!.listLeadingEnumSquare;
      default:
        return "";
    }
  }
}
