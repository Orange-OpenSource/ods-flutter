import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum IconType { svg, icon }

class OdsBottomNavigationItemIcon {
  final dynamic icon;
  final IconType type;
  final String? badge;

  OdsBottomNavigationItemIcon({
    required this.icon,
    required this.type,
    this.badge,
  });
}

class OdsNavigationItem extends NavigationDestination {
  OdsNavigationItem({
    Key? key,
    required OdsBottomNavigationItemIcon odsBottomNavigationItemIcon,
    required String label,
    required BuildContext context,
  }) : super(
          key: key,
          label: label,
          icon: _buildIcons(odsBottomNavigationItemIcon, context),
          selectedIcon:
              _buildSelectedIcon(odsBottomNavigationItemIcon, context),
        );

  static Widget _buildIcons(
      OdsBottomNavigationItemIcon odsBottomNavigationItemIcon,
      BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var colorFilter = ColorFilter.mode(colorScheme.secondary, BlendMode.srcIn);

    if (odsBottomNavigationItemIcon.type == IconType.svg) {
      /// If the type is IconType.svg, use the SVG icon
      final icon = SvgPicture.asset(
        odsBottomNavigationItemIcon.icon,
        colorFilter: colorFilter,
      );
      return odsBottomNavigationItemIcon.badge != null
          ? Badge(label: Text(odsBottomNavigationItemIcon.badge!), child: icon)
          : icon;
    } else {
      /// If the type is IconType.icon, use the provided icon (of type Icon)
      var icon = odsBottomNavigationItemIcon.icon;
      return odsBottomNavigationItemIcon.badge != null
          ? Badge(label: Text(odsBottomNavigationItemIcon.badge!), child: icon)
          : icon;
    }
  }

  static Widget _buildSelectedIcon(
      OdsBottomNavigationItemIcon odsBottomNavigationItemIcon,
      BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    var activeColorFilter =
        ColorFilter.mode(colorScheme.primary, BlendMode.srcIn);

    if (odsBottomNavigationItemIcon.type == IconType.svg) {
      /// If the type is IconType.svg, use the SVG icon
      final icon = SvgPicture.asset(
        odsBottomNavigationItemIcon.icon,
        colorFilter: activeColorFilter,
      );
      return odsBottomNavigationItemIcon.badge != null
          ? Badge(label: Text(odsBottomNavigationItemIcon.badge!), child: icon)
          : icon;
    } else {
      /// If the type is IconType.icon, use the provided icon (of type Icon)
      var icon = odsBottomNavigationItemIcon.icon;
      return odsBottomNavigationItemIcon.badge != null
          ? Badge(label: Text(odsBottomNavigationItemIcon.badge!), child: icon)
          : icon;
    }
  }
}
