import 'package:flutter/material.dart';

class _ComponentSnackbarsCustomization extends InheritedWidget {
  _ComponentSnackbarsCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final ComponentSnackbarsCustomizationState data;

  @override
  bool updateShouldNotify(_ComponentSnackbarsCustomization oldWidget) => true;
}

class ComponentSnackbarsCustomization extends StatefulWidget {
  const ComponentSnackbarsCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  ComponentSnackbarsCustomizationState createState() =>
      ComponentSnackbarsCustomizationState();

  static ComponentSnackbarsCustomizationState? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<
            _ComponentSnackbarsCustomization>())
        ?.data;
  }
}

class ComponentSnackbarsCustomizationState
    extends State<ComponentSnackbarsCustomization> {
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
    return _ComponentSnackbarsCustomization(
      data: this,
      child: widget.child,
    );
  }
}
