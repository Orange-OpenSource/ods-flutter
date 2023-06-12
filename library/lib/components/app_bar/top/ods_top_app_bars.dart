import 'package:flutter/material.dart';

class OdsAppTopBars extends StatefulWidget {

  const OdsAppTopBars({
    Key? key,
    this.title,
    this.leading,
    this.actions,
    this.useSliverAppBar = true,
  }) : super(key: key);


  /// The app bar title displayed.
  final Widget? title;

  /// The widget displayed at the leading edge of the app bar.
  /// TODO: For the moment, the fit of the image is handled by the provided image.
  /// It should be done in the library, but we need help to do that!
  final Widget? leading;

  /// The optional list of actions displayed on the app bar.
  final List<Widget>? actions;

  /// The flag indicating whether to use a SliverAppBar.
  final bool useSliverAppBar;

  @override
  State<OdsAppTopBars> createState() => _OdsAppTopBarsState();
}

class _OdsAppTopBarsState extends State<OdsAppTopBars> {
  @override
  Widget build(BuildContext context) {

    return SliverAppBar.large(
      title: widget.title,
      leading: widget.leading != null ? widget.leading : Container(),
      actions: widget.actions,
      toolbarHeight: 64, // Customize the toolbar height as needed
    );
  }
}
