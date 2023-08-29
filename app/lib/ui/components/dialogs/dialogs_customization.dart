import 'package:flutter/material.dart';

class _DialogsCustomization extends InheritedWidget {
  _DialogsCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final DialogsCustomizationState data;

  @override
  bool updateShouldNotify(_DialogsCustomization oldWidget) => true;
}

class DialogsCustomization extends StatefulWidget {
  const DialogsCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  DialogsCustomizationState createState() => DialogsCustomizationState();

  static DialogsCustomizationState? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_DialogsCustomization>())
        ?.data;
  }
}

class DialogsCustomizationState extends State<DialogsCustomization> {
  bool _hasTitle = true;
  bool _hasDismissButton = true;

  bool get hasTitle => _hasTitle;
  set hasTitle(bool value) {
    setState(() {
      _hasTitle = value;
    });
  }

  bool get hasDismissButton => _hasDismissButton;
  set hasDismissButton(bool value) {
    setState(() {
      _hasDismissButton = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _DialogsCustomization(
      data: this,
      child: widget.child,
    );
  }
}