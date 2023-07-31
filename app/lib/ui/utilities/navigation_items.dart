import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ods_flutter_demo/ui/about/about_screen.dart';
import 'package:ods_flutter_demo/ui/components/components.dart';
import 'package:ods_flutter_demo/ui/components/components_screen.dart';
import 'package:ods_flutter_demo/ui/guidelines/guidelines.dart';
import 'package:ods_flutter_demo/ui/guidelines/guidelines_screen.dart';
import 'package:ods_flutter_demo/ui/modules/modules_screen.dart';

class NavigationItems {
  late BuildContext context;
  late List<NavigationDestination> _destinationsStatic;
  late List<NavigationRailDestination> _destinationsRailStatic;
  late List<Widget> _screens;

  NavigationItems(this.context) {
    var colorScheme = Theme.of(context).colorScheme;

    var activeColorFilter =
        ColorFilter.mode(colorScheme.primary, BlendMode.srcIn);
    var colorFilter = ColorFilter.mode(colorScheme.secondary, BlendMode.srcIn);

    _destinationsStatic = [
      NavigationDestination(
        tooltip: '',
        icon: SvgPicture.asset("assets/ic_guidelines_dna.svg",
            colorFilter: colorFilter),
        selectedIcon: SvgPicture.asset("assets/ic_guidelines_dna.svg",
            colorFilter: activeColorFilter),
        label: AppLocalizations.of(context)!.bottomNavigationGuideline,
      ),
      NavigationDestination(
        tooltip: '',
        icon: SvgPicture.asset("assets/ic_components_atom.svg",
            colorFilter: colorFilter),
        selectedIcon: SvgPicture.asset("assets/ic_components_atom.svg",
            colorFilter: activeColorFilter),
        label: AppLocalizations.of(context)!.bottomNavigationComponents,
      ),
      NavigationDestination(
        tooltip: '',
        icon: SvgPicture.asset("assets/ic_modules_molecule.svg",
            colorFilter: colorFilter),
        selectedIcon: SvgPicture.asset("assets/ic_modules_molecule.svg",
            colorFilter: activeColorFilter),
        label: AppLocalizations.of(context)!.bottomNavigationModules,
      ),
      NavigationDestination(
        tooltip: '',
        icon: SvgPicture.asset("assets/ic_about_info.svg",
            colorFilter: colorFilter),
        selectedIcon: SvgPicture.asset("assets/ic_about_info.svg",
            colorFilter: activeColorFilter),
        label: AppLocalizations.of(context)!.bottomNavigationAbout,
      ),
    ];
    _destinationsRailStatic = [
      NavigationRailDestination(
        icon: SvgPicture.asset("assets/ic_guidelines_dna.svg",
            colorFilter: colorFilter),
        selectedIcon: SvgPicture.asset("assets/ic_guidelines_dna.svg",
            colorFilter: activeColorFilter),
        label: Text(
          AppLocalizations.of(context)!.bottomNavigationGuideline,
        ),
      ),
      NavigationRailDestination(
        icon: SvgPicture.asset("assets/ic_components_atom.svg",
            colorFilter: colorFilter),
        selectedIcon: SvgPicture.asset("assets/ic_components_atom.svg",
            colorFilter: activeColorFilter),
        label: Text(AppLocalizations.of(context)!.bottomNavigationComponents),
      ),
      NavigationRailDestination(
        icon: SvgPicture.asset("assets/ic_modules_molecule.svg",
            colorFilter: colorFilter),
        selectedIcon: SvgPicture.asset("assets/ic_modules_molecule.svg",
            colorFilter: activeColorFilter),
        label: Text(AppLocalizations.of(context)!.bottomNavigationModules),
      ),
      NavigationRailDestination(
        icon: SvgPicture.asset("assets/ic_about_info.svg",
            colorFilter: colorFilter),
        selectedIcon: SvgPicture.asset("assets/ic_about_info.svg",
            colorFilter: activeColorFilter),
        label: Text(AppLocalizations.of(context)!.bottomNavigationAbout),
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
