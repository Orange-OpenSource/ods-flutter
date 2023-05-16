import 'dart:core';

import 'package:flutter/material.dart';

class OdsComponent {
  String title;
  String imageResourceName;
  String description;
  List<Variant> variants;

  OdsComponent(
      this.title, this.imageResourceName, this.description, this.variants);
}

class Variant {
  String title;
  String technicalName;
  Widget? screen;

  Variant(this.title, this.technicalName, this.screen);
}
