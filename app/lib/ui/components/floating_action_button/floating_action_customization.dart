import 'package:flutter/material.dart';

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
  bool _hasDefault = true;
  bool _hasSmall = true;
  bool _hasLarge = true;
  bool _hasExtended = true;

  bool get hasDefault => _hasDefault;
  set hasDefault(bool value) {
    setState(() {
      _hasDefault = value;
    });
  }

  bool get hasSmall => _hasSmall;
  set hasSmall(bool value) {
    setState(() {
      _hasSmall = value;
    });
  }

  bool get hasLarge => _hasLarge;
  set hasLarge(bool value) {
    setState(() {
      _hasLarge = value;
    });
  }

  bool get hasExtended => _hasExtended;
  set hasExtended(bool value) {
    setState(() {
      _hasExtended = value;
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
