import 'package:flutter/material.dart';

class _SwitchesCustomization extends InheritedWidget {
  _SwitchesCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final SwitchesCustomizationState data;

  @override
  bool updateShouldNotify(_SwitchesCustomization oldWidget) => true;
}

class SwitchesCustomization extends StatefulWidget {
  const SwitchesCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  SwitchesCustomizationState createState() => SwitchesCustomizationState();

  static SwitchesCustomizationState? of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<_SwitchesCustomization>())
        ?.data;
  }
}

class SwitchesCustomizationState extends State<SwitchesCustomization> {
  bool _hasEnabled = true;
  bool _hasIcon = true;

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

  @override
  Widget build(BuildContext context) {
    return _SwitchesCustomization(
      data: this,
      child: widget.child,
    );
  }
}
