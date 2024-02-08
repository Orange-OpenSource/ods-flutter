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

///Segmented Button Enum
/// * [single] - Single select segmented button.
/// * [multi] - Multi select segmented button.
enum SegmentedButtonsEnum {
  single,
  multi,
}

extension CustomElementExtension on SegmentedButtonsEnum {
  String stringValue(BuildContext context) {
    switch (this) {
      case SegmentedButtonsEnum.single:
        return AppLocalizations.of(context)!.segmentedEnumSingle;
      case SegmentedButtonsEnum.multi:
        return AppLocalizations.of(context)!.segmentedEnumMulti;
    }
  }
}
