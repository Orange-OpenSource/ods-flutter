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

import 'package:flutter/material.dart';
import 'package:ods_flutter_demo/ui/theme/theme_selector.dart';

class MainAppBar extends AppBar {
  MainAppBar(this.barTitle);

  final String barTitle;

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  late String title;

  @override
  void initState() {
    super.initState();
    title = widget.barTitle;
  }

  @override
  void didUpdateWidget(covariant MainAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    title = widget.barTitle;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [ThemeSelector()],
    );
  }
}
