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

enum ChipsEnum { none, avatar, icon }

extension CustomElementExtension on ChipsEnum {
  String stringValue(BuildContext context) {
    switch (this) {
      case ChipsEnum.none:
        return AppLocalizations.of(context)!.componentChipEnumNone;
      case ChipsEnum.avatar:
        return AppLocalizations.of(context)!.componentChipEnumAvatar;
      case ChipsEnum.icon:
        return AppLocalizations.of(context)!.componentChipEnumIcon;
      default:
        return "";
    }
  }
}
