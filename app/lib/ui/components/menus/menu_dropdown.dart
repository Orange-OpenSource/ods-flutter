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

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/menu/item/ods_dropdown_menu_Item.dart';
import 'package:ods_flutter/components/menu/ods_dropdown_menu.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/menus/menu_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentMenuDropdown extends StatelessWidget {
  ComponentMenuDropdown({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MenuCustomization(
      child: Scaffold(
        bottomSheet: OdsSheetsBottom(
          sheetContent: _CustomizationContent(),
          title: AppLocalizations.of(context)!.componentCustomizeTitle,
        ),
        key: _scaffoldKey,
        appBar: MainAppBar(AppLocalizations.of(context)!.componentMenuDropdown),
        body: SafeArea(child: _Body()),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final recipe =
      OdsApplication.recipes[Random().nextInt(OdsApplication.recipes.length)];

  @override
  Widget build(BuildContext context) {
    final MenuCustomizationState? customizationState =
        MenuCustomization.of(context);

    Color? colorIconEnabled = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey[600]
        : Colors.grey[400];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: spacingXxl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(spacingM),
              child: Text(
                AppLocalizations.of(context)!.componentMenuDropdownDescription,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            MergeSemantics(
              child: ListTile(
                title: Text(recipe.title,
                    style: Theme.of(context).textTheme.titleMedium),
                subtitle: Text(recipe.subtitle),
                trailing: OdsDropdownMenu(
                  items: [
                    OdsDropdownMenuItem(
                      value: OdsApplication.recipes[0].title,
                      text: OdsApplication.recipes[0].title,
                      enabled: false,
                      icon: customizationState?.hasIcon == true
                          ? SvgPicture.asset(
                              "assets/recipes/ic_cooking_pot.svg",
                              colorFilter: ColorFilter.mode(
                                  colorIconEnabled!, BlendMode.srcIn),
                            )
                          : null,
                    ),
                    OdsDropdownMenuItem(
                      value: OdsApplication.recipes[1].title,
                      text: OdsApplication.recipes[1].title,
                      icon: customizationState?.hasIcon == true
                          ? SvgPicture.asset(
                              "assets/recipes/ic_cooking_pot.svg",
                              colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.onBackground,
                                  BlendMode.srcIn),
                            )
                          : null,
                    ),
                    OdsDropdownMenuItem(
                      value: OdsApplication.recipes[2].title,
                      text: OdsApplication.recipes[2].title,
                      icon: customizationState?.hasIcon == true
                          ? SvgPicture.asset(
                              "assets/recipes/ic_restaurant.svg",
                              colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.onBackground,
                                  BlendMode.srcIn),
                            )
                          : null,
                    ),
                    OdsDropdownMenuItem(
                      value: OdsApplication.recipes[3].title,
                      text: OdsApplication.recipes[3].title,
                      icon: customizationState?.hasIcon == true
                          ? SvgPicture.asset(
                              "assets/recipes/ic_restaurant.svg",
                              colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.onBackground,
                                  BlendMode.srcIn),
                            )
                          : null,
                    ),
                    OdsDropdownMenuItem(
                      value: OdsApplication.recipes[4].title,
                      text: OdsApplication.recipes[4].title,
                      icon: customizationState?.hasIcon == true
                          ? SvgPicture.asset(
                              "assets/recipes/ic_ice_cream.svg",
                              colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.onBackground,
                                  BlendMode.srcIn),
                            )
                          : null,
                    ),
                  ],
                  selectedItem: (value) {
                    print('${recipe.title} $value');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MenuCustomizationState? customizationState =
        MenuCustomization.of(context);
    return Column(
      children: [
        OdsListSwitch(
          title: AppLocalizations.of(context)!.componentMenuIcons,
          checked: customizationState?.hasIcon ?? true,
          onCheckedChange: (bool value) {
            customizationState?.hasIcon = value;
          },
        ),
      ],
    );
  }
}
