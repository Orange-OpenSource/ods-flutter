/*
 * Software Name : Orange Design System
 * SPDX-FileCopyrightText: Copyright (c) Orange SA
 * SPDX-License-Identifier: MIT
 *
 * This software is distributed under the MIT license,
 * the text of which is available at https://opensource.org/license/MIT/
 * or see the "LICENSE" file for more details.
 *
 * Software description: Flutter library of reusable graphical components for Android and iOS
 */

import 'dart:core';

import 'package:flutter/material.dart';

class Module {
  String title;
  String imageResourceName;
  String description;
  Widget screen;

  Module(this.title, this.imageResourceName, this.description, this.screen);
}
