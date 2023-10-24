import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum IconType { svg, icon, png }

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
    Widget icon;

    switch (odsBottomNavigationItemIcon.type) {
      case IconType.svg:

        /// If the type is IconType.svg, use the SVG icon
        icon = SvgPicture.asset(
          odsBottomNavigationItemIcon.icon,
          colorFilter: colorFilter,
        );
        break;
      case IconType.icon:

        /// If the type is IconType.icon, use the provided icon (of type Icon)
        icon = odsBottomNavigationItemIcon.icon;
        break;
      case IconType.png:

        /// If the type is IconType.svg, use the SVG icon
        icon = Image.asset(
          odsBottomNavigationItemIcon.icon,
        );
        break;
    }

    return odsBottomNavigationItemIcon.badge != null
        ? Badge(label: Text(odsBottomNavigationItemIcon.badge!), child: icon)
        : icon;
  }

  static Widget _buildSelectedIcon(
      OdsBottomNavigationItemIcon odsBottomNavigationItemIcon,
      BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    var activeColorFilter =
        ColorFilter.mode(colorScheme.primary, BlendMode.srcIn);
    Widget icon;

    switch (odsBottomNavigationItemIcon.type) {
      case IconType.svg:

        /// If the type is IconType.svg, use the SVG icon
        icon = SvgPicture.asset(
          odsBottomNavigationItemIcon.icon,
          colorFilter: activeColorFilter,
        );
        break;
      case IconType.icon:

        /// If the type is IconType.icon, use the provided icon (of type Icon)
        icon = odsBottomNavigationItemIcon.icon;
        break;
      case IconType.png:

        /// If the type is IconType.svg, use the SVG icon
        icon = Image.asset(
          odsBottomNavigationItemIcon.icon,
        );
        break;
    }

    return odsBottomNavigationItemIcon.badge != null
        ? Badge(label: Text(odsBottomNavigationItemIcon.badge!), child: icon)
        : icon;
  }
}
