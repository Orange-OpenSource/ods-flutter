import 'package:flutter/material.dart';

import 'about/about_screen.dart';
import 'components/components_screen.dart';
import 'guidelines/guidelines_screen.dart';
import 'modules/modules_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GuidelinesScreen();
        break;
      case 1:
        page = ComponentsScreen();
        break;
      case 2:
        page = ModulesScreen();
        break;
      case 3:
        page = AboutScreen();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // The container for the current page, with its background color
    // and subtle switching animation.
    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: page,
      ),
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            // Use a more mobile-friendly layout with BottomNavigationBar
            // on narrow screens.
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.square),
                        label: 'Guidelines',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.input),
                        label: 'Components',
                      ),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.check_box), label: 'Modules'),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite),
                        label: 'About',
                      ),
                    ],
                    currentIndex: selectedIndex,
                    onTap: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                )
              ],
            );
          } else {
            return Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.square),
                        label: Text('Buttons'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.input),
                        label: Text('Input and Selections'),
                      ),
                      NavigationRailDestination(
                          icon: Icon(Icons.check_box),
                          label: Text('Information displays')),
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.favorite),
                        label: Text('Favorites'),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
  }
}
