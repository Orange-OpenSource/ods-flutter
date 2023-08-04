import 'package:flutter/material.dart';
import 'package:ods_flutter_demo/ui/components/sheets_bottom/sheets_bottom_enum.dart';

class _SheetsBottomCustomization extends InheritedWidget {
  _SheetsBottomCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final SheetsBottomCustomizationState data;

  @override
  bool updateShouldNotify(_SheetsBottomCustomization oldWidget) => true;
}

class SheetsBottomCustomization extends StatefulWidget {
  const SheetsBottomCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  SheetsBottomCustomizationState createState() =>
      SheetsBottomCustomizationState();

  static SheetsBottomCustomizationState? of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<_SheetsBottomCustomization>())
        ?.data;
  }
}

class SheetsBottomCustomizationState extends State<SheetsBottomCustomization> {
  bool _hasEnabled = true;
  bool _hasIcon = true;

  List<SheetsBottomEnum> _elements = [
    SheetsBottomEnum.empty,
    SheetsBottomEnum.example,
  ];
  SheetsBottomEnum _selectedElement = SheetsBottomEnum.empty;

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

  List<SheetsBottomEnum> get elements => _elements;
  set elements(List<SheetsBottomEnum> value) {
    setState(() {
      _elements = value;
    });
  }

  SheetsBottomEnum get selectedElement => _selectedElement;

  set selectedElement(SheetsBottomEnum value) {
    setState(() {
      _selectedElement = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _SheetsBottomCustomization(
      data: this,
      child: widget.child,
    );
  }
}
