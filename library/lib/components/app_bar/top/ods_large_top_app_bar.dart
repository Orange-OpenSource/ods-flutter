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

class OdsLargeTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OdsLargeTopAppBar({
    super.key,
    required this.title,
    this.actions,
    this.navigationIcon,
    this.scrollBehavior,
  });

  /// The app bar title displayed.
  final String title;

  /// The optional list of actions displayed on the app bar.
  final List<Widget>? actions;

  /// Icon displayed at the start of the top app bar
  final Widget? navigationIcon;

  /// The optional list of actions displayed on the app bar.
  final Widget? scrollBehavior;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar.large(
          title: Semantics(header: true, child: Text(title)),
          actions: actions,
          leading: navigationIcon,
          automaticallyImplyLeading: navigationIcon != null ? true : false,
        ),

        /// Adding a list as content
        if (scrollBehavior != null) scrollBehavior!,
      ],
    );
  }
}
