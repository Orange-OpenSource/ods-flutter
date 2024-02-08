import 'package:flutter/material.dart';
import 'package:ods_flutter_demo/ui/components/buttons/segmented/segmented_button_enum.dart';

class _SegmentedButtonCustomization extends InheritedWidget {
  _SegmentedButtonCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final SegmentedButtonCustomizationState data;

  @override
  bool updateShouldNotify(_SegmentedButtonCustomization oldWidget) => true;
}

class SegmentedButtonCustomization extends StatefulWidget {
  const SegmentedButtonCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  SegmentedButtonCustomizationState createState() =>
      SegmentedButtonCustomizationState();

  static SegmentedButtonCustomizationState? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<
            _SegmentedButtonCustomization>())
        ?.data;
  }
}

class SegmentedButtonCustomizationState
    extends State<SegmentedButtonCustomization> {
  static get minNavigationItemCount => 2;
  static get maxNavigationItemCount => 5;
  bool _hasIcon = true;
  bool _hasEnabled = true;

  int _numberOfItems = minNavigationItemCount;
  int get numberOfItems => _numberOfItems;

  set numberOfItems(int value) {
    setState(() {
      _numberOfItems = value;
    });
  }

  bool get hasIcon => _hasIcon;
  set hasIcon(bool value) {
    setState(() {
      _hasIcon = value;
    });
  }

  bool get hasEnabled => _hasEnabled;
  set hasEnabled(bool value) {
    setState(() {
      _hasEnabled = value;
    });
  }

  /// Segmented Button
  List<SegmentedButtonsEnum> _elements = [
    SegmentedButtonsEnum.multi,
    SegmentedButtonsEnum.single,
  ];
  SegmentedButtonsEnum _selectedElement = SegmentedButtonsEnum.single;

  List<SegmentedButtonsEnum> get elements => _elements;
  set elements(List<SegmentedButtonsEnum> value) {
    setState(() {
      _elements = value;
    });
  }

  SegmentedButtonsEnum get selectedElement => _selectedElement;

  set selectedElement(SegmentedButtonsEnum value) {
    setState(() {
      _selectedElement = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _SegmentedButtonCustomization(
      data: this,
      child: widget.child,
    );
  }
}
