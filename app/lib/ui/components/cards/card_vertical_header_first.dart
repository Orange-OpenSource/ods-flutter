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
import 'package:ods_flutter/components/button/ods_text_button.dart';
import 'package:ods_flutter/components/card/ods_cards_common.dart';
import 'package:ods_flutter/components/card/ods_vertical_header_first_card.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';
import 'package:ods_flutter_demo/ui/utilities/component_count_row.dart';

class CardVerticalHeaderFirst extends StatelessWidget {
  CardVerticalHeaderFirst({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return CardCustomization(
      child: Scaffold(
          bottomSheet: OdsSheetsBottom(
            sheetContent: _CustomizationContent(),
            title: AppLocalizations.of(context)!.componentCustomizeTitle,
          ),
          key: _scaffoldKey,
          appBar: MainAppBar(
              AppLocalizations.of(context)!.componentCardVerticalHeaderFirst),
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

    List<Widget> listButtons = [
      OdsTextButton(
        text: AppLocalizations.of(context)!.componentElementButton1,
        style: OdsTextButtonStyle.functionalPrimary,
        onClick: () {},
      ),
      OdsTextButton(
        text: AppLocalizations.of(context)!.componentElementButton2,
        style: OdsTextButtonStyle.functionalPrimary,
        onClick: () {},
      ),
    ];

    List<Widget> buttons =
        listButtons.sublist(0, customizationState?.numberOfItems);

    OdsTextButton? firstButton;
    OdsTextButton? secondButton;

    if (buttons.isNotEmpty) {
      firstButton = buttons[0] as OdsTextButton;
    }
    if (buttons.length > 1) {
      secondButton = buttons[1] as OdsTextButton;
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
            top: spacingM, bottom: 91, left: spacingM, right: spacingM),
        child: OdsVerticalHeaderFirstCard(
          thumbnail: customizationState!.thumbnail
              ? OdsCardThumbnail(
                  imageProvider: NetworkImage(recipe.url),
                  contentDescription: '', //Optional
                  alignment: Alignment.center,
                  contentScale: BoxFit.cover,
                )
              : null,
          title: recipe.title,
          subtitle:
              customizationState.hasSubtitle == true ? recipe.subtitle : null,
          text: customizationState.hasText == true ? recipe.description : null,
          image: OdsCardImage(
            imageProvider: NetworkImage(recipe.url),
            contentDescription: '', //Optional
            alignment: Alignment.center,
            contentScale: BoxFit.cover,
          ),
          firstButton: firstButton,
          secondButton: secondButton,
          onClick: customizationState.clickable ? () {} : null,
        ),
      ),
    );
  }
}

class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CardCustomizationState? customizationState =
        CardCustomization.of(context);
    return SafeArea(
      child: Column(
        children: [
          OdsListSwitch(
              title: AppLocalizations.of(context)!.componentCardClickable,
              checked: customizationState?.clickable ?? true,
              onCheckedChange: (bool value) {
                customizationState?.clickable = value;
              }),
          OdsListSwitch(
              title: AppLocalizations.of(context)!
                  .componentCardVerticalHeaderFirstThumbnail,
              checked: customizationState?.thumbnail ?? true,
              onCheckedChange: (bool value) {
                customizationState?.thumbnail = value;
              }),
          OdsListSwitch(
              title: AppLocalizations.of(context)!.componentElementSubtitle,
              checked: customizationState?.hasSubtitle ?? true,
              onCheckedChange: (bool value) {
                customizationState?.hasSubtitle = value;
              }),
          OdsListSwitch(
              title: AppLocalizations.of(context)!.componentElementText,
              checked: customizationState?.hasText ?? true,
              onCheckedChange: (bool value) {
                customizationState?.hasText = value;
              }),
          ComponentCountRow(
              title:
                  AppLocalizations.of(context)!.componentCardActionButtonCount,
              minCount: CardCustomizationState.minNavigationItemCount,
              maxCount: CardCustomizationState.maxNavigationItemCount,
              count: customizationState!.numberOfItems,
              onChanged: (value) {
                customizationState.numberOfItems = value;
              }),
        ],
      ),
    );
  }
}
