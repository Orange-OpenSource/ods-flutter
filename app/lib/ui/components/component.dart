import 'dart:core';

class Component {
  String titleRes;
  String imageRes;
  int smallImageRes;
  String descriptionRes;
  String composableName;
  String direction;
  List<Variant> variants;

  Component(this.titleRes, this.imageRes, this.smallImageRes,
      this.descriptionRes, this.composableName, this.direction, this.variants);
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
        "OdsCheckbox",
        "/component_checkboxes", []),
    Component(
        "Cards",
        'assets/ic_card.png',
        1,
        "Cards are important components that can be used to organise and present a number of different types of related information.",
        "",
        "/card_small",
        List.of([
          Variant.cardSmall,
          Variant.cardVerticalHeaderFirst,
          Variant.cardVerticalImageFirst
        ])),
    Component(
        "Radio Buttons",
        'assets/il_radiobutton.png',
        1,
        "Radio buttons enable users to choose one item from a set of mutually exclusive, related choices.",
        "OdsRadioButtons",
        "/component_radioButtons", []),
    Component(
        "Switches",
        'assets/il_switches.png',
        1,
        "On/off switches toggle the state of a single settings option. The function of the switch should be made clear by the inline label.",
        "OdsSwitch",
        "/component_switches", []),
    Component(
        "Others",
        'assets/placeholder.png',
        1,
        "On/off switches toggle the state of a single settings option. The function of the switch should be made clear "
            "by the inline label.",
        "Others",
        "/component_material",
        [])
  ];

  String getImage(int index) {
    return _components[index].imageRes;
  }

  String getDirections(int index) {
    return _components[index].direction;
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

class Variant {
  String titleRes;
  String composableName;

  Variant(this.titleRes, this.composableName);

  static Variant cardSmall = Variant("Small card", "OdsSmallCard");
  static Variant cardVerticalImageFirst =
      Variant("Vertical image first card", "OdsVerticalImageFirstCard");
  static Variant cardVerticalHeaderFirst =
      Variant("Vertical header first card", "OdsVerticalHeaderFirstCard");
}
