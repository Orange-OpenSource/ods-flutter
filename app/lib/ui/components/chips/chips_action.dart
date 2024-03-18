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
import 'package:flutter_svg/svg.dart';
import 'package:ods_flutter/components/app_bar/top/ods_top_app_bar.dart';
import 'package:ods_flutter/components/chips/ods_action_chips.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/l10n/l10n.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/chips/chips_customization.dart';
import 'package:ods_flutter_demo/ui/theme/theme_selector.dart';

class ComponentChipsAction extends StatefulWidget {
  const ComponentChipsAction({super.key});
  @override
  State<ComponentChipsAction> createState() => _ComponentChipsActionState();
}

class _ComponentChipsActionState extends State<ComponentChipsAction> {
  bool isFiltered = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ChipsCustomization(
      child: Scaffold(
        bottomSheet: OdsSheetsBottom(
          sheetContent: _CustomizationContent(),
          title: l10n.componentCustomizeTitle,
        ),
        appBar: OdsAppTopBar(
            title: l10n.componentChipAction,
            actions: [ThemeSelector()],
            navigationIcon: BackButton()),
        body: SafeArea(child: _Body()),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final ChipsCustomizationState? customizationState =
        ChipsCustomization.of(context);
    var colorScheme = Theme.of(context).colorScheme;
    var colorFilter = ColorFilter.mode(colorScheme.secondary, BlendMode.srcIn);
    return Padding(
      padding:
          const EdgeInsets.only(left: spacingS, right: spacingM, top: spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.componentChipActionDescription,
              style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: spacingM),
          OdsActionChip(
            text: OdsApplication.recipes[0].title,
            leadingIcon: SvgPicture.asset("assets/recipes/ic_cooking_pot.svg",
                colorFilter: colorFilter),
            onClick: () {},
            enabled: customizationState?.hasEnabled == false ? false : true,
          ),
        ],
      ),
    );
  }
}

class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final ChipsCustomizationState? customizationState =
        ChipsCustomization.of(context);
    return Column(
      children: [
        OdsListSwitch(
            title: l10n.componentChipsEnabled,
            checked: customizationState?.hasEnabled ?? true,
            onCheckedChange: (bool value) {
              customizationState?.hasEnabled = value;
            }),
      ],
    );
  }
}
