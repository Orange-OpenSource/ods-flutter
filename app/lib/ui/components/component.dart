import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Component {
  String titleRes;
  String imageRes;
  int smallImageRes;
  String descriptionRes;
  String composableName;
  String directions;

  Component(this.titleRes, this.imageRes, this.smallImageRes,
      this.descriptionRes, this.composableName, this.directions);
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
        'assets/ic_card_image.svg',
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
        "/component_detail"),
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
    return _components[index].directions;
  }

  List<Component> getComponent() {
    return _components;
  }

  String getName(int index) {
    return _components[index].titleRes;
  }
}

Widget displayImage(String imagePath) {
  if (imagePath.contains('svg')) {
    return SvgPicture.asset(
      imagePath,
      semanticsLabel: 'Flutter image',
      fit: BoxFit.fitHeight,
      width: double.infinity,
    );
  } else {
    return Image.asset(
      imagePath,
      semanticLabel: 'Flutter image',
      fit: BoxFit.fitHeight,
      width: double.infinity,
    );
  }
}
