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
  bool _hasActionButton = true;
  bool _hasTwoLines = false;
  bool _hasSingleLine = true;
  bool _hasLongerAction = true;

  bool get hasActionButton => _hasActionButton;
  set hasActionButton(bool value) {
    setState(() {
      _hasActionButton = value;
    });
  }

  bool get hasSingleLine => _hasSingleLine;
  set hasSingleLine(bool value) {
    setState(() {
      _hasSingleLine = value;
    });
  }

  bool get hasTwoLines => _hasTwoLines;
  set hasTwoLines(bool value) {
    setState(() {
      _hasTwoLines = value;
    });
  }

  bool get hasLongerAction => _hasLongerAction;
  set hasLongerAction(bool value) {
    setState(
      () {
        _hasLongerAction = value;
      },
    );
  }

  bool get isActionButtonEnabled => (hasSingleLine || hasTwoLines);

  @override
  Widget build(BuildContext context) {
    return _ComponentSnackbarsCustomization(
      data: this,
      child: widget.child,
    );
  }
}
