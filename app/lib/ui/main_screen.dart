import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/ods_flutter_localizations.dart';
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
  var _bottomNavigationBarItems = _MainScreenConfig.mainMenuItems
      .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.label))
      .toList();
  var _navigationRailDestinations = _MainScreenConfig.mainMenuItems
      .map((e) => NavigationRailDestination(icon: e.icon, label: Text(e.label)))
      .toList();

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    // The container for the current page, with its background color
    // and subtle switching animation.
    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: _MainScreenConfig.mainMenuItems[_selectedIndex].screen,
      ),
    );

    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text(_MainScreenConfig.mainMenuItems[_selectedIndex].label),
            actions: [ThemeSelector()],
          ),
          bottomNavigationBar:
              MediaQuery.of(context).size.width < mobileUiMaxScreenWidth
                  ? BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      items: _bottomNavigationBarItems,
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
                          destinations: _navigationRailDestinations,
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

class _MainScreenConfig {
  static List<_MainMenuItem> mainMenuItems = [
    _MainMenuItem(
        icon: Icon(Icons.square),
        label: 'Guidelines',
        // label: AppLocalizations.of(context)!.bottomNavigationGuideline,
        screen: GuidelinesScreen()),
    _MainMenuItem(
        icon: Icon(Icons.input),
        label: 'Components',
        // label: AppLocalizations.of(context)!.bottomNavigationComponents,
        screen: ComponentsScreen()),
    _MainMenuItem(
        icon: Icon(Icons.check_box),
        label: 'Modules',
        //label: AppLocalizations.of(context)!.bottomNavigationModules,
        screen: ModulesScreen()),
    _MainMenuItem(
        icon: Icon(Icons.favorite),
        label: 'About',
        //label: AppLocalizations.of(context)!.bottomNavigationAbout,
        screen: AboutScreen()),
  ];
}

class _MainMenuItem {
  const _MainMenuItem({
    required this.icon,
    required this.label,
    required this.screen,
  });

  /// The icon of the menu item.
  final Widget icon;

  /// The text label for this menu item.
  final String label;

  /// The screen launched on menu item tap.
  final Widget screen;
}
