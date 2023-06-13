import 'package:flutter/material.dart';

class _NavigationBarCustomization extends InheritedWidget {
  _NavigationBarCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final NavigationBarCustomizationState data;

  @override
  bool updateShouldNotify(_NavigationBarCustomization oldWidget) => true;
}

class NavigationBarCustomization extends StatefulWidget {
  const NavigationBarCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  NavigationBarCustomizationState createState() => NavigationBarCustomizationState();

  static NavigationBarCustomizationState? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_NavigationBarCustomization>())?.data;
  }
}

class NavigationBarCustomizationState extends State<NavigationBarCustomization> {
  static get minNavigationItemCount => 3;

  static get maxNavigationItemCount => 5;

  int _numberOfItems = minNavigationItemCount;

  int get numberOfItems => _numberOfItems;

  set numberOfItems(int value) {
    setState(() {
      _numberOfItems = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _NavigationBarCustomization(
      data: this,
      child: widget.child,
    );
  }
}
