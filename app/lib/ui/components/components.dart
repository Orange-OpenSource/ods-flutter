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

import 'package:ods_flutter_demo/l10n/gen/ods_flutter_app_localizations.dart';
import 'package:ods_flutter_demo/ui/components/app_bars/top/top_app_bar_large.dart';
import 'package:ods_flutter_demo/ui/components/app_bars/top/top_app_bars.dart';
import 'package:ods_flutter_demo/ui/components/buttons/button_contained.dart';
import 'package:ods_flutter_demo/ui/components/buttons/button_outlined.dart';
import 'package:ods_flutter_demo/ui/components/buttons/button_text.dart';
import 'package:ods_flutter_demo/ui/components/buttons/buttons_icon/button_icon.dart';
import 'package:ods_flutter_demo/ui/components/buttons/segmented/segmented_button.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_horizontal.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_small.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_vertical_header_first.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_vertical_image_first.dart';
import 'package:ods_flutter_demo/ui/components/checkboxes/checkboxes.dart';
import 'package:ods_flutter_demo/ui/components/chips/chips_action.dart';
import 'package:ods_flutter_demo/ui/components/chips/chips_choice.dart';
import 'package:ods_flutter_demo/ui/components/chips/chips_filter.dart';
import 'package:ods_flutter_demo/ui/components/chips/chips_input.dart';
import 'package:ods_flutter_demo/ui/components/component_entities.dart';
import 'package:ods_flutter_demo/ui/components/dialogs/dialogs.dart';
import 'package:ods_flutter_demo/ui/components/floating_action_button/floating_action_button.dart';
import 'package:ods_flutter_demo/ui/components/list_item/list_checkbox.dart';
import 'package:ods_flutter_demo/ui/components/list_item/list_item.dart';
import 'package:ods_flutter_demo/ui/components/list_item/list_radio_buttons.dart';
import 'package:ods_flutter_demo/ui/components/list_item/list_switches.dart';
import 'package:ods_flutter_demo/ui/components/menus/menu_dropdown.dart';
import 'package:ods_flutter_demo/ui/components/menus/menu_exposed_dropdown.dart';
import 'package:ods_flutter_demo/ui/components/navigation_bar/navigation_bar.dart';
import 'package:ods_flutter_demo/ui/components/navigation_rail/navigation_rail.dart';
import 'package:ods_flutter_demo/ui/components/progress/progress_circular.dart';
import 'package:ods_flutter_demo/ui/components/progress/progress_linear.dart';
import 'package:ods_flutter_demo/ui/components/radio_buttons/radio_buttons.dart';
import 'package:ods_flutter_demo/ui/components/sheets_bottom/sheets_bottom.dart';
import 'package:ods_flutter_demo/ui/components/sliders/sliders.dart';
import 'package:ods_flutter_demo/ui/components/snackbars/snackbars.dart';
import 'package:ods_flutter_demo/ui/components/switches/switches.dart';
import 'package:ods_flutter_demo/ui/components/textfields/textfield.dart';
import 'package:ods_flutter_demo/ui/components/textfields/textfield_password.dart';

List<Component> components(AppLocalizations l10n) {
  return [
    Component(
      l10n.componentAppBarsTop,
      'assets/il_app_bars_top_generic.svg',
      l10n.componentAppBarsTopDescription,
      [
        Variant(
          l10n.componentAppBarsTopRegular,
          l10n.componentAppTopBarsRegularSubtitle,
          ComponentTopAppBars(),
        ),
        Variant(
          l10n.componentAppBarsTopLarge,
          l10n.componentAppBarsTopLargeSubtitle,
          ComponentTopAppBarLarge(),
        ),
      ],
    ),
    Component(
      l10n.componentNavigationBarTitle,
      'assets/il_navigation_bar.png',
      l10n.componentNavigationBarDescription,
      [
        Variant(l10n.navigationBarVariantTitle,
            l10n.navigationBarVariantSubtitle, ComponentNavigationBar()),
      ],
    ),
    Component(
      l10n.componentButtonsTitle,
      'assets/il_buttons.svg',
      l10n.componentButtonsDescription,
      [
        Variant(
            l10n.buttonsHighEmphasisVariantTitle,
            l10n.buttonsHighEmphasisVariantSubtitle,
            ButtonsContained(emphasis: ButtonEmphasis.highEmphasis)),
        Variant(
            l10n.buttonsMediumEmphasisVariantTitle,
            l10n.buttonsMediumEmphasisVariantSubtitle,
            ButtonsContained(emphasis: ButtonEmphasis.mediumEmphasis)),
        Variant(l10n.buttonsLowEmphasisVariantTitle,
            l10n.buttonsLowEmphasisVariantSubtitle, ButtonsOutlined()),
        Variant(l10n.buttonsLowestEmphasisVariantTitle,
            l10n.buttonsLowestEmphasisVariantSubtitle, ButtonsText()),
        Variant(
            l10n.buttonsFunctionalVariantTitle,
            l10n.buttonsFunctionalVariantSubtitle,
            ButtonsContained(emphasis: ButtonEmphasis.functional)),
        Variant(l10n.buttonsIconVariantTitle, l10n.buttonsIconVariantSubtitle,
            ButtonsIcons()),
        Variant(l10n.segmentedButtonsVariantTitle,
            l10n.segmentedButtonsVariantSubtitle, SegmentedButtons()),
      ],
    ),
    Component(
      l10n.componentFloatingActionButtonTitle,
      'assets/il_floating_action_button.svg',
      l10n.componentFloatingActionButtonDescription,
      [
        Variant(
          l10n.componentFloatingActionButtonVariantTitle,
          l10n.componentFloatingActionButtonOds,
          ComponentFloatingActionButton(),
        ),
      ],
    ),
    Component(
      l10n.componentCardsTitle,
      'assets/il_cards.svg',
      l10n.componentCardsDescription,
      [
        Variant(
            l10n.cardVerticalImageFirstVariantTitle,
            l10n.cardVerticalImageFirstVariantSubtitle,
            CardVerticalImageFirst()),
        Variant(
            l10n.componentCardVerticalHeaderFirst,
            l10n.componentCardVerticalHeaderFirstSubtitle,
            CardVerticalHeaderFirst()),
        Variant(l10n.cardSmallVariantTitle, l10n.cardSmallVariantSubtitle,
            CardSmall()),
        Variant(l10n.componentCardHorizontalTitle,
            l10n.componentCardHorizontalSubtitle, CardHorizontal()),
      ],
    ),
    Component(
      l10n.componentCheckboxes,
      'assets/il_checkbox.svg',
      l10n.componentCheckboxesDescription,
      [
        Variant(l10n.checkboxesVariantTitle, l10n.checkboxesVariantSubtitle,
            ComponentCheckboxes())
      ],
    ),
    Component(
      l10n.componentChips,
      'assets/il_chips.png',
      l10n.componentChipsDescription,
      [
        Variant(l10n.componentChipAction, l10n.componentChipActionSubtitle,
            ComponentChipsAction()),
        Variant(l10n.componentChipFilter, l10n.componentChipFilterSubtitle,
            ComponentChipsFilter()),
        Variant(l10n.componentChipInput, l10n.componentChipInputSubtitle,
            ComponentChipsInput()),
        Variant(l10n.componentChipChoice, l10n.componentChipChoiceSubtitle,
            ComponentChipsChoice()),
      ],
    ),
    Component(
      l10n.componentDialogsTitle,
      'assets/il_dialogs.png',
      l10n.componentDialogsDescription,
      [
        Variant(l10n.dialogsVariantTitle, l10n.dialogsVariantSubtitle,
            ComponentDialogs())
      ],
    ),
    Component(
      l10n.componentListItem,
      'assets/il_list_item.png',
      l10n.componentListItemDescription,
      [
        Variant(
          l10n.listVariantItemTitle,
          l10n.listVariantItemSubtitle,
          ComponentListsSelection(),
        ),
        Variant(
          l10n.listCheckboxesTitle,
          l10n.listCheckboxesSubtitle,
          ComponentCheckboxesList(),
        ),
        Variant(
          l10n.listRadioButtonsTitle,
          l10n.listRadioButtonsSubtitle,
          ComponentRadioButtonsList(),
        ),
        Variant(
          l10n.listSwitchesTitle,
          l10n.listSwitchesSubtitle,
          ComponentSwitchesList(),
        ),
      ],
    ),
    Component(
      l10n.componentMenus,
      'assets/il_menu.png',
      l10n.componentMenuDescription,
      [
        Variant(
          l10n.componentMenuDropdown,
          l10n.componentMenuDropdownSubtitle,
          ComponentMenuDropdown(),
        ),
        Variant(
          l10n.componentMenuExposedDropdown,
          l10n.componentMenuExposedDropdownSubtitle,
          MenuExposedDropdown(),
        ),
      ],
    ),
    Component(
      l10n.componentNavigationRail,
      'assets/il_navigation_rail.png',
      l10n.componentNavigationRailDescription,
      [
        Variant(
          l10n.componentNavigationRail,
          l10n.componentNavigationRailSubtitle,
          ComponentNavigationRail(),
        ),
      ],
    ),
    Component(
      l10n.componentProgressTitle,
      'assets/il_progress.png',
      l10n.componentProgressDescription,
      [
        Variant(
          l10n.progressLinearVariantTitle,
          l10n.progressLinearVariantSubtitle,
          ComponentProgressLinear(),
        ),
        Variant(
          l10n.progressCircularVariantTitle,
          l10n.progressCircularVariantSubtitle,
          ComponentProgressCircular(),
        ),
      ],
    ),
    Component(
      l10n.componentRadioButtons,
      'assets/il_radio_buttons.svg',
      l10n.componentRadioButtonsDescription,
      [
        Variant(l10n.radioButtonVariantTitle, l10n.radioButtonVariantSubtitle,
            ComponentRadioButtons()),
      ],
    ),
    Component(
      l10n.componentSlidersTitle,
      'assets/il_sliders.png',
      l10n.componentSlidersDescription,
      [
        Variant(l10n.slidersVariantTitle, l10n.slidersVariantSubtitle,
            ComponentSliders()),
      ],
    ),
    Component(
      l10n.componentSheetsBottomTitle,
      'assets/il_sheets_bottom.png',
      l10n.componentSheetsBottomDescription,
      [
        Variant(l10n.sheetsBottomVariantTitle, l10n.sheetsBottomVariantSubtitle,
            ComponentSheetsBottom()),
      ],
    ),
    Component(
      l10n.componentSnackbarsTitle,
      'assets/il_snackbars.svg',
      l10n.componentSnackbarsDescription,
      [
        Variant(l10n.snackbarsVariantTitle, l10n.snackbarsVariantSubtitle,
            ComponentSnackbars()),
      ],
    ),
    Component(
      l10n.componentSwitchesTitle,
      'assets/il_switches.png',
      l10n.componentSwitchesDescription,
      [
        Variant(l10n.switchesVariantTitle, l10n.switchesVariantSubtitle,
            ComponentSwitches()),
      ],
    ),
    Component(
      l10n.componentTextFields,
      'assets/il_text-fields.png',
      l10n.componentTextFieldsDescription,
      [
        Variant(
          l10n.componentTextField,
          l10n.componentTextFieldSubtitle,
          ComponentTextField(),
        ),
        Variant(
          l10n.componentTextFieldPassword,
          l10n.componentTextFieldPasswordSubtitle,
          ComponentTextFieldPassword(),
        ),
      ],
    ),
  ];
}
