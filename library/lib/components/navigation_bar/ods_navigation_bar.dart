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
import 'package:ods_flutter/components/navigation_bar/ods_navigation_bar_item.dart';

/// ODS Navigation Bar.
///
/// The navigation bar displays a list of destinations that can be selected.
/// It highlights the selected destination and calls a callback when a destination is selected.
class OdsNavigationBar extends StatelessWidget {
  /// Creates an ODS Small card.
  const OdsNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.destinations,
    this.onDestinationSelected,
    this.icon,
  }) : super(key: key);

  /// The index of the currently selected destination.
  final int selectedIndex;

  /// The list of destinations to display.
  final List<OdsNavigationItem> destinations;

  /// The callback function called when a destination is selected.
  final void Function(int)? onDestinationSelected;

  /// The list of destinations to display.
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: destinations,
    );
  }
}
