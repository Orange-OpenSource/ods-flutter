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
import 'package:ods_flutter/components/navigation_bar/ods_navigation_bar_item.dart';
import 'package:ods_flutter/components/navigation_rail/ods_navigation_rail_item.dart';
import 'package:ods_flutter_demo/l10n/l10n.dart';
import 'package:ods_flutter_demo/ui/about/about_screen.dart';
import 'package:ods_flutter_demo/ui/components/components.dart';
import 'package:ods_flutter_demo/ui/components/components_screen.dart';
import 'package:ods_flutter_demo/ui/guidelines/guidelines.dart';
import 'package:ods_flutter_demo/ui/guidelines/guidelines_screen.dart';
import 'package:ods_flutter_demo/ui/modules/modules.dart';
import 'package:ods_flutter_demo/ui/modules/modules_screen.dart';

class NavigationItems {
  late final BuildContext context;
  late final l10n = context.l10n;
  late final List<OdsNavigationItem> _destinationsStatic;
  late final List<OdsNavigationRailItem> _destinationsRailStatic;
  late final List<Widget> _screens;

  NavigationItems(this.context) {
    var colorScheme = Theme.of(context).colorScheme;

    var activeColorFilter =
        ColorFilter.mode(colorScheme.primary, BlendMode.srcIn);
    var colorFilter = ColorFilter.mode(colorScheme.secondary, BlendMode.srcIn);

    _destinationsStatic = [
      OdsNavigationItem(
        context: context,
        label: l10n.bottomNavigationGuideline,
        icon: "assets/ic_guidelines_dna.svg",
      ),
      OdsNavigationItem(
        context: context,
        label: l10n.bottomNavigationComponents,
        icon: "assets/ic_components_atom.svg",
      ),
      OdsNavigationItem(
        context: context,
        label: l10n.bottomNavigationModules,
        icon: "assets/ic_modules_molecule.svg",
      ),
      OdsNavigationItem(
        context: context,
        label: l10n.bottomNavigationAbout,
        icon: "assets/ic_about_info.svg",
      ),
    ];

    _destinationsRailStatic = [
      OdsNavigationRailItem(
        context: context,
        label: l10n.bottomNavigationGuideline,
        icon: "assets/ic_guidelines_dna.svg",
      ),
      OdsNavigationRailItem(
        context: context,
        label: l10n.bottomNavigationComponents,
        icon: "assets/ic_components_atom.svg",
      ),
      OdsNavigationRailItem(
        context: context,
        label: l10n.bottomNavigationModules,
        icon: "assets/ic_modules_molecule.svg",
      ),
      OdsNavigationRailItem(
        context: context,
        label: l10n.bottomNavigationAbout,
        icon: "assets/ic_about_info.svg",
      ),
    ];
    _screens = [
      GuidelinesScreen(odsGuidelines: guidelines(l10n)),
      ComponentsScreen(odsComponents: components(l10n)),
      ModulesScreen(odsModules: modules(l10n)),
      AboutScreen(),
    ];
  }

  getSelectedMenuItem(int index) {
    return _destinationsStatic[index];
  }

  getBottomNavigationBarItems() {
    return _destinationsStatic;
  }

  getNavigationRailDestinations() {
    return _destinationsRailStatic;
  }

  getScreens(int index) {
    return _screens[index];
  }
}
