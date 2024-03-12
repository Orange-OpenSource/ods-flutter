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
import 'package:ods_flutter/components/button/ods_text_button.dart';
import 'package:ods_flutter/components/card/ods_cards_common.dart';
import 'package:ods_flutter/components/card/ods_vertical_image_first_card.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/l10n/l10n.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';
import 'package:ods_flutter_demo/ui/utilities/component_count_row.dart';

class CardVerticalImageFirst extends StatefulWidget {
  const CardVerticalImageFirst({super.key});

  @override
  State<CardVerticalImageFirst> createState() => _CardVerticalImageFirstState();
}

class _CardVerticalImageFirstState extends State<CardVerticalImageFirst> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CardCustomization(
      child: Scaffold(
          bottomSheet: OdsSheetsBottom(
            sheetContent: _CustomizationContent(),
            title: l10n.componentCustomizeTitle,
          ),
          key: _scaffoldKey,
          appBar: MainAppBar(l10n.cardVerticalImageFirstVariantTitle),
          body: _Body()),
    );
  }
}

class _Body extends StatelessWidget {
  var recipe =
      OdsApplication.recipes[Random().nextInt(OdsApplication.recipes.length)];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final CardCustomizationState? customizationState =
        CardCustomization.of(context);

    List<Widget> listButtons = [
      OdsTextButton(
        text: l10n.componentElementButton2,
        style: OdsTextButtonStyle.functionalPrimary,
        onClick: () {},
      ),
      OdsTextButton(
        text: l10n.componentElementButton2,
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: spacingM, bottom: 91),
            child: OdsVerticalImageFirstCard(
              image: OdsCardImage(
                imageProvider: NetworkImage(recipe.url),
                contentDescription: '', //Optional
                alignment: Alignment.center,
                contentScale: BoxFit.cover,
              ),
              title: recipe.title,
              subtitle: customizationState?.hasSubtitle == true
                  ? recipe.subtitle
                  : null,
              text: customizationState?.hasText == true
                  ? recipe.description
                  : null,
              firstButton: firstButton,
              secondButton: secondButton,
              onClick: customizationState!.clickable ? () {} : null,
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomizationContent extends StatefulWidget {
  @override
  State<_CustomizationContent> createState() => _CustomizationContentState();
}

class _CustomizationContentState extends State<_CustomizationContent> {
  int selectedIndex = 0;
  bool isFiltered = true;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final CardCustomizationState? customizationState =
        CardCustomization.of(context);
    return SafeArea(
      child: Column(
        children: [
          OdsListSwitch(
              title: l10n.componentCardClickable,
              checked: customizationState?.clickable ?? true,
              onCheckedChange: (bool value) {
                customizationState?.clickable = value;
              }),
          OdsListSwitch(
              title: l10n.componentElementSubtitle,
              checked: customizationState?.hasSubtitle ?? true,
              onCheckedChange: (bool value) {
                customizationState?.hasSubtitle = value;
              }),
          OdsListSwitch(
              title: l10n.componentElementText,
              checked: customizationState?.hasText ?? true,
              onCheckedChange: (bool value) {
                customizationState?.hasText = value;
              }),
          ComponentCountRow(
              title: l10n.componentCardActionButtonCount,
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
