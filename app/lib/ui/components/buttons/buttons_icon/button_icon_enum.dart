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

///Button Icon
/// * [functionalStandard] - Text displayed in the button with a standard icon button style.
/// * [functionalFilled] - Text displayed in the button with a functional filled icon button style.
/// * [functionalTonal] - Text displayed in the button with a tonal icon button style.
/// * [functionalOutlined] - Text displayed in the button with a outlined icon style.
enum ButtonsIconEnum {
  functionalStandard,
  functionalFilled,
  functionalTonal,
  functionalOutlined,
}

extension CustomElementExtension on ButtonsIconEnum {
  String stringValue(BuildContext context) {
    switch (this) {
      case ButtonsIconEnum.functionalStandard:
        return AppLocalizations.of(context)!.buttonsIconFunctionalStandardEnum;
      case ButtonsIconEnum.functionalFilled:
        return AppLocalizations.of(context)!.buttonsIconFunctionalFilledEnum;
      case ButtonsIconEnum.functionalTonal:
        return AppLocalizations.of(context)!.buttonsIconFunctionalTonalEnum;
      case ButtonsIconEnum.functionalOutlined:
        return AppLocalizations.of(context)!.buttonsIconFunctionalOutlinedEnum;
    }
  }
}
