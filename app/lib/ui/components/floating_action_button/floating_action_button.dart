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
import 'package:flutter/semantics.dart';
import 'package:ods_flutter/components/chips/ods_filter_chips.dart';
import 'package:ods_flutter/components/floating_action_button/ods_fab.dart';
import 'package:ods_flutter/components/floating_action_button/ods_fab_extended.dart';
import 'package:ods_flutter/components/floating_action_button/ods_fab_large.dart';
import 'package:ods_flutter/components/floating_action_button/ods_fab_small.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/l10n/l10n.dart';
import 'package:ods_flutter_demo/ui/components/floating_action_button/floating_action_button_enum.dart';
import 'package:ods_flutter_demo/ui/components/floating_action_button/floating_action_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentFloatingActionButton extends StatefulWidget {
  const ComponentFloatingActionButton({super.key});

  @override
  State<ComponentFloatingActionButton> createState() =>
      _ComponentFloatingActionButtonState();
}

class _ComponentFloatingActionButtonState
    extends State<ComponentFloatingActionButton> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return FloatingActionButtonCustomization(
      child: Scaffold(
          key: _scaffoldKey,
          appBar: MainAppBar(l10n.componentFloatingActionButtonTitle),
          body: _Body()),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final FloatingActionButtonCustomizationState? customizationState =
        FloatingActionButtonCustomization.of(context);

    Widget? fab;

    if (customizationState?.selectedElement ==
        FloatingActionButtonEnum.defaultFab) {
      fab = OdsFloatingActionButton(
        onClick: () {},
        icon: const Icon(Icons.add),
      );
    } else if (customizationState?.selectedElement ==
        FloatingActionButtonEnum.smallFab) {
      fab = OdsSmallFloatingActionButton(
        onClick: () {},
        icon: const Icon(Icons.add),
      );
    } else if (customizationState?.selectedElement ==
        FloatingActionButtonEnum.largeFab) {
      fab = OdsLargeFloatingActionButton(
        onClick: () {},
        icon: const Icon(Icons.add),
      );
    } else if (customizationState?.selectedElement ==
        FloatingActionButtonEnum.extendedFab) {
      fab = OdsExtendedFloatingActionButton(
        onClick: () {},
        icon: customizationState?.hasIcon == true ? Icon(Icons.add) : null,
        text: l10n.componentFloatingActionButtonSizeExtended,
      );
    }

    return Scaffold(
      bottomSheet: Semantics(
        sortKey: OrdinalSortKey(2.0),
        child: OdsSheetsBottom(
          sheetContent: _CustomizationContent(),
          title: l10n.componentCustomizeTitle,
        ),
      ),
      floatingActionButton: Semantics(
        sortKey: OrdinalSortKey(1.0),
        child: fab,
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

    final FloatingActionButtonCustomizationState? customizationState =
        FloatingActionButtonCustomization.of(context);
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(spacingM),
              child: Text(
                l10n.componentFloatingActionButtonSizeTitle,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List<Widget>.generate(4, (int index) {
                  bool isSelected = selectedIndex == index;
                  return Padding(
                    padding: EdgeInsets.only(right: spacingXs, left: spacingS),
                    child: OdsFilterChip(
                      text: customizationState?.elements[index]
                              .stringValue(l10n) ??
                          '',
                      onClick: (selected) {
                        setState(() {
                          selectedIndex = index;
                          isFiltered = selected!;
                          customizationState?.selectedElement =
                              customizationState.elements[index];
                        });
                      },
                      selected: isSelected,
                    ),
                  );
                }),
              ),
            ),
          ),
          OdsListSwitch(
            title: l10n.componentFloatingActionButtonIcon,
            checked: customizationState?.hasIcon ?? true,
            onCheckedChange: (customizationState?.selectedElement ==
                    FloatingActionButtonEnum.extendedFab)
                ? (bool value) {
                    customizationState?.hasIcon = value;
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
