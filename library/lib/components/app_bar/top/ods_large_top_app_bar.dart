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
          title: Text(title),
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
