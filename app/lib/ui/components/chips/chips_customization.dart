import 'package:flutter/material.dart';
import 'package:ods_flutter_demo/ui/components/chips/chips_enum.dart';

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

  List<ChipsEnum> _elements = [
    ChipsEnum.none,
    ChipsEnum.avatar,
    ChipsEnum.icon,
  ];
  ChipsEnum _selectedElement = ChipsEnum.none;

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

  List<ChipsEnum> get elements => _elements;
  set elements(List<ChipsEnum> value) {
    setState(() {
      _elements = value;
    });
  }

  ChipsEnum get selectedElement => _selectedElement;

  set selectedElement(ChipsEnum value) {
    setState(() {
      _selectedElement = value;
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
