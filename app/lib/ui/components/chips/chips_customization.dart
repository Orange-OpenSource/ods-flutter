import 'package:flutter/material.dart';

class _ChipsCustomization extends InheritedWidget {
  _ChipsCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final ChipsCustomizationState data;

  @override
  bool updateShouldNotify(_ChipsCustomization oldWidget) => true;
}

class ChipsCustomization extends StatefulWidget {
  const ChipsCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  ChipsCustomizationState createState() => ChipsCustomizationState();

  static ChipsCustomizationState? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_ChipsCustomization>())
        ?.data;
  }
}

class ChipsCustomizationState extends State<ChipsCustomization> {
  bool _hasEnabled = true;
  bool _hasIcon = true;
  List<String> _elements = ["None", "Avatar", "Icon"];
  int _selectedIndex = 0;

  bool get hasEnabled => _hasEnabled;
  set hasEnabled(bool value) {
    setState(() {
      _hasEnabled = value;
    });
  }

  bool get hasIcon => _hasIcon;
  set hasIcon(bool value) {
    setState(() {
      _hasIcon = value;
    });
  }

  List<String> get elements => _elements;
  set elements(List<String> value) {
    setState(() {
      _elements = value;
    });
  }

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _ChipsCustomization(
      data: this,
      child: widget.child,
    );
  }
}
