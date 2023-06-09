import 'package:flutter/material.dart';

class OdsAppTopBars extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool useSliverAppBar;

  const OdsAppTopBars({
    Key? key,
    this.title,
    this.leading,
    this.actions,
    this.centerTitle = false,
    this.useSliverAppBar = false,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      title: title,
      leading: leading,
      actions: actions,
      toolbarHeight: 64, // Customize the toolbar height as needed
    );
  }
}
