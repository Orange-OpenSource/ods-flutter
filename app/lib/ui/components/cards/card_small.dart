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
import 'package:ods_flutter/components/card/ods_cards_common.dart';
import 'package:ods_flutter/components/card/ods_small_card.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class CardSmall extends StatefulWidget {
  const CardSmall({super.key});

  @override
  State<CardSmall> createState() => _CardSmallState();
}

class _CardSmallState extends State<CardSmall> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CardCustomization(
      child: Scaffold(
          bottomSheet: OdsSheetsBottom(
            sheetContent: _CustomizationContent(),
            title: AppLocalizations.of(context)!.componentCustomizeTitle,
          ),
          key: _scaffoldKey,
          appBar:
              MainAppBar(AppLocalizations.of(context)!.cardSmallVariantTitle),
          body: SafeArea(child: _Body())),
    );
  }
}

class _Body extends StatelessWidget {
  var recipe =
      OdsApplication.recipes[Random().nextInt(OdsApplication.recipes.length)];

  @override
  Widget build(BuildContext context) {
    final CardCustomizationState? customizationState =
        CardCustomization.of(context);

    return OrientationBuilder(
      builder: (context, orientation) {
        return GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          childAspectRatio: orientation == Orientation.portrait ? 0.9 : 1.1,
          children: [
            Padding(
              padding: const EdgeInsets.all(spacingM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OdsSmallCard(
                    title: recipe.title,
                    subtitle: customizationState?.hasSubtitle == true
                        ? recipe.subtitle
                        : null,
                    image: OdsCardImage(
                      imageProvider: NetworkImage(recipe.url),
                      contentDescription: '', //Optional
                      alignment: Alignment.center,
                      contentScale: BoxFit.cover,
                    ),
                    onTap: customizationState!.clickable ? () {} : null,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CardCustomizationState? customizationState =
        CardCustomization.of(context);
    return Column(
      children: [
        OdsListSwitch(
            title: AppLocalizations.of(context)!.componentCardClickable,
            checked: customizationState?.clickable ?? true,
            onCheckedChange: (bool value) {
              customizationState?.clickable = value;
            }),
        OdsListSwitch(
            title: AppLocalizations.of(context)!.componentElementSubtitle,
            checked: customizationState?.hasSubtitle ?? true,
            onCheckedChange: (bool value) {
              customizationState?.hasSubtitle = value;
            })
      ],
    );
  }
}
