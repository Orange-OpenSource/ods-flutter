import 'package:flutter/material.dart';

class _ButtonCustomization extends InheritedWidget {
  _ButtonCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final ButtonCustomizationState data;

  @override
  bool updateShouldNotify(_ButtonCustomization oldWidget) => true;
}

class ButtonCustomization extends StatefulWidget {
  const ButtonCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  ButtonCustomizationState createState() => ButtonCustomizationState();

  static ButtonCustomizationState? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_ButtonCustomization>())
        ?.data;
  }
}

class ButtonCustomizationState extends State<ButtonCustomization> {
  bool _hasIcon = true;
  bool _hasFullScreen = true;
  bool _hasEnabled = true;

  bool get hasIcon => _hasIcon;
  set hasIcon(bool value) {
    setState(() {
      _hasIcon = value;
    });
  }

  bool get hasFullScreen => _hasFullScreen;
  set hasFullScreen(bool value) {
    setState(() {
      _hasFullScreen = value;
    });
  }

  bool get hasEnabled => _hasEnabled;
  set hasEnabled(bool value) {
    setState(() {
      _hasEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _ButtonCustomization(
      data: this,
      child: widget.child,
    );
  }
}
