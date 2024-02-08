import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter_demo/ui/components/app_bars/top/top_app_bar_large.dart';
import 'package:ods_flutter_demo/ui/components/app_bars/top/top_app_bars.dart';
import 'package:ods_flutter_demo/ui/components/buttons/button_contained.dart';
import 'package:ods_flutter_demo/ui/components/buttons/button_outlined.dart';
import 'package:ods_flutter_demo/ui/components/buttons/button_text.dart';
import 'package:ods_flutter_demo/ui/components/buttons/segmented/segmented_button.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_horizontal.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_small.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_vertical_image_first.dart';
import 'package:ods_flutter_demo/ui/components/checkboxes/checkboxes.dart';
import 'package:ods_flutter_demo/ui/components/chips/chips_action.dart';
import 'package:ods_flutter_demo/ui/components/chips/chips_choice.dart';
import 'package:ods_flutter_demo/ui/components/chips/chips_filter.dart';
import 'package:ods_flutter_demo/ui/components/chips/chips_input.dart';
import 'package:ods_flutter_demo/ui/components/component_entities.dart';
import 'package:ods_flutter_demo/ui/components/dialogs/dialogs.dart';
import 'package:ods_flutter_demo/ui/components/floating_action_button/floating_action_button.dart';
import 'package:ods_flutter_demo/ui/components/lists/lists_checkboxes.dart';
import 'package:ods_flutter_demo/ui/components/lists/lists_radio_buttons.dart';
import 'package:ods_flutter_demo/ui/components/lists/lists_selection.dart';
import 'package:ods_flutter_demo/ui/components/lists/lists_standard.dart';
import 'package:ods_flutter_demo/ui/components/lists/lists_switches.dart';
import 'package:ods_flutter_demo/ui/components/material/component_material.dart';
import 'package:ods_flutter_demo/ui/components/menus/menu_dropdown.dart';
import 'package:ods_flutter_demo/ui/components/menus/menu_exposed_dropdown.dart';
import 'package:ods_flutter_demo/ui/components/navigation_bar/navigation_bar.dart';
import 'package:ods_flutter_demo/ui/components/progress/progress_circular.dart';
import 'package:ods_flutter_demo/ui/components/progress/progress_linear.dart';
import 'package:ods_flutter_demo/ui/components/radio_buttons/radio_buttons.dart';
import 'package:ods_flutter_demo/ui/components/sheets_bottom/sheets_bottom.dart';
import 'package:ods_flutter_demo/ui/components/sliders/sliders.dart';
import 'package:ods_flutter_demo/ui/components/snackbars/snackbars.dart';
import 'package:ods_flutter_demo/ui/components/switches/switches.dart';
import 'package:ods_flutter_demo/ui/components/textfields/textfield.dart';
import 'package:ods_flutter_demo/ui/components/textfields/textfield_password.dart';

List<Component> components(BuildContext context) {
  return [
    Component(
      AppLocalizations.of(context)!.componentAppBarsTop,
      'assets/il_app_bars_top_generic.svg',
      AppLocalizations.of(context)!.componentAppBarsTopDescription,
      [
        Variant(
          AppLocalizations.of(context)!.componentAppBarsTopRegular,
          AppLocalizations.of(context)!.componentAppTopBarsRegularSubtitle,
          ComponentTopAppBars(),
        ),
        Variant(
          AppLocalizations.of(context)!.componentAppBarsTopLarge,
          AppLocalizations.of(context)!.componentAppBarsTopLargeSubtitle,
          ComponentTopAppBarLarge(),
        ),
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentNavigationBarTitle,
      'assets/il_navigation_bar.png',
      AppLocalizations.of(context)!.componentNavigationBarDescription,
      [
        Variant(
            AppLocalizations.of(context)!.navigationBarVariantTitle,
            AppLocalizations.of(context)!.navigationBarVariantSubtitle,
            ComponentNavigationBar()),
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentButtonsTitle,
      'assets/il_buttons.svg',
      AppLocalizations.of(context)!.componentButtonsDescription,
      [
        Variant(
            AppLocalizations.of(context)!.buttonsHighEmphasisVariantTitle,
            AppLocalizations.of(context)!.buttonsHighEmphasisVariantSubtitle,
            ButtonsContained(emphasis: ButtonEmphasis.highEmphasis)),
        Variant(
            AppLocalizations.of(context)!.buttonsMediumEmphasisVariantTitle,
            AppLocalizations.of(context)!.buttonsMediumEmphasisVariantSubtitle,
            ButtonsContained(emphasis: ButtonEmphasis.mediumEmphasis)),
        Variant(
            AppLocalizations.of(context)!.buttonsLowEmphasisVariantTitle,
            AppLocalizations.of(context)!.buttonsLowEmphasisVariantSubtitle,
            ButtonsOutlined()),
        Variant(
            AppLocalizations.of(context)!.buttonsLowestEmphasisVariantTitle,
            AppLocalizations.of(context)!.buttonsLowestEmphasisVariantSubtitle,
            ButtonsText()),
        Variant(
            AppLocalizations.of(context)!.buttonsFunctionalVariantTitle,
            AppLocalizations.of(context)!.buttonsFunctionalVariantSubtitle,
            ButtonsContained(emphasis: ButtonEmphasis.functional)),
        Variant(
            AppLocalizations.of(context)!.segmentedButtonsVariantTitle,
            AppLocalizations.of(context)!.segmentedButtonsVariantSubtitle,
            SegmentedButtons()),
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentFloatingActionButtonTitle,
      'assets/il_floating_action_button.svg',
      AppLocalizations.of(context)!.componentFloatingActionButtonDescription,
      [
        Variant(
          AppLocalizations.of(context)!
              .componentFloatingActionButtonVariantTitle,
          AppLocalizations.of(context)!.componentFloatingActionButtonOds,
          ComponentFloatingActionButton(),
        ),
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentCardsTitle,
      'assets/il_cards.svg',
      AppLocalizations.of(context)!.componentCardsDescription,
      [
        Variant(
            AppLocalizations.of(context)!.cardSmallVariantTitle,
            AppLocalizations.of(context)!.cardSmallVariantSubtitle,
            CardSmall()),
        Variant(
            AppLocalizations.of(context)!.cardVerticalImageFirstVariantTitle,
            AppLocalizations.of(context)!.cardVerticalImageFirstVariantSubtitle,
            CardVerticalImageFirst()),
        Variant(
            AppLocalizations.of(context)!.componentCardHorizontalTitle,
            AppLocalizations.of(context)!.componentCardHorizontalSubtitle,
            CardHorizontal()),
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentCheckboxes,
      'assets/il_checkbox.svg',
      AppLocalizations.of(context)!.componentCheckboxesDescription,
      [
        Variant(
            AppLocalizations.of(context)!.checkboxesVariantTitle,
            AppLocalizations.of(context)!.checkboxesVariantSubtitle,
            ComponentCheckboxes())
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentChips,
      'assets/il_chips.png',
      AppLocalizations.of(context)!.componentChipsDescription,
      [
        Variant(
            AppLocalizations.of(context)!.componentChipAction,
            AppLocalizations.of(context)!.componentChipActionSubtitle,
            ComponentChipsAction()),
        Variant(
            AppLocalizations.of(context)!.componentChipFilter,
            AppLocalizations.of(context)!.componentChipFilterSubtitle,
            ComponentChipsFilter()),
        Variant(
            AppLocalizations.of(context)!.componentChipInput,
            AppLocalizations.of(context)!.componentChipInputSubtitle,
            ComponentChipsInput()),
        Variant(
            AppLocalizations.of(context)!.componentChipChoice,
            AppLocalizations.of(context)!.componentChipChoiceSubtitle,
            ComponentChipsChoice()),
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentDialogsTitle,
      'assets/il_dialogs.png',
      AppLocalizations.of(context)!.componentDialogsDescription,
      [
        Variant(
            AppLocalizations.of(context)!.dialogsVariantTitle,
            AppLocalizations.of(context)!.dialogsVariantSubtitle,
            ComponentDialogs())
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentListItem,
      'assets/il_lists.svg',
      AppLocalizations.of(context)!.componentListItemDescription,
      [
        Variant(
          AppLocalizations.of(context)!.listVariantSelectionTitle,
          AppLocalizations.of(context)!.listVariantSelectionSubtitle,
          ComponentListsSelection(),
        ),
        Variant(
          AppLocalizations.of(context)!.listVariantStandardTitle,
          AppLocalizations.of(context)!.listVariantStandardSubtitle,
          ComponentListsStandard(),
        ),
        Variant(
          AppLocalizations.of(context)!.listCheckboxesTitle,
          AppLocalizations.of(context)!.listCheckboxesSubtitle,
          ComponentCheckboxesList(),
        ),
        Variant(
          AppLocalizations.of(context)!.listRadioButtonsTitle,
          AppLocalizations.of(context)!.listRadioButtonsSubtitle,
          ComponentRadioButtonsList(),
        ),
        Variant(
          AppLocalizations.of(context)!.listSwitchesTitle,
          AppLocalizations.of(context)!.listSwitchesSubtitle,
          ComponentSwitchesList(),
        ),
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentMenus,
      'assets/il_menu.png',
      AppLocalizations.of(context)!.componentMenuDescription,
      [
        Variant(
          AppLocalizations.of(context)!.componentMenuDropdown,
          AppLocalizations.of(context)!.componentMenuDropdownSubtitle,
          ComponentMenuDropdown(),
        ),
        Variant(
          AppLocalizations.of(context)!.componentMenuExposedDropdown,
          AppLocalizations.of(context)!.componentMenuExposedDropdownSubtitle,
          MenuExposedDropdown(),
        ),
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentProgressTitle,
      'assets/il_progress.png',
      AppLocalizations.of(context)!.componentProgressDescription,
      [
        Variant(
          AppLocalizations.of(context)!.progressLinearVariantTitle,
          AppLocalizations.of(context)!.progressLinearVariantSubtitle,
          ComponentProgressLinear(),
        ),
        Variant(
          AppLocalizations.of(context)!.progressCircularVariantTitle,
          AppLocalizations.of(context)!.progressCircularVariantSubtitle,
          ComponentProgressCircular(),
        ),
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentRadioButtons,
      'assets/il_radio_buttons.svg',
      AppLocalizations.of(context)!.componentRadioButtonsDescription,
      [
        Variant(
            AppLocalizations.of(context)!.radioButtonVariantTitle,
            AppLocalizations.of(context)!.radioButtonVariantSubtitle,
            ComponentRadioButtons()),
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentSlidersTitle,
      'assets/il_sliders.png',
      AppLocalizations.of(context)!.componentSlidersDescription,
      [
        Variant(
            AppLocalizations.of(context)!.slidersVariantTitle,
            AppLocalizations.of(context)!.slidersVariantSubtitle,
            ComponentSliders()),
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentSheetsBottomTitle,
      'assets/il_sheets_bottom.png',
      AppLocalizations.of(context)!.componentSheetsBottomDescription,
      [
        Variant(
            AppLocalizations.of(context)!.sheetsBottomVariantTitle,
            AppLocalizations.of(context)!.sheetsBottomVariantSubtitle,
            ComponentSheetsBottom()),
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentSnackbarsTitle,
      'assets/il_snackbars.svg',
      AppLocalizations.of(context)!.componentSnackbarsDescription,
      [
        Variant(
            AppLocalizations.of(context)!.snackbarsVariantTitle,
            AppLocalizations.of(context)!.snackbarsVariantSubtitle,
            ComponentSnackbars()),
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentSwitchesTitle,
      'assets/il_switches.png',
      AppLocalizations.of(context)!.componentSwitchesDescription,
      [
        Variant(
            AppLocalizations.of(context)!.switchesVariantTitle,
            AppLocalizations.of(context)!.switchesVariantSubtitle,
            ComponentSwitches()),
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentTextFields,
      'assets/il_text-fields.png',
      AppLocalizations.of(context)!.componentTextFieldsDescription,
      [
        Variant(
          AppLocalizations.of(context)!.componentTextField,
          AppLocalizations.of(context)!.componentTextFieldSubtitle,
          ComponentTextField(),
        ),
        Variant(
          AppLocalizations.of(context)!.componentTextFieldPassword,
          AppLocalizations.of(context)!.componentTextFieldPasswordSubtitle,
          ComponentTextFieldPassword(),
        ),
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentMaterialsTitle,
      'assets/placeholder.png',
      AppLocalizations.of(context)!.componentMaterialsDescription,
      [
        Variant(
            AppLocalizations.of(context)!.materialsVariantTitle,
            AppLocalizations.of(context)!.materialsVariantSubtitle,
            ComponentMaterial()),
      ],
    ),
  ];
}
