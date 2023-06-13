import 'package:flutter/material.dart';
import 'package:ods_flutter_demo/ui/theme/theme_selector.dart';

class OdsAppTopBars extends StatelessWidget implements PreferredSizeWidget {
  const OdsAppTopBars({
    required this.title,
    this.actions,
    this.leading,
  });

  /// The app bar title displayed.
  final String title;

  /// The optional list of actions displayed on the app bar.
  final List<Widget>? actions;

  /// The optional list of actions displayed on the app bar.
  final Widget? leading;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: actions,
      leading: leading ?? Container(),
    );
  }
}
