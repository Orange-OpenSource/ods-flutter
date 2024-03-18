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

enum ChipsEnum { none, avatar, icon }

extension CustomElementExtension on ChipsEnum {
  String stringValue(AppLocalizations l10n) {
    switch (this) {
      case ChipsEnum.none:
        return l10n.componentChipEnumNone;
      case ChipsEnum.avatar:
        return l10n.componentChipEnumAvatar;
      case ChipsEnum.icon:
        return l10n.componentChipEnumIcon;
      default:
        return "";
    }
  }
}
