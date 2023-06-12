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
  bool _hasSubtitle = true;
  bool _clickable = true;

  bool get hasSubtitle => _hasSubtitle;
  set hasSubtitle(bool value) {
    setState(() {
      _hasSubtitle = value;
    });
  }

  bool get clickable => _clickable;
  set clickable(bool value) {
    setState(() {
      _clickable = value;
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
