import 'dart:core';

class Component {
  String titleRes;
  String imageRes;
  int smallImageRes;
  String descriptionRes;
  String composableName;
  String direction;

  Component(this.titleRes, this.imageRes, this.smallImageRes,
      this.descriptionRes, this.composableName, this.direction);
}

class Components {
  late List<Component> components;

  Components();

  List<Component> _components = [
    Component(
        "Checkboxes",
        'assets/placeholder.png',
        1,
        "Checkboxes are used to select or deselect an option. Single checkboxes can be used to determine an individual choice and they can be grouped to allow users to select any combination of items.",
        "Checkbox",
        "/component_checkboxes"),
    Component(
        "Cards",
        'assets/Card_image_BW.png',
        1,
        "Checkboxes are used to select or deselect an option. Single checkboxes can be used to determine an individual choice and they can be grouped to allow users to select any combination of items.",
        "Cards",
        "/component_cards"),
    Component(
        "Radio Buttons",
        'assets/placeholder.png',
        1,
        "Radio buttons enable users to choose one item from a set of mutually exclusive, related choices.",
        "Radio Buttons",
        "/component_radioButtons"),
    Component(
        "Switches",
        'assets/il_switches.png',
        1,
        "On/off switches toggle the state of a single settings option. The function of the switch should be made clear by the inline label.",
        "Switch",
        "/component_switches"),
    Component(
        "Others",
        'assets/placeholder.png',
        1,
        "On/off switches toggle the state of a single settings option. The function of the switch should be made clear "
            "by the inline label.",
        "Others",
        "/component_material")
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
