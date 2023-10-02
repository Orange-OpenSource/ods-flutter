import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter_demo/ui/components/app_bars/top/top_app_bars.dart';
import 'package:ods_flutter_demo/ui/components/buttons/filled_button.dart';
import 'package:ods_flutter_demo/ui/components/buttons/filled_tonal_button.dart';
import 'package:ods_flutter_demo/ui/components/buttons/outlined_button.dart';
import 'package:ods_flutter_demo/ui/components/buttons/text_button.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_small.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_vertical_image_first.dart';
import 'package:ods_flutter_demo/ui/components/checkboxes/checkboxes.dart';
import 'package:ods_flutter_demo/ui/components/chips/chips_action.dart';
import 'package:ods_flutter_demo/ui/components/chips/chips_filter.dart';
import 'package:ods_flutter_demo/ui/components/chips/chips_input.dart';
import 'package:ods_flutter_demo/ui/components/component_entities.dart';
import 'package:ods_flutter_demo/ui/components/dialogs/dialogs.dart';
import 'package:ods_flutter_demo/ui/components/floating_action_button/floating_action_button.dart';
import 'package:ods_flutter_demo/ui/components/lists/lists_selection.dart';
import 'package:ods_flutter_demo/ui/components/lists/lists_standard.dart';
import 'package:ods_flutter_demo/ui/components/material/component_material.dart';
import 'package:ods_flutter_demo/ui/components/progress/progress_circular.dart';
import 'package:ods_flutter_demo/ui/components/progress/progress_linear.dart';
import 'package:ods_flutter_demo/ui/components/radio_buttons/radio_buttons.dart';
import 'package:ods_flutter_demo/ui/components/sheets_bottom/sheets_bottom.dart';
import 'package:ods_flutter_demo/ui/components/sliders/sliders.dart';
import 'package:ods_flutter_demo/ui/components/snackbars/snackbars.dart';
import 'package:ods_flutter_demo/ui/components/switches/switches.dart';
import 'package:ods_flutter_demo/ui/components/tabs/tabs.dart';

List<Component> components(BuildContext context) {
  return [
    Component(
      AppLocalizations.of(context)!.componentAppTopBarsTitle,
      'assets/il_app_bars_top_generic.svg',
      AppLocalizations.of(context)!.componentAppTopBarsDescription,
      [
        Variant(
            AppLocalizations.of(context)!.appTopBarsVariantTitle,
            AppLocalizations.of(context)!.appTopBarsVariantSubtitle,
            ComponentTopAppBars()),
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentTabTitle,
      'assets/il_navigation_bar.png',
      AppLocalizations.of(context)!.componentTabDescription,
      [
        Variant(AppLocalizations.of(context)!.tabVariantTitle,
            AppLocalizations.of(context)!.tabVariantSubtitle, ComponentTabs()),
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentButtonsTitle,
      'assets/il_buttons.svg',
      AppLocalizations.of(context)!.componentButtonsDescription,
      [
        Variant(
            AppLocalizations.of(context)!.filledButtonsVariantTitle,
            AppLocalizations.of(context)!.filledButtonsVariantSubtitle,
            ComponentFilledButtons()),
        Variant(
            AppLocalizations.of(context)!.filledTonalButtonsVariantTitle,
            AppLocalizations.of(context)!.filledTonalButtonsVariantSubtitle,
            ComponentFilledTonalButtons()),
        Variant(
            AppLocalizations.of(context)!.outlinedButtonsVariantTitle,
            AppLocalizations.of(context)!.outlinedButtonsVariantSubtitle,
            ComponentOutlinedButtons()),
        Variant(
            AppLocalizations.of(context)!.textButtonsVariantTitle,
            AppLocalizations.of(context)!.textButtonsVariantSubtitle,
            ComponentTextButtons()),
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentFloatingActionButtonTitle,
      'assets/il_floating_action_button.svg',
      AppLocalizations.of(context)!.componentFloatingActionButtonDescription,
      [
        Variant(
          AppLocalizations.of(context)!.floatingActionButtonVariantActionTitle,
          AppLocalizations.of(context)!
              .floatingActionButtonVariantActionSubtitle,
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
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentCheckboxesTitle,
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
      AppLocalizations.of(context)!.componentChipsTitle,
      'assets/il_chips.png',
      AppLocalizations.of(context)!.componentChipsDescription,
      [
        Variant(
            AppLocalizations.of(context)!.chipsVariantActionTitle,
            AppLocalizations.of(context)!.chipsVariantActionSubtitle,
            ComponentChipsAction()),
        Variant(
            AppLocalizations.of(context)!.chipsVariantFilterTitle,
            AppLocalizations.of(context)!.chipsVariantFilterSubtitle,
            ComponentChipsFilter()),
        Variant(
            AppLocalizations.of(context)!.chipsVariantInputTitle,
            AppLocalizations.of(context)!.chipsVariantInputSubtitle,
            ComponentChipsInput()),
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
      AppLocalizations.of(context)!.componentListsTitle,
      'assets/il_lists.svg',
      AppLocalizations.of(context)!.componentListsDescription,
      [
        Variant(
          AppLocalizations.of(context)!.listsVariantSelectionTitle,
          AppLocalizations.of(context)!.listsVariantSelectionSubtitle,
          ComponentListsSelection(),
        ),
        Variant(
          AppLocalizations.of(context)!.listsVariantStandardTitle,
          AppLocalizations.of(context)!.listsVariantStandardSubtitle,
          ComponentListsStandard(),
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
      AppLocalizations.of(context)!.componentRadioButtonsTitle,
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
