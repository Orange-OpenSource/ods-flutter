import 'package:flutter/material.dart';
import 'package:ods_flutter_demo/ui/components/floating_action_button/floating_action_button_enum.dart';

class _FloatingActionButtonCustomization extends InheritedWidget {
  _FloatingActionButtonCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final FloatingActionButtonCustomizationState data;

  @override
  bool updateShouldNotify(_FloatingActionButtonCustomization oldWidget) => true;
}

class FloatingActionButtonCustomization extends StatefulWidget {
  const FloatingActionButtonCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  FloatingActionButtonCustomizationState createState() =>
      FloatingActionButtonCustomizationState();

  static FloatingActionButtonCustomizationState? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<
            _FloatingActionButtonCustomization>())
        ?.data;
  }
}

class FloatingActionButtonCustomizationState
    extends State<FloatingActionButtonCustomization> {
  List<FloatingActionButtonEnum> _elements = [
    FloatingActionButtonEnum.defaultFab,
    FloatingActionButtonEnum.smallFab,
    FloatingActionButtonEnum.largeFab,
    FloatingActionButtonEnum.extendedFab,
  ];
  FloatingActionButtonEnum _selectedElement =
      FloatingActionButtonEnum.defaultFab;

  List<FloatingActionButtonEnum> get elements => _elements;
  set elements(List<FloatingActionButtonEnum> value) {
    setState(() {
      _elements = value;
    });
  }

  FloatingActionButtonEnum get selectedElement => _selectedElement;

  set selectedElement(FloatingActionButtonEnum value) {
    setState(() {
      _selectedElement = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _FloatingActionButtonCustomization(
      data: this,
      child: widget.child,
    );
  }
}
