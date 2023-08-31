import 'package:flutter/material.dart';

class _CheckboxesCustomization extends InheritedWidget {
  _CheckboxesCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final CheckboxesCustomizationState data;

  @override
  bool updateShouldNotify(_CheckboxesCustomization oldWidget) => true;
}

class CheckboxesCustomization extends StatefulWidget {
  const CheckboxesCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  CheckboxesCustomizationState createState() => CheckboxesCustomizationState();

  static CheckboxesCustomizationState? of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<_CheckboxesCustomization>())
        ?.data;
  }
}

class CheckboxesCustomizationState extends State<CheckboxesCustomization> {
  bool _hasEnabled = true;

  bool get hasEnabled => _hasEnabled;
  set hasEnabled(bool value) {
    setState(() {
      _hasEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _CheckboxesCustomization(
      data: this,
      child: widget.child,
    );
  }
}
