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
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/navigation_bar/ods_navigation_bar.dart';
import 'package:ods_flutter/components/navigation_bar/ods_navigation_bar_item.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/navigation_bar/navigation_bar_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';
import 'package:ods_flutter_demo/ui/utilities/component_count_row.dart';

class ComponentNavigationBar extends StatelessWidget {
  ComponentNavigationBar({Key? key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return NavigationBarCustomization(
        child: Scaffold(
      bottomSheet: OdsSheetsBottom(
        sheetContent: _CustomizationContent(),
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
                  Center(
                      child: Text(AppLocalizations.of(context)!
                          .navigationBarScreenCookingPot)),
                  Center(
                      child: Text(
                    AppLocalizations.of(context)!.navigationBarScreenCoffee,
                  )),
                  Center(
                      child: Text(AppLocalizations.of(context)!
                          .navigationBarScreenIceCream)),
                  Center(
                      child: Text(AppLocalizations.of(context)!
                          .navigationBarScreenRestaurant)),
                  Center(
                      child: Text(AppLocalizations.of(context)!
                          .navigationBarScreenFavorites)),
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
        icon: "assets/recipes/ic_cooking_pot.svg",
        badge: customizationState?.hasBadge == true ? "3" : null,
      ),
      OdsNavigationItem(
        context: context,
        label: AppLocalizations.of(context)!.navigationBarItemCoffee,
        icon: Icon(
          Icons.coffee_sharp,
        ),
      ),
      OdsNavigationItem(
        context: context,
        label: AppLocalizations.of(context)!.navigationBarItemIceCream,
        icon: "assets/recipes/ic_ice_cream.svg",
      ),
      OdsNavigationItem(
        context: context,
        label: AppLocalizations.of(context)!.navigationBarItemRestaurant,
        icon: "assets/recipes/ic_restaurant.svg",
      ),
      OdsNavigationItem(
        context: context,
        label: AppLocalizations.of(context)!.navigationBarItemFavorites,
        icon: "assets/recipes/ic_heart_favorite.svg",
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
        OdsListSwitch(
          title: AppLocalizations.of(context)!.navigationBarItemBadge,
          checked: customizationState.hasBadge,
          onCheckedChange: (bool value) {
            customizationState.hasBadge = value;
          },
        ),
      ],
    );
  }
}
