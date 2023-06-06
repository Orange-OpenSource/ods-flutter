import 'package:flutter/material.dart';

class _CardCustomization extends InheritedWidget {
  _CardCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final CardCustomizationState data;

  @override
  bool updateShouldNotify(_CardCustomization oldWidget) => true;
}

class CardCustomization extends StatefulWidget {
  const CardCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  CardCustomizationState createState() => CardCustomizationState();

  static CardCustomizationState? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_CardCustomization>())?.data;
  }
}

class CardCustomizationState extends State<CardCustomization> {
  bool _hasSubtitle = true;
  bool _clickable = true;

  bool get hasSubtitle => _hasSubtitle;
  set hasSubtitle(bool value) {
    setState(() {
      _hasSubtitle = value;
    });
  }

  bool get clickable => _clickable;
  set clickable(bool value) {
    setState(() {
      _clickable = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _CardCustomization(
      data: this,
      child: widget.child,
    );
  }
}
