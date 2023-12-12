import 'package:flutter/material.dart';

class _ComponentTopAppBarsCustomization extends InheritedWidget {
  _ComponentTopAppBarsCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final ComponentTopAppBarsCustomizationState data;

  @override
  bool updateShouldNotify(_ComponentTopAppBarsCustomization oldWidget) => true;
}

class ComponentTopAppBarsCustomization extends StatefulWidget {
  const ComponentTopAppBarsCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  ComponentTopAppBarsCustomizationState createState() =>
      ComponentTopAppBarsCustomizationState();

  static ComponentTopAppBarsCustomizationState? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<
            _ComponentTopAppBarsCustomization>())
        ?.data;
  }
}

class ComponentTopAppBarsCustomizationState
    extends State<ComponentTopAppBarsCustomization> {
  bool _navigationIcon = true;
  static get minNavigationItemCount => 0;
  static get maxNavigationItemCount => 3;

  bool get navigationIcon => _navigationIcon;
  set navigationIcon(bool value) {
    setState(() {
      _navigationIcon = value;
    });
  }

  int _numberOfItems = minNavigationItemCount;

  int get numberOfItems => _numberOfItems;

  set numberOfItems(int value) {
    setState(() {
      _numberOfItems = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _ComponentTopAppBarsCustomization(
      data: this,
      child: widget.child,
    );
  }
}
