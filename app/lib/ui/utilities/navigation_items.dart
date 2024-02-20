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
import 'package:ods_flutter/components/navigation_bar/ods_navigation_bar_item.dart';
import 'package:ods_flutter/components/navigation_rail/ods_navigation_rail_item.dart';
import 'package:ods_flutter_demo/ui/about/about_screen.dart';
import 'package:ods_flutter_demo/ui/components/components.dart';
import 'package:ods_flutter_demo/ui/components/components_screen.dart';
import 'package:ods_flutter_demo/ui/guidelines/guidelines.dart';
import 'package:ods_flutter_demo/ui/guidelines/guidelines_screen.dart';
import 'package:ods_flutter_demo/ui/modules/modules_screen.dart';

class NavigationItems {
  late BuildContext context;
  late List<OdsNavigationItem> _destinationsStatic;
  late List<OdsNavigationRailItem> _destinationsRailStatic;
  late List<Widget> _screens;

  NavigationItems(this.context) {
    var colorScheme = Theme.of(context).colorScheme;

    var activeColorFilter =
        ColorFilter.mode(colorScheme.primary, BlendMode.srcIn);
    var colorFilter = ColorFilter.mode(colorScheme.secondary, BlendMode.srcIn);

    _destinationsStatic = [
      OdsNavigationItem(
        context: context,
        label: AppLocalizations.of(context)!.bottomNavigationGuideline,
        icon: "assets/ic_guidelines_dna.svg",
      ),
      OdsNavigationItem(
        context: context,
        label: AppLocalizations.of(context)!.bottomNavigationComponents,
        icon: "assets/ic_components_atom.svg",
      ),
      OdsNavigationItem(
        context: context,
        label: AppLocalizations.of(context)!.bottomNavigationModules,
        icon: "assets/ic_modules_molecule.svg",
      ),
      OdsNavigationItem(
        context: context,
        label: AppLocalizations.of(context)!.bottomNavigationAbout,
        icon: "assets/ic_about_info.svg",
      ),
    ];

    _destinationsRailStatic = [
      OdsNavigationRailItem(
        context: context,
        label: AppLocalizations.of(context)!.bottomNavigationGuideline,
        icon: "assets/ic_guidelines_dna.svg",
      ),
      OdsNavigationRailItem(
        context: context,
        label: AppLocalizations.of(context)!.bottomNavigationComponents,
        icon: "assets/ic_components_atom.svg",
      ),
      OdsNavigationRailItem(
        context: context,
        label: AppLocalizations.of(context)!.bottomNavigationModules,
        icon: "assets/ic_modules_molecule.svg",
      ),
      OdsNavigationRailItem(
        context: context,
        label: AppLocalizations.of(context)!.bottomNavigationAbout,
        icon: "assets/ic_about_info.svg",
      ),
    ];
    _screens = [
      GuidelinesScreen(odsGuidelines: guidelines(context)),
      ComponentsScreen(odsComponents: components(context)),
      ModulesScreen(),
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
