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
import 'package:ods_flutter/components/app_bar/top/ods_top_app_bar.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter_demo/l10n/l10n.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/app_bars/top/top_app_bars_customization.dart';
import 'package:ods_flutter_demo/ui/theme/theme_selector.dart';
import 'package:ods_flutter_demo/ui/utilities/component_count_row.dart';

class ComponentTopAppBars extends StatefulWidget {
  const ComponentTopAppBars({super.key});
  @override
  State<ComponentTopAppBars> createState() => _ComponentTopAppBarsState();
}

class _ComponentTopAppBarsState extends State<ComponentTopAppBars> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ComponentTopAppBarsCustomization(
      child: Scaffold(
          bottomSheet: OdsSheetsBottom(
            sheetContent: _CustomizationContent(),
            title: l10n.componentCustomizeTitle,
          ),
          key: _scaffoldKey,
          body: _Body()),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final ComponentTopAppBarsCustomizationState? customizationState =
        ComponentTopAppBarsCustomization.of(context);

    final actions = [
      IconButton(icon: const Icon(Icons.color_lens), onPressed: () {}),
      IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
      ThemeSelector(),
      PopupMenuButton<String>(
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          for (var recipe in OdsApplication.recipes)
            PopupMenuItem<String>(
              value: recipe.title,
              child: Text(recipe.title),
            ),
        ],
        onSelected: (String? value) {
          if (value != null) {
            final snackBar = SnackBar(
              content: Text('Click on $value'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
      ),
    ];

    return Semantics(
      child: Scaffold(
        appBar: OdsAppTopBar(
          title: l10n.componentAppBarsTopRegular,
          actions: actions.sublist(0, customizationState?.numberOfItems),
          navigationIcon:
              customizationState?.navigationIcon == true ? BackButton() : null,
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            final itemNumber = index.toString();
            return ListTile(
              title: Text(
                'Item #$itemNumber',
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final ComponentTopAppBarsCustomizationState? customizationState =
        ComponentTopAppBarsCustomization.of(context);
    return Column(
      children: [
        OdsListSwitch(
            title: l10n.componentAppTopBarsNavigationIcon,
            checked: customizationState?.navigationIcon ?? true,
            onCheckedChange: (bool value) {
              customizationState?.navigationIcon = value;
            }),
        ComponentCountRow(
            title: l10n.componentAppTopBarsActionCount,
            minCount:
                ComponentTopAppBarsCustomizationState.minNavigationItemCount,
            maxCount:
                ComponentTopAppBarsCustomizationState.maxNavigationItemCount,
            count: customizationState!.numberOfItems,
            onChanged: (value) {
              customizationState.numberOfItems = value;
            })
      ],
    );
  }
}
