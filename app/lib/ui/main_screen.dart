import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ods_flutter_demo/ui/components/theme_selector.dart';
import 'package:provider/provider.dart';

import '../model_theme.dart';
import 'about/about_screen.dart';
import 'components/components_screen.dart';
import 'guidelines/guidelines_screen.dart';
import 'modules/modules_screen.dart';

const int mobileUiMaxScreenWidth = 500;
const int extendedNavigationRailMinScreenWidth = 600;

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    List<String> themeList = <String>[
      ThemeMode.light.toString(),
      ThemeMode.dark.toString(),
      ThemeMode.system.toString()
    ];

    // The container for the current page, with its background color
    // and subtle switching animation.
    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: selectedItem.screen,
      ),
    );

    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text(selectedItem.label),
            actions: [ThemeSelector()],
          ),
          bottomNavigationBar:
              MediaQuery.of(context).size.width < mobileUiMaxScreenWidth
                  ? BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      items: navigationItems.getBottomNavigationBarItems(),
                      currentIndex: _selectedIndex,
                      onTap: (value) {
                        setState(() {
                          _selectedIndex = value;
                        });
                      },
                    )
                  : null,
          body: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (MediaQuery.of(context).size.width >= mobileUiMaxScreenWidth)
                LayoutBuilder(builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: NavigationRail(
                          extended: MediaQuery.of(context).size.width >=
                              extendedNavigationRailMinScreenWidth,
                          destinations:
                              navigationItems.getNavigationRailDestinations(),
                          selectedIndex: _selectedIndex,
                          onDestinationSelected: (value) {
                            setState(() {
                              _selectedIndex = value;
                            });
                          },
                        ),
                      ),
                    ),
                  );
                }),
              Expanded(child: mainArea),
            ],
          ));
    });
  }
}

class _NavigationItems {
  late BuildContext context;
  late List<_MainMenuItem> _mainMenuItems;

  // TODO: 1. use theme color for activeIcon, 2. manage dark scheme
  _NavigationItems(this.context) {
    _mainMenuItems = [
      _MainMenuItem(label: 'Guidelines', screen: GuidelinesScreen()),
      _MainMenuItem(
          activeIcon: SvgPicture.asset("assets/Guideline-DNA_32.svg",
              colorFilter: ColorFilter.mode(Colors.orange, BlendMode.srcIn)),
          icon: SvgPicture.asset("assets/Guideline-DNA_32.svg"),
          label: AppLocalizations.of(context)!.bottomNavigationGuideline,
          screen: GuidelinesScreen()),
      _MainMenuItem(
          activeIcon: SvgPicture.asset("assets/component-atom_32.svg",
              colorFilter: ColorFilter.mode(Colors.orange, BlendMode.srcIn)),
          icon: SvgPicture.asset("assets/component-atom_32.svg"),
          label: AppLocalizations.of(context)!.bottomNavigationComponents,
          screen: ComponentsScreen()),
      _MainMenuItem(
          activeIcon: SvgPicture.asset("assets/Module-molecule_32.svg",
              colorFilter: ColorFilter.mode(Colors.orange, BlendMode.srcIn)),
          icon: SvgPicture.asset("assets/Module-molecule_32.svg"),
          label: AppLocalizations.of(context)!.bottomNavigationModules,
          screen: ModulesScreen()),
      _MainMenuItem(
          activeIcon: SvgPicture.asset("assets/info_32.svg",
              colorFilter: ColorFilter.mode(Colors.orange, BlendMode.srcIn)),
          icon: SvgPicture.asset("assets/info_32.svg"),
          label: AppLocalizations.of(context)!.bottomNavigationAbout,
          screen: AboutScreen()),
    ];
  }

  getSelectedMenuItem(int index) {
    return _mainMenuItems[index];
  }

  getBottomNavigationBarItems() {
    return _mainMenuItems
        .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.label))
        .toList();
  }

  getNavigationRailDestinations() {
    return _mainMenuItems
        .map((e) =>
            NavigationRailDestination(icon: e.icon, label: Text(e.label)))
        .toList();
  }
}

class _MainMenuItem {
  const _MainMenuItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.screen,
  });

  /// The icon of the menu item.
  final Widget icon;

  /// The icon of the menu item when not selected.
  final Widget activeIcon;

  /// The text label for this menu item.
  final String label;

  /// The screen launched on menu item tap.
  final Widget screen;
}
