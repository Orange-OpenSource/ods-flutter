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

enum NavigationRailsEnum { none, firstIcon, secondIcon }

extension CustomElementExtension on NavigationRailsEnum {
  String stringValue(AppLocalizations l10n) {
    switch (this) {
      case NavigationRailsEnum.none:
        return l10n.componentNavigationRailLeadingNone;
      case NavigationRailsEnum.firstIcon:
        return l10n.componentNavigationRailLeadingMenu;
      case NavigationRailsEnum.secondIcon:
        return l10n.componentNavigationRailLeadingFab;
    }
  }
}
