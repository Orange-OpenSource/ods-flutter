import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter_demo/ui/components/buttons/elevated_button.dart';
import 'package:ods_flutter_demo/ui/components/buttons/filled_button.dart';
import 'package:ods_flutter_demo/ui/components/buttons/filled_tonal_button.dart';
import 'package:ods_flutter_demo/ui/components/buttons/outlined_button.dart';
import 'package:ods_flutter_demo/ui/components/buttons/text_button.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_small.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_vertical_image_first.dart';
import 'package:ods_flutter_demo/ui/components/checkboxes/component_checkboxes.dart';
import 'package:ods_flutter_demo/ui/components/component_entities.dart';
import 'package:ods_flutter_demo/ui/components/material/component_material.dart';
import 'package:ods_flutter_demo/ui/components/radio_buttons/component_radio_buttons.dart';
import 'package:ods_flutter_demo/ui/components/snackbars/snackbars.dart';
import 'package:ods_flutter_demo/ui/components/switches/component_switches.dart';

import 'app_bars/top/top_app_bars.dart';

List<Component> components(BuildContext context) {
  return [
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
      AppLocalizations.of(context)!.componentButtonsTitle,
      'assets/il_buttons.svg',
      AppLocalizations.of(context)!.componentButtonsDescription,
      [
        Variant(
            AppLocalizations.of(context)!.elevatedButtonsVariantTitle,
            AppLocalizations.of(context)!.elevatedButtonsVariantSubtitle,
            ComponentElevatedButtons()),
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
      AppLocalizations.of(context)!.componentAppTopBarsTitle,
      'assets/il_app_bars_top_generic.png',
      AppLocalizations.of(context)!.componentAppTopBarsDescription,
      [
        Variant(
            AppLocalizations.of(context)!.appTopBarsVariantTitle,
            AppLocalizations.of(context)!.appTopBarsVariantSubtitle,
            ComponentTopAppBars()),
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
