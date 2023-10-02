import 'package:flutter/material.dart';
import 'package:ods_flutter/components/navigation_bar/ods_tab.dart';
import 'package:ods_flutter_demo/ui/utilities/navigation_items.dart';

import 'main_app_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var navigationItems = NavigationItems(context);
    var selectedItem = navigationItems.getSelectedMenuItem(_selectedIndex);

    return Scaffold(
      appBar: MainAppBar(selectedItem.label),
      bottomNavigationBar: MediaQuery.of(context).size.width < 640
          ? OdsTab(
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
              destinations: navigationItems.getNavigationRailDestinations(),
              labelType: NavigationRailLabelType.all,
              // Called when one tab is selected,
            ),
          Expanded(
            child: navigationItems.getScreens(_selectedIndex),
          ),
        ],
      ),
    );
  }
}
