import 'dart:core';

import 'package:flutter/cupertino.dart';

import 'cards/component_cards.dart';
import 'checkboxes/component_checkboxes.dart';
import 'material/component_material.dart';
import 'radio_buttons/component_radio_buttons.dart';
import 'switches/component_switches.dart';

class Component {
  String title;
  String imageResourceName;
  String description;
  Widget componentScreen;

  Component(this.title, this.imageResourceName, this.description,
      this.componentScreen);
}

List<Component> odsComponents = [
  Component(
      "Checkboxes",
      'assets/placeholder.png',
      "Checkboxes are used to select or deselect an option. Single checkboxes can be used to determine an individual choice and they can be grouped to allow users to select any combination of items.",
      ComponentCheckboxes()),
  Component(
      "Cards",
      'assets/ic_card_image.svg',
      "Checkboxes are used to select or deselect an option. Single checkboxes can be used to determine an individual choice and they can be grouped to allow users to select any combination of items.",
      ComponentCards()),
  Component(
      "Radio Buttons",
      'assets/placeholder.png',
      "Radio buttons enable users to choose one item from a set of mutually exclusive, related choices.",
      ComponentRadioButtons()),
  Component(
      "Switches",
      'assets/il_switches.png',
      "On/off switches toggle the state of a single settings option. The function of the switch should be made clear by the inline label.",
      ComponentSwitches()),
  Component(
      "Others",
      'assets/placeholder.png',
      "On/off switches toggle the state of a single settings option. The function of the switch should be made clear "
          "by the inline label.",
      ComponentMaterial())
];
