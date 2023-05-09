import 'dart:core';

import 'package:flutter/cupertino.dart';

import 'cards/component_cards.dart';
import 'checkboxes/component_checkboxes.dart';
import 'material/component_material.dart';
import 'radio_buttons/component_radio_buttons.dart';
import 'switches/component_switches.dart';

class Component {
  String titleRes;
  String imageRes;
  int smallImageRes;
  String descriptionRes;
  String composableName;
  Widget varaintsScreen;

  Component(this.titleRes, this.imageRes, this.smallImageRes,
      this.descriptionRes, this.composableName, this.varaintsScreen);
}

List<Component> OdsComponents = [
  Component(
      "Checkboxes",
      'assets/placeholder.png',
      1,
      "Checkboxes are used to select or deselect an option. Single checkboxes can be used to determine an individual choice and they can be grouped to allow users to select any combination of items.",
      "Checkbox",
      ComponentCheckboxes()),
  Component(
      "Cards",
      'assets/ic_card_image.svg',
      1,
      "Checkboxes are used to select or deselect an option. Single checkboxes can be used to determine an individual choice and they can be grouped to allow users to select any combination of items.",
      "Cards",
      ComponentCards()),
  Component(
      "Radio Buttons",
      'assets/placeholder.png',
      1,
      "Radio buttons enable users to choose one item from a set of mutually exclusive, related choices.",
      "Radio Buttons",
      ComponentRadioButtons()),
  Component(
      "Switches",
      'assets/il_switches.png',
      1,
      "On/off switches toggle the state of a single settings option. The function of the switch should be made clear by the inline label.",
      "Switch",
      ComponentSwitches()),
  Component(
      "Others",
      'assets/placeholder.png',
      1,
      "On/off switches toggle the state of a single settings option. The function of the switch should be made clear "
          "by the inline label.",
      "Others",
      ComponentMaterial())
];
