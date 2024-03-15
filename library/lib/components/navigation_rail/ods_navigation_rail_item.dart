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
import 'package:flutter_svg/svg.dart';
import 'package:ods_flutter/l10n/l10n.dart';

/// ODS Navigation Rail Item.
///
/// Creates a destination that is used with NavigationRailItem.destinations.
class OdsNavigationRailItem extends NavigationRailDestination {
  OdsNavigationRailItem({
    Key? key,
    required dynamic icon,
    String? badge,
    required String label,
    required BuildContext context,
  }) : super(
          icon: _buildIcon(icon, badge, context),
          label: Text(label),
          selectedIcon: _buildIcon(icon, badge, context, isSelected: true),
        );

  static Widget _buildIcon(
      dynamic iconData, String? badge, BuildContext context,
      {bool isSelected = false}) {
    final l10n = context.odsL10n;

    var colorScheme = Theme.of(context).colorScheme;
    var colorFilter = isSelected
        ? ColorFilter.mode(colorScheme.primary, BlendMode.srcIn)
        : ColorFilter.mode(colorScheme.secondary, BlendMode.srcIn);

    /// If the type is IconType.icon, use the provided icon (of type Icon)
    Widget iconWidget = iconData is Widget
        ? iconData

        /// If the type is IconType.svg, use the SVG icon
        : (iconData is String && iconData.endsWith('.svg')
            ? Semantics(
                excludeSemantics: true,
                child: SvgPicture.asset(
                  iconData,
                  colorFilter: colorFilter,
                ),
              )

            /// If the type is IconType.png, use the PNG icon
            : (iconData is String && iconData.endsWith('.png')
                ? Semantics(
                    excludeSemantics: true,
                    child: Image.asset(iconData),
                  )
                : throw Exception(
                    'Invalid icon type: ${iconData.runtimeType}')));

    /// If the odsBottomNavigationItemIcon.badge parameter is not empty, use the Widget Badge
    return badge != null
        ? Badge(
            label: Semantics(
              label: "$badge ${l10n.componentNavigationBarNotification}",
              excludeSemantics: true,
              child: Text(
                badge,
                textScaleFactor: 1.0,
              ),
            ),
            child: iconWidget,
          )
        : iconWidget;
  }
}
