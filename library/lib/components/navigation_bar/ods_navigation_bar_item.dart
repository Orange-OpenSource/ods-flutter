import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/*
enum IconType { svg, icon }

class IconName {
  final String iconFile;
  final IconType type;

  IconName({
    required this.iconFile,
    required this.type,
  });
}

class IconInfo {
  final IconName iconName;
  final String badge;

  IconInfo({
    required this.iconName,
    this.badge = "",
  });
}

class OdsNavigationItem extends NavigationDestination {
  OdsNavigationItem(
      {Key? key,
      required BuildContext context,
      required IconInfo iconInfo,
      required String label})
      : super(
          key: key,
          label: label,
          icon: _buildIcon(context, iconInfo),
          selectedIcon: _buildSelectedIcon(context, iconInfo),
        );

  static Widget _buildIcon(BuildContext context, IconInfo iconInfo) {
    var colorScheme = Theme.of(context).colorScheme;
    var colorFilter = ColorFilter.mode(colorScheme.secondary, BlendMode.srcIn);

    switch (iconInfo.iconName.type) {
      case IconType.svg:
        final icon = SvgPicture.asset(
          iconInfo.iconName.iconFile,
          colorFilter: colorFilter,
        );
        return iconInfo.badge.isNotEmpty
            ? Badge(label: Text(iconInfo.badge), child: icon)
            : icon;
      case IconType.icon:
        const icon = Icon(Icons.mail);
        return iconInfo.badge.isNotEmpty
            ? Badge(label: Text(iconInfo.badge), child: const Icon(Icons.mail))
            : icon;
    }
  }

  static Widget _buildSelectedIcon(BuildContext context, IconInfo iconInfo) {
    final colorScheme = Theme.of(context).colorScheme;
    var activeColorFilter =
        ColorFilter.mode(colorScheme.primary, BlendMode.srcIn);

    switch (iconInfo.iconName.type) {
      case IconType.svg:
        final icon = SvgPicture.asset(
          iconInfo.iconName.iconFile,
          colorFilter: activeColorFilter,
        );
        return iconInfo.badge.isNotEmpty
            ? Badge(label: Text(iconInfo.badge), child: icon)
            : icon;
      case IconType.icon:
        const icon = Icon(Icons.mail);
        return iconInfo.badge.isNotEmpty
            ? Badge(label: Text(iconInfo.badge), child: const Icon(Icons.mail))
            : icon;
    }
  }
}
*/

enum IconType { svg, icon }

class OdsBottomNavigationItemIcon {
  final IconName iconName;
  final String badge;

  OdsBottomNavigationItemIcon({
    required this.iconName,
    this.badge = "",
  });
}

class IconName {
  final dynamic iconFile;
  final IconType type;

  IconName({
    required this.iconFile,
    required this.type,
  });
}

class OdsNavigationItem extends NavigationDestination {
  OdsNavigationItem({
    Key? key,
    required OdsBottomNavigationItemIcon iconDetail,
    required String label,
    required BuildContext context,
  }) : super(
          key: key,
          label: label,
          icon: _buildIcons(iconDetail, context),
          selectedIcon: _buildSelectedIcon(iconDetail, context),
        );

  static Widget _buildIcons(
      OdsBottomNavigationItemIcon iconInfo, BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var colorFilter = ColorFilter.mode(colorScheme.secondary, BlendMode.srcIn);

    if (iconInfo.iconName.type == IconType.svg) {
      /// If the type is IconType.svg, use the SVG icon
      final icon = SvgPicture.asset(
        iconInfo.iconName.iconFile,
        colorFilter: colorFilter,
      );
      return iconInfo.badge.isNotEmpty
          ? Badge(label: Text(iconInfo.badge), child: icon)
          : icon;
    } else {
      /// If the type is IconType.icon, use the provided icon (of type Icon)
      var icon = iconInfo.iconName.iconFile;
      return iconInfo.badge.isNotEmpty
          ? Badge(label: Text(iconInfo.badge), child: icon)
          : icon;
    }
  }

  static Widget _buildSelectedIcon(
      OdsBottomNavigationItemIcon iconInfo, BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    var activeColorFilter =
        ColorFilter.mode(colorScheme.primary, BlendMode.srcIn);

    if (iconInfo.iconName.type == IconType.svg) {
      /// If the type is IconType.svg, use the SVG icon
      final icon = SvgPicture.asset(
        iconInfo.iconName.iconFile,
        colorFilter: activeColorFilter,
      );
      return iconInfo.badge.isNotEmpty
          ? Badge(label: Text(iconInfo.badge), child: icon)
          : icon;
    } else {
      /// If the type is IconType.icon, use the provided icon (of type Icon)
      var icon = iconInfo.iconName.iconFile;
      return iconInfo.badge.isNotEmpty
          ? Badge(label: Text(iconInfo.badge), child: icon)
          : icon;
    }
  }
}
