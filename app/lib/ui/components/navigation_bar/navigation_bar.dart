import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/navigation_bar/ods_navigation_bar.dart';
import 'package:ods_flutter/components/navigation_bar/ods_navigation_bar_item.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/navigation_bar/navigation_bar_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';
import 'package:ods_flutter_demo/ui/utilities/component_count_row.dart';

class ComponentNavigationBar extends StatefulWidget {
  const ComponentNavigationBar({Key? key}) : super(key: key);

  @override
  State<ComponentNavigationBar> createState() => _ComponentNavigationBarState();
}

class _ComponentNavigationBarState extends State<ComponentNavigationBar> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBarCustomization(
        child: Scaffold(
      bottomSheet: OdsSheetsBottom(
        content: _CustomizationContent(),
        title: AppLocalizations.of(context)!.componentCustomizeTitle,
      ),
      key: _scaffoldKey,
      appBar:
          MainAppBar(AppLocalizations.of(context)!.componentNavigationBarTitle),
      body: _NavBarDemo(),
    ));
  }
}

class _NavBarDemo extends StatefulWidget {
  _NavBarDemo();

  @override
  State<_NavBarDemo> createState() => _NavBarDemoState();
}

class _NavBarDemoState extends State<_NavBarDemo> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final NavigationBarCustomizationState? customizationState =
        NavigationBarCustomization.of(context);

    List<OdsNavigationItem> navigationDestinations =
        _destinations(context).sublist(0, customizationState?.numberOfItems);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Screens for each navigation destination
            SizedBox(
              height: 110,
              child: IndexedStack(
                index: selectedIndex,
                children: [
                  Center(child: Text('Cooking Pot Screen')),
                  Center(child: Text('Coffee Screen')),
                  Center(child: Text('Ice Cream Screen')),
                  Center(child: Text('Restaurant Screen')),
                  Center(child: Text('Favorites Screen')),
                ],
              ),
            ),

            /// Navigation Bar icon
            Padding(
              padding: const EdgeInsets.all(spacingXs),
              child: Align(
                alignment: Alignment.center,
                child: OdsNavigationBar(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  destinations: navigationDestinations,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<OdsNavigationItem> _destinations(BuildContext context) {
    final NavigationBarCustomizationState? customizationState =
        NavigationBarCustomization.of(context);
    return [
      OdsNavigationItem(
        context: context,
        label: AppLocalizations.of(context)!.navigationBarItemCookingPot,
        odsBottomNavigationItemIcon: OdsBottomNavigationItemIcon(
            icon: "assets/recipes/ic_cooking_pot.svg",
            type: IconType.svg,
            badge: customizationState?.hasBadge == true ? "3" : null),
      ),
      OdsNavigationItem(
        context: context,
        label: AppLocalizations.of(context)!.navigationBarItemCoffee,
        odsBottomNavigationItemIcon: OdsBottomNavigationItemIcon(
          icon: Icon(Icons.coffee_sharp),
          type: IconType.icon,
        ),
      ),
      OdsNavigationItem(
        context: context,
        label: AppLocalizations.of(context)!.navigationBarItemIceCream,
        odsBottomNavigationItemIcon: OdsBottomNavigationItemIcon(
          icon: "assets/recipes/ic_ice_cream.svg",
          type: IconType.svg,
        ),
      ),
      OdsNavigationItem(
        context: context,
        label: AppLocalizations.of(context)!.navigationBarItemRestaurant,
        odsBottomNavigationItemIcon: OdsBottomNavigationItemIcon(
          icon: "assets/recipes/ic_restaurant.svg",
          type: IconType.svg,
        ),
      ),
      OdsNavigationItem(
        context: context,
        label: AppLocalizations.of(context)!.navigationBarItemFavorites,
        odsBottomNavigationItemIcon: OdsBottomNavigationItemIcon(
          icon: "assets/recipes/ic_heart_favorite.svg",
          type: IconType.svg,
        ),
      ),
    ];
  }
}

// Bottom Sheet content
class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavigationBarCustomizationState? customizationState =
        NavigationBarCustomization.of(context);
    return Column(
      children: [
        ComponentCountRow(
            title: AppLocalizations.of(context)!.navigationBarItemCount,
            minCount: NavigationBarCustomizationState.minNavigationItemCount,
            maxCount: NavigationBarCustomizationState.maxNavigationItemCount,
            count: customizationState!.numberOfItems,
            onChanged: (value) {
              customizationState.numberOfItems = value;
            }),
        SwitchListTile(
          value: customizationState.hasBadge,
          title: Text(AppLocalizations.of(context)!.componentCustomizeIcon),
          onChanged: (bool value) {
            customizationState.hasBadge = value;
          },
        ),
      ],
    );
  }
}
