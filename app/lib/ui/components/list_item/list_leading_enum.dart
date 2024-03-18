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

enum ListLeadingEnum { none, icon, circle, wide, square }

extension CustomElementExtension on ListLeadingEnum {
  String stringValue(AppLocalizations l10n) {
    switch (this) {
      case ListLeadingEnum.none:
        return l10n.listLeadingEnumNone;
      case ListLeadingEnum.icon:
        return l10n.listLeadingEnumIcon;
      case ListLeadingEnum.circle:
        return l10n.listLeadingEnumCircle;
      case ListLeadingEnum.wide:
        return l10n.listLeadingEnumWide;
      case ListLeadingEnum.square:
        return l10n.listLeadingEnumSquare;
    }
  }
}
