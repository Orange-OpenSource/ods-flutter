import 'package:flutter/material.dart';

class _TabsCustomization extends InheritedWidget {
  _TabsCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final TabsCustomizationState data;

  @override
  bool updateShouldNotify(_TabsCustomization oldWidget) => true;
}

class TabsCustomization extends StatefulWidget {
  const TabsCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  TabsCustomizationState createState() => TabsCustomizationState();

  static TabsCustomizationState? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_TabsCustomization>())
        ?.data;
  }
}

class TabsCustomizationState extends State<TabsCustomization> {
  static get minTabItemCount => 2;

  static get maxTabItemCount => 5;

  int _numberOfItems = minTabItemCount;

  int get numberOfItems => _numberOfItems;

  set numberOfItems(int value) {
    setState(() {
      _numberOfItems = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _TabsCustomization(
      data: this,
      child: widget.child,
    );
  }
}
