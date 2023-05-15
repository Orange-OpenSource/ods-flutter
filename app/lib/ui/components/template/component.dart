import 'dart:core';

import 'package:flutter/cupertino.dart';

class Component {
  String titleRes;
  String imageRes;
  int smallImageRes;
  String descriptionRes;
  String composableName;
  List<Variant> variants;

  Component(this.titleRes, this.imageRes, this.smallImageRes,
      this.descriptionRes, this.composableName, this.variants);
}

class Variant {
  String title;
  String technicalName;
  String route;
  Widget? screen;

  Variant(this.title, this.technicalName, this.route, this.screen);
}

class Components {
  late List<Component> components;

  Components();

  List<Component> _components = [
    Component(
        "Checkboxes",
        'assets/ic_checkbox.png',
        1,
        "Checkboxes are used to select or deselect an option. Single checkboxes can be used to determine an individual choice and they can be grouped to allow users to select any combination of items.",
        "",
        [Variant("Checkboxes", "OdsCheckbox", "/component_checkboxes", null)]),
    Component(
        "Cards",
        'assets/ic_card.png',
        1,
        "Cards are important components that can be used to organise and present a number of different types of related information.",
        "", [
      Variant("Small card", "OdsSmallCard", "/card_small",
          Text("Small Card variant")),
      Variant("Vertical image first card", "OdsVerticalImageFirstCard",
          "/card_small", Text("Card Image first variant")),
      Variant("Vertical header first card", "OdsVerticalHeaderFirstCard",
          "/card_small", Text("Card header first variant")),
    ]),
    Component(
        "Radio Buttons",
        'assets/il_radiobutton.png',
        1,
        "Radio buttons enable users to choose one item from a set of mutually exclusive, related choices.",
        "OdsRadioButtons", [
      Variant(
          "Radio Buttons", "OdsRadioButtons", "/component_radioButtons", null),
    ]),
    Component(
        "Switches",
        'assets/il_switches.png',
        1,
        "On/off switches toggle the state of a single settings option. The function of the switch should be made clear by the inline label.",
        "OdsSwitch", [
      Variant("Switches", "OdsSwitch", "/component_switches", null),
    ]),
    Component(
        "Others",
        'assets/placeholder.png',
        1,
        "On/off switches toggle the state of a single settings option. The function of the switch should be made clear "
            "by the inline label.",
        "Others",
        [
          Variant("Others", "Material", "/component_material", null),
        ])
  ];

  String getImage(int index) {
    return _components[index].imageRes;
  }

  List<Component> getComponents() {
    return _components;
  }

  Component getComponent(int index) {
    return _components[index];
  }

  String getName(int index) {
    return _components[index].titleRes;
  }
}
