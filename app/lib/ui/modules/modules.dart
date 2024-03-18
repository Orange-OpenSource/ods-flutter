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
import 'package:ods_flutter_demo/ui/modules/lists/module_lists_screen.dart';
import 'package:ods_flutter_demo/ui/modules/modules_entities.dart';

List<Module> modules(AppLocalizations l10n) {
  return [
    Module(
      l10n.moduleLists,
      'assets/il_lists.png',
      l10n.cardSmallVariantTitle,
      ModuleListsStandard(),
    ),
  ];
}
