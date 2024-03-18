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
import 'package:ods_flutter/components/app_bar/top/ods_top_app_bar.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/components/sliders/ods_slider.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/sliders/sliders_customization.dart';
import 'package:ods_flutter_demo/ui/theme/theme_selector.dart';

class ComponentSliders extends StatelessWidget {
  const ComponentSliders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidersCustomization(
      child: Scaffold(
        bottomSheet: OdsSheetsBottom(
          sheetContent: _CustomizationContent(),
          title: AppLocalizations.of(context)!.componentCustomizeTitle,
        ),
        appBar: OdsAppTopBar(
            title: AppLocalizations.of(context)!.componentSlidersTitle,
            actions: [ThemeSelector()],
            navigationIcon: BackButton()),
        body: SafeArea(child: _Body()),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final value = 20.0;

  @override
  Widget build(BuildContext context) {
    final SlidersCustomizationState? customizationState =
        SlidersCustomization.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
            left: spacingXs,
            right: spacingXs,
            top: spacingXl,
            bottom: spacingXs),
        child: OdsSlider(
          value: value,
          steps: customizationState?.stepped == true ? 10 : null,
          displayValue: customizationState?.displayValue == true
              ? value.round().toString()
              : null,
          startIcon: customizationState?.hasIcon == true
              ? Icon(Icons.volume_mute)
              : null,
          endIcon: customizationState?.hasIcon == true
              ? Icon(Icons.volume_up)
              : null,
        ),
      ),
    );
  }
}

class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SlidersCustomizationState? customizationState =
        SlidersCustomization.of(context);
    return Column(
      children: [
        OdsListSwitch(
          title: AppLocalizations.of(context)!.componentSlidersCustomizeIcon,
          checked: customizationState?.hasIcon ?? true,
          onCheckedChange: (bool value) {
            if (customizationState != null) {
              customizationState.hasIcon = value;
            }
          },
        ),
        OdsListSwitch(
          title: AppLocalizations.of(context)!
              .componentSlidersCustomizeDisplayValue,
          checked: customizationState?.displayValue ?? true,
          onCheckedChange: (bool value) {
            if (customizationState != null) {
              customizationState.displayValue = value;
            }
          },
        ),
        OdsListSwitch(
          title: AppLocalizations.of(context)!.componentCustomizeSlidersStepped,
          checked: customizationState?.stepped ?? true,
          onCheckedChange: (bool value) {
            if (customizationState != null) {
              customizationState.stepped = value;
            }
          },
        ),
      ],
    );
  }
}
