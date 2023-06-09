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
    return Column(
      children: [
        AppBar(
          title: title,
          leading: leading,
          actions: [
            IconButton(
              iconSize: 32,
              icon: const Icon(Icons.account_circle_outlined),
              onPressed: () {},
            ),
          ],
          centerTitle: true,
          toolbarHeight: 64, // Customize the toolbar height as needed
        ),
        const SizedBox(height: 16),
        AppBar(
          title: title,
          leading: leading,
          actions: actions,
          centerTitle: false,
          toolbarHeight: 64, // Customize the toolbar height as needed
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: CustomScrollView(
            slivers: [
              SliverAppBar.medium(
                title: title,
                leading: leading,
                actions: actions,
                toolbarHeight: 64, // Customize the toolbar height as needed
              ),
              const SliverFillRemaining(),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 130,
          child: CustomScrollView(
            slivers: [
              SliverAppBar.large(
                title: title,
                leading: leading,
                actions: actions,
                toolbarHeight: 64, // Customize the toolbar height as needed
              ),
              const SliverFillRemaining(),
            ],
          ),
        ),
      ],
    );
  }
}
