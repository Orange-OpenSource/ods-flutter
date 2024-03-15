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
import 'package:ods_flutter/components/button/segmented/button_icon/ods_button_icon.dart';
import 'package:ods_flutter/components/chips/ods_choice_chips.dart';
import 'package:ods_flutter/components/floating_action_button/ods_fab.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/navigation_rail/ods_navigation_rail.dart';
import 'package:ods_flutter/components/navigation_rail/ods_navigation_rail_item.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/navigation_bar/navigation_bar_customization.dart';
import 'package:ods_flutter_demo/ui/components/navigation_rail/navigation_rail_customization.dart';
import 'package:ods_flutter_demo/ui/components/navigation_rail/navigation_rail_enum.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';
import 'package:ods_flutter_demo/ui/utilities/component_count_row.dart';

class ComponentNavigationRail extends StatelessWidget {
  ComponentNavigationRail({Key? key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return NavigationRailCustomization(
        child: Scaffold(
      bottomSheet: OdsSheetsBottom(
        sheetContent: _CustomizationContent(),
        title: AppLocalizations.of(context)!.componentCustomizeTitle,
      ),
      key: _scaffoldKey,
      appBar: MainAppBar(AppLocalizations.of(context)!.componentNavigationRail),
      body: _NavRailDemo(),
    ));
  }
}

class _NavRailDemo extends StatefulWidget {
  _NavRailDemo();

  @override
  State<_NavRailDemo> createState() => _NavRailDemoState();
}

class _NavRailDemoState extends State<_NavRailDemo> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final NavigationRailCustomizationState? customizationState =
        NavigationRailCustomization.of(context);

    List<OdsNavigationRailItem> navigationDestinations =
        _destinations(context).sublist(0, customizationState?.numberOfItems);

    Widget? firstIcon;
    Widget? secondIcon;
    if (selectedIndex >= navigationDestinations.length) {
      selectedIndex = navigationDestinations.length - 1;
    }

    switch (customizationState?.selectedElement) {
      case NavigationRailsEnum.none:
        firstIcon = null;
        secondIcon = null;
        break;
      case NavigationRailsEnum.firstIcon:
        firstIcon = OdsButtonIcon(
          icon: Icon(Icons.menu),
          style: OdsButtonIconStyle
              .functionalStandard, // Optional by default OdsButtonIconStyle.functionalStandard
          isEnabled: true, // Optional by default true
          onClick: () {
            setState(() {
              print("Click");
            });
          },
        );
        secondIcon = null;
        break;
      case NavigationRailsEnum.secondIcon:
        firstIcon = OdsButtonIcon(
          icon: Icon(Icons.menu),
          style: OdsButtonIconStyle
              .functionalStandard, // Optional by default OdsButtonIconStyle.functionalStandard
          isEnabled: true, // Optional by default true
          onClick: () {
            setState(() {
              print("Click");
            });
          },
        );
        secondIcon = OdsFloatingActionButton(
          onClick: () {},
          icon: const Icon(Icons.person),
          semanticsLabel: 'Add', //Optional
        );
        break;
    }

    return Row(
      children: <Widget>[
        OdsNavigationRail(
          selectedIndex: selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          leadingIconFirst: firstIcon,
          leadingIconSecond: secondIcon,
          destinations: navigationDestinations,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                getScreen(selectedIndex),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String getScreen(int number) {
    switch (number) {
      case 0:
        return "Cooking";
      case 1:
        return "Coffee";
      case 2:
        return "Ice Cream";
      case 3:
        return "Restaurant";
      case 4:
        return "Favorites";
      default:
        return "";
    }
  }

  List<OdsNavigationRailItem> _destinations(BuildContext context) {
    final NavigationRailCustomizationState? customizationState =
        NavigationRailCustomization.of(context);
    return [
      OdsNavigationRailItem(
        context: context,
        label: AppLocalizations.of(context)!.navigationBarItemCookingPot,
        icon: "assets/recipes/ic_cooking_pot.svg",
        badge: customizationState?.hasBadge == true ? "3" : null,
      ),
      OdsNavigationRailItem(
        context: context,
        label: AppLocalizations.of(context)!.navigationBarItemCoffee,
        icon: Icon(
          Icons.coffee_sharp,
        ),
      ),
      OdsNavigationRailItem(
        context: context,
        label: AppLocalizations.of(context)!.navigationBarItemIceCream,
        icon: "assets/recipes/ic_ice_cream.svg",
      ),
      OdsNavigationRailItem(
        context: context,
        label: AppLocalizations.of(context)!.navigationBarItemRestaurant,
        icon: "assets/recipes/ic_restaurant.svg",
      ),
      OdsNavigationRailItem(
        context: context,
        label: AppLocalizations.of(context)!.navigationBarItemFavorites,
        icon: "assets/recipes/ic_heart_favorite.svg",
      ),
    ];
  }
}

/// Bottom Sheet content
class _CustomizationContent extends StatefulWidget {
  @override
  State<_CustomizationContent> createState() => _CustomizationContentState();
}

class _CustomizationContentState extends State<_CustomizationContent> {
  @override
  Widget build(BuildContext context) {
    final NavigationRailCustomizationState? customizationState =
        NavigationRailCustomization.of(context);
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
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(spacingM),
            child: Text(
              AppLocalizations.of(context)!.componentLeading,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List<Widget>.generate(
                customizationState.elements.length,
                (int index) {
                  NavigationRailsEnum currentElement =
                      customizationState.elements[index];
                  bool isSelected =
                      currentElement == customizationState.selectedElement;
                  return Padding(
                    padding: EdgeInsets.only(right: spacingXs, left: spacingS),
                    child: OdsChoiceChip(
                      text: customizationState.elements[index]
                          .stringValue(context),
                      selected: isSelected,
                      onClick: (selected) {
                        setState(
                          () {
                            FocusScope.of(context).unfocus();
                            customizationState.selectedElement =
                                customizationState.elements[index];
                            Future.delayed(Duration(milliseconds: 100))
                                .then((value) {
                              FocusScope.of(context).requestFocus();
                            });
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
