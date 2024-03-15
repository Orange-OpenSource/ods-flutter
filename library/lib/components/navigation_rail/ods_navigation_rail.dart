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
import 'package:ods_flutter/components/navigation_rail/ods_navigation_rail_item.dart';
import 'package:ods_flutter/guidelines/spacings.dart';

/// ODS Navigation Rail.
///
/// The Navigation Rail is meant to be displayed at the left or right of an app to navigate between
/// a small number of views, typically between three and five.
class OdsNavigationRail extends StatelessWidget {
  /// Creates an ODS Button.
  ///
  /// * [selectedIndex] - The index into [destinations] for the current selected NavigationRailDestination or null if no destination is selected.
  /// * [destinations] - Defines the appearance of the button items that are arrayed within the navigation rail.
  /// * [onDestinationSelected] - Called when one of the destinations is selected.
  /// * [leadingIconFirst] - The first leading widget in the rail that is placed above the destinations.
  /// * [leadingIconSecond] - The second leading widget in the rail that is placed above the destinations.
  const OdsNavigationRail({
    Key? key,
    required this.selectedIndex,
    required this.destinations,
    this.onDestinationSelected,
    this.leadingIconFirst,
    this.leadingIconSecond,
  }) : super(key: key);

  /// The index into [destinations] for the current selected NavigationRailDestination or null if no destination is selected.
  final int selectedIndex;

  /// Defines the appearance of the button items that are arrayed within the navigation rail.
  final List<OdsNavigationRailItem> destinations;

  /// The callback function called when one of the destinations is selected..
  final void Function(int)? onDestinationSelected;

  /// The first leading widget in the rail that is placed above the destinations.
  final Widget? leadingIconFirst;

  /// The second leading widget in the rail that is placed above the destinations.
  final Widget? leadingIconSecond;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: NavigationRail(
                    selectedIndex: selectedIndex,
                    onDestinationSelected: onDestinationSelected,
                    destinations: destinations,
                    labelType: NavigationRailLabelType.all,
                    leading: leadingIconFirst != null ||
                            leadingIconSecond != null
                        ? Column(
                            children: [
                              if (leadingIconFirst != null) leadingIconFirst!,
                              if (leadingIconSecond != null) leadingIconSecond!,
                              const SizedBox(height: spacingXl),
                            ],
                          )
                        : null,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
