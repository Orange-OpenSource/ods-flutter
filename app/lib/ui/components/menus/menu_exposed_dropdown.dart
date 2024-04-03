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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/menu/ods_exposed_dropdown_menu.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/menus/menu_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class MenuExposedDropdown extends StatelessWidget {
  MenuExposedDropdown({super.key});

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
        appBar: MainAppBar(
            AppLocalizations.of(context)!.componentMenuExposedDropdown),
        body: SafeArea(child: _Body()),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    final MenuCustomizationState? customizationState =
        MenuCustomization.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: spacingM),
      child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 1.0,
            ),
            child: OdsExposedDropdownMenu(
              label: "Recipe",
              enabled: customizationState?.enabled == true ? true : false,
              items: <DropdownMenuEntry<String>>[
                DropdownMenuEntry<String>(
                  value: OdsApplication.recipes[0].title,
                  label: OdsApplication.recipes[0].title,
                  leadingIcon: customizationState?.hasIcon == true
                      ? SvgPicture.asset(
                          "assets/recipes/ic_cooking_pot.svg",
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.onBackground,
                              BlendMode.srcIn),
                        )
                      : null,
                ),
                DropdownMenuEntry<String>(
                  value: OdsApplication.recipes[1].title,
                  label: OdsApplication.recipes[1].title,
                  leadingIcon: customizationState?.hasIcon == true
                      ? SvgPicture.asset(
                          "assets/recipes/ic_cooking_pot.svg",
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.onBackground,
                              BlendMode.srcIn),
                        )
                      : null,
                ),
                DropdownMenuEntry<String>(
                  value: OdsApplication.recipes[2].title,
                  label: OdsApplication.recipes[2].title,
                  leadingIcon: customizationState?.hasIcon == true
                      ? SvgPicture.asset(
                          "assets/recipes/ic_restaurant.svg",
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.onBackground,
                              BlendMode.srcIn),
                        )
                      : null,
                ),
                DropdownMenuEntry<String>(
                  value: OdsApplication.recipes[3].title,
                  label: OdsApplication.recipes[3].title,
                  leadingIcon: customizationState?.hasIcon == true
                      ? SvgPicture.asset(
                          "assets/recipes/ic_restaurant.svg",
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.onBackground,
                              BlendMode.srcIn),
                        )
                      : null,
                ),
                DropdownMenuEntry<String>(
                  value: OdsApplication.recipes[4].title,
                  label: OdsApplication.recipes[4].title,
                  leadingIcon: customizationState?.hasIcon == true
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
                setState(
                  () {
                    print('$value');
                  },
                );
              },
            ),
          ),
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
          title: AppLocalizations.of(context)!.componentMenuEnabled,
          checked: customizationState?.enabled ?? true,
          onCheckedChange: (bool value) {
            customizationState?.enabled = value;
          },
        ),
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
