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
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/navigation_bar/ods_navigation_bar.dart';
import 'package:ods_flutter/components/navigation_bar/ods_navigation_bar_item.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/l10n/l10n.dart';
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
    final l10n = context.l10n;

    return NavigationBarCustomization(
        child: Scaffold(
      bottomSheet: OdsSheetsBottom(
        sheetContent: _CustomizationContent(),
        title: l10n.componentCustomizeTitle,
      ),
      key: _scaffoldKey,
      appBar: MainAppBar(l10n.componentNavigationBarTitle),
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
    final l10n = context.l10n;

    final NavigationBarCustomizationState? customizationState =
        NavigationBarCustomization.of(context);

    List<OdsNavigationItem> navigationDestinations =
        _destinations(context).sublist(0, customizationState?.numberOfItems);

    if (selectedIndex >= navigationDestinations.length) {
      selectedIndex = navigationDestinations.length - 1;
    }

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
                  Center(child: Text(l10n.navigationBarScreenCookingPot)),
                  Center(
                      child: Text(
                    l10n.navigationBarScreenCoffee,
                  )),
                  Center(child: Text(l10n.navigationBarScreenIceCream)),
                  Center(child: Text(l10n.navigationBarScreenRestaurant)),
                  Center(child: Text(l10n.navigationBarScreenFavorites)),
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
    final l10n = context.l10n;

    final NavigationBarCustomizationState? customizationState =
        NavigationBarCustomization.of(context);
    return [
      OdsNavigationItem(
        context: context,
        label: l10n.navigationBarItemCookingPot,
        icon: "assets/recipes/ic_cooking_pot.svg",
        badge: customizationState?.hasBadge == true ? "3" : null,
      ),
      OdsNavigationItem(
        context: context,
        label: l10n.navigationBarItemCoffee,
        icon: Icon(
          Icons.coffee_sharp,
        ),
      ),
      OdsNavigationItem(
        context: context,
        label: l10n.navigationBarItemIceCream,
        icon: "assets/recipes/ic_ice_cream.svg",
      ),
      OdsNavigationItem(
        context: context,
        label: l10n.navigationBarItemRestaurant,
        icon: "assets/recipes/ic_restaurant.svg",
      ),
      OdsNavigationItem(
        context: context,
        label: l10n.navigationBarItemFavorites,
        icon: "assets/recipes/ic_heart_favorite.svg",
      ),
    ];
  }
}

// Bottom Sheet content
class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final NavigationBarCustomizationState? customizationState =
        NavigationBarCustomization.of(context);
    return Column(
      children: [
        ComponentCountRow(
            title: l10n.navigationBarItemCount,
            minCount: NavigationBarCustomizationState.minNavigationItemCount,
            maxCount: NavigationBarCustomizationState.maxNavigationItemCount,
            count: customizationState!.numberOfItems,
            onChanged: (value) {
              customizationState.numberOfItems = value;
            }),
        OdsListSwitch(
          title: l10n.navigationBarItemBadge,
          checked: customizationState.hasBadge,
          onCheckedChange: (bool value) {
            customizationState.hasBadge = value;
          },
        ),
      ],
    );
  }
}
