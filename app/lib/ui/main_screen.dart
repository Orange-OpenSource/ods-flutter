import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ods_flutter/components/navigation_bar/ods_navigation_bar.dart';
import 'package:ods_flutter_demo/ui/about/about_screen.dart';
import 'package:ods_flutter_demo/ui/components/components_screen.dart';
import 'package:ods_flutter_demo/ui/guidelines/guidelines_screen.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';
import 'package:ods_flutter_demo/ui/modules/modules_screen.dart';
import 'package:ods_flutter_demo/ui/theme/model_theme.dart';
import 'package:provider/provider.dart';

import 'components/components.dart';

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

    return Consumer<ModelTheme>(
      builder: (context, ModelTheme themeNotifier, child) {
        final isLargeScreen = MediaQuery.of(context).size.width > 600;

        return Scaffold(
          appBar: MainAppBar(selectedItem.label),
          body: isLargeScreen
              ? Row(
                  children: [
                    NavigationRail(
                      selectedIndex: _selectedIndex,
                      labelType: NavigationRailLabelType.all,
                      onDestinationSelected: (int index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      destinations:
                          navigationItems.getNavigationRailDestinations(),
                    ),
                    Expanded(
                      child: IndexedStack(
                        index: _selectedIndex,
                        children: [
                          GuidelinesScreen(),
                          ComponentsScreen(odsComponents: components(context)),
                          ModulesScreen(),
                          AboutScreen(),
                        ],
                      ),
                    ),
                  ],
                )
              : <Widget>[
                  GuidelinesScreen(),
                  ComponentsScreen(odsComponents: components(context)),
                  ModulesScreen(),
                  AboutScreen(),
                ][_selectedIndex],
          bottomNavigationBar: isLargeScreen
              ? null // Don't show OdsNavigationBar for large screens
              : OdsNavigationBar(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  destinations: navigationItems.getBottomNavigationBarItems(),
                ),
        );
      },
    );
  }
}

class _NavigationItems {
  late BuildContext context;
  late List<NavigationDestination> _destinationsStatic;
  late List<NavigationRailDestination> _destinationsRailStatic;

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
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      NavigationRailDestination(
        icon: SvgPicture.asset("assets/ic_components_atom.svg",
            colorFilter: colorFilter),
        selectedIcon: SvgPicture.asset("assets/ic_components_atom.svg",
            colorFilter: activeColorFilter),
        label: Text(
          AppLocalizations.of(context)!.bottomNavigationComponents,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      NavigationRailDestination(
        icon: SvgPicture.asset("assets/ic_modules_molecule.svg",
            colorFilter: colorFilter),
        selectedIcon: SvgPicture.asset("assets/ic_modules_molecule.svg",
            colorFilter: activeColorFilter),
        label: Text(AppLocalizations.of(context)!.bottomNavigationModules,
            style: Theme.of(context).textTheme.bodyMedium),
      ),
      NavigationRailDestination(
        icon: SvgPicture.asset("assets/ic_about_info.svg",
            colorFilter: colorFilter),
        selectedIcon: SvgPicture.asset("assets/ic_about_info.svg",
            colorFilter: activeColorFilter),
        label: Text(AppLocalizations.of(context)!.bottomNavigationAbout,
            style: Theme.of(context).textTheme.bodyMedium),
      ),
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
}
