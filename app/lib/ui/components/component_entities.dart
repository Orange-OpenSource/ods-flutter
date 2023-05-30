import 'dart:core';

import 'package:flutter/material.dart';

class Component {
  String title;
  String imageResourceName;
  String description;
  List<Variant> variants;

  Component(this.title, this.imageResourceName, this.description, this.variants);
}

class Variant {
  String title;
  String technicalName;
  Widget screen;

  Variant(this.title, this.technicalName, this.screen);
}
