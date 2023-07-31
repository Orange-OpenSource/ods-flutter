import 'dart:core';

import 'package:flutter/material.dart';

class Guideline {
  String title;
  String imageResourceName;
  String description;
  Widget screen;

  Guideline(this.title, this.imageResourceName, this.description, this.screen);
}
