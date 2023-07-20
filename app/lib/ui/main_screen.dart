import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ods_flutter/components/navigation_bar/ods_navigation_bar.dart';
import 'package:ods_flutter_demo/ui/about/about_screen.dart';
import 'package:ods_flutter_demo/ui/components/components.dart';
import 'package:ods_flutter_demo/ui/guidelines/guidelines_screen.dart';
import 'package:ods_flutter_demo/ui/modules/modules_screen.dart';

import 'components/components_screen.dart';
import 'main_app_bar.dart';

const int extendedNavigationRailMinScreenWidth = 600;

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var navigationItems = _NavigationItems(context);
    var selectedItem = navigationItems.getSelectedMenuItem(_selectedIndex);

    return Scaffold(
      appBar: MainAppBar(selectedItem.label),
      bottomNavigationBar: MediaQuery.of(context).size.width < 640
          ? OdsNavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: navigationItems.getBottomNavigationBarItems(),
            )
          : null,
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >= 640)
            NavigationRail(
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              selectedIndex: _selectedIndex,
              destinations: navigationItems._destinationsRailStatic,
              labelType: NavigationRailLabelType.all,
              // Called when one tab is selected,
            ),
          Expanded(child: navigationItems._screens[_selectedIndex])
        ],
      ),
    );
  }
}

class _NavigationItems {
  late BuildContext context;
  late List<NavigationDestination> _destinationsStatic;
  late List<NavigationRailDestination> _destinationsRailStatic;
  late List<Widget> _screens;

  _NavigationItems(this.context) {
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
      GuidelinesScreen(),
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

  getScreens() {
    return _screens;
  }
}
