import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_small.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_vertical_image_first.dart';
import 'package:ods_flutter_demo/ui/components/checkboxes/component_checkboxes.dart';
import 'package:ods_flutter_demo/ui/components/component_entities.dart';
import 'package:ods_flutter_demo/ui/components/material/component_material.dart';
import 'package:ods_flutter_demo/ui/components/navigation_bar/component_navigation_bar.dart';
import 'package:ods_flutter_demo/ui/components/radio_buttons/component_radio_buttons.dart';
import 'package:ods_flutter_demo/ui/components/switches/component_switches.dart';

List<Component> components(BuildContext context) {
  return [
    Component(
      AppLocalizations.of(context)!.componentCardsTitle,
      'assets/il_cards.svg',
      AppLocalizations.of(context)!.componentCardsDescription,
      [
        Variant(AppLocalizations.of(context)!.cardSmallVariantTitle, AppLocalizations.of(context)!.cardSmallVariantSubtitle, CardSmall()),
        Variant(AppLocalizations.of(context)!.cardVerticalImageFirstVariantTitle, AppLocalizations.of(context)!.cardVerticalImageFirstVariantSubtitle,
            CardVerticalImageFirst()),
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentCheckboxesTitle,
      'assets/il_checkbox.svg',
      AppLocalizations.of(context)!.componentCheckboxesDescription,
      [Variant(AppLocalizations.of(context)!.checkboxesVariantTitle, AppLocalizations.of(context)!.checkboxesVariantSubtitle, ComponentCheckboxes())],
    ),
    Component(
      AppLocalizations.of(context)!.componentRadioButtonsTitle,
      'assets/il_radio_buttons.svg',
      AppLocalizations.of(context)!.componentRadioButtonsDescription,
      [
        Variant(AppLocalizations.of(context)!.radioButtonVariantTitle, AppLocalizations.of(context)!.radioButtonVariantSubtitle, ComponentRadioButtons()),
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentSwitchesTitle,
      'assets/il_switches.png',
      AppLocalizations.of(context)!.componentSwitchesDescription,
      [
        Variant(AppLocalizations.of(context)!.switchesVariantTitle, AppLocalizations.of(context)!.switchesVariantSubtitle, ComponentSwitches()),
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentMaterialsTitle,
      'assets/placeholder.png',
      AppLocalizations.of(context)!.componentMaterialsDescription,
      [
        Variant(AppLocalizations.of(context)!.materialsVariantTitle, AppLocalizations.of(context)!.materialsVariantSubtitle, ComponentMaterial()),
      ],
    ),
    Component(
      AppLocalizations.of(context)!.componentNavigationBarTitle,
      'assets/placeholder.png',
      AppLocalizations.of(context)!.componentNavigationBarDescription,
      [
        Variant(AppLocalizations.of(context)!.navigationBarVariantTitle, AppLocalizations.of(context)!.navigationBarVariantSubtitle, ComponentNavigationBar()),
      ],
    ),
  ];
}
