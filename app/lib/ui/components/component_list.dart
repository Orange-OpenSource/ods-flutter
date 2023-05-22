import 'package:ods_flutter_demo/ui/components/cards/component_card_small.dart';
import 'package:ods_flutter_demo/ui/components/checkboxes/component_checkboxes.dart';
import 'package:ods_flutter_demo/ui/components/component.dart';
import 'package:ods_flutter_demo/ui/components/material/component_material.dart';
import 'package:ods_flutter_demo/ui/components/radio_buttons/component_radio_buttons.dart';
import 'package:ods_flutter_demo/ui/components/switches/component_switches.dart';

List<OdsComponent> odsComponents = [
  OdsComponent(
      "Checkboxes",
      'assets/il_checkbox.svg',
      "Checkboxes are used to select or deselect an option. Single checkboxes can be used to determine an individual choice and they can be grouped to allow users to select any combination of items.",
      [Variant("Checkboxes", "OdsCheckbox", ComponentCheckboxes())]),
  OdsComponent(
      "Cards",
      'assets/il_cards.svg',
      "Cards are important components that can be used to organise and present a number of different types of related information.",
      [
        Variant("Small card", "OdsSmallCard", ComponentCardSmall()),
      ]),
  OdsComponent(
      "Radio Buttons",
      'assets/il_radio_buttons.svg',
      "Radio buttons enable users to choose one item from a set of mutually exclusive, related choices.",
      [
        Variant("Radio Buttons", "OdsRadioButtons", ComponentRadioButtons()),
      ]),
  OdsComponent(
      "Switches",
      'assets/il_switches.png',
      "On/off switches toggle the state of a single settings option. The function of the switch should be made clear by the inline label.",
      [
        Variant("Switches", "OdsSwitch", ComponentSwitches()),
      ]),
  OdsComponent(
      "Materials",
      'assets/placeholder.png',
      "On/off switches toggle the state of a single settings option. The function of the switch should be made clear "
          "by the inline label.",
      [
        Variant("Others", "Material", ComponentMaterial()),
      ])
];
