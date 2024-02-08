/*
 * Software Name : Orange Design System
 * SPDX-FileCopyrightText: Copyright (c) Orange SA
 * SPDX-License-Identifier: MIT
 *
 * This software is distributed under the MIT licence,
 * the text of which is available at https://opensource.org/license/MIT/
 * or see the "LICENSE" file for more details.
 *
 * Software description: Flutter library of reusable graphical components for Android and iOS
 */

import 'package:flutter/material.dart';

class OdsAppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const OdsAppTopBar({
    super.key,
    required this.title,
    this.actions,
    this.navigationIcon,
  });

  /// The app bar title displayed.
  final String title;

  /// The optional list of actions displayed on the app bar.
  final List<Widget>? actions;

  /// Icon to be displayed at the start of the top app bar
  final Widget? navigationIcon;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: actions,
      leading: navigationIcon,
      automaticallyImplyLeading: navigationIcon != null ? true : false,
      //centerTitle: true,
    );
  }
}
