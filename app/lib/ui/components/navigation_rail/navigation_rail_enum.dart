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

enum NavigationRailsEnum { none, firstIcon, secondIcon }

extension CustomElementExtension on NavigationRailsEnum {
  String stringValue(BuildContext context) {
    switch (this) {
      case NavigationRailsEnum.none:
        return AppLocalizations.of(context)!.componentNavigationRailLeadingNone;
      case NavigationRailsEnum.firstIcon:
        return AppLocalizations.of(context)!
            .componentNavigationRailLeadingFirst;
      case NavigationRailsEnum.secondIcon:
        return AppLocalizations.of(context)!
            .componentNavigationRailLeadingSecond;
      default:
        return "";
    }
  }
}
