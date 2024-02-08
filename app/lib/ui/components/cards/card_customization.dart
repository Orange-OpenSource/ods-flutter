/*
 * Software Name : Orange Design System
 * SPDX-FileCopyrightText: Copyright (c) Orange SA
 * SPDX-License-Identifier: MIT
 *
 * This software is distributed under the MIT licence,
 * the text of which is available at https://opensource.org/license/MIT/
 * or see the "LICENSE" file for more details.
 *
 * Software description: Flutter library of reusable graphical components for Android and iOS
 */

import 'package:flutter/material.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_enum.dart';

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
    return (context.dependOnInheritedWidgetOfExactType<_CardCustomization>())
        ?.data;
  }
}

class CardCustomizationState extends State<CardCustomization> {
  static get minNavigationItemCount => 0;

  static get maxNavigationItemCount => 2;

  int _numberOfItems = minNavigationItemCount;

  int get numberOfItems => _numberOfItems;

  set numberOfItems(int value) {
    setState(() {
      _numberOfItems = value;
      updateHasDivider();
    });
  }

  bool _hasSubtitle = true;
  bool _hasText = true;
  bool _hasDivider = false;
  bool _clickable = true;

  bool get hasSubtitle => _hasSubtitle;
  set hasSubtitle(bool value) {
    setState(() {
      _hasSubtitle = value;
    });
  }

  bool get hasText => _hasText;
  set hasText(bool value) {
    setState(() {
      _hasText = value;
    });
  }

  bool get hasDivider => _hasDivider;
  set hasDivider(bool value) {
    setState(() {
      _hasDivider = value;
    });
  }

  bool get clickable => _clickable;
  set clickable(bool value) {
    setState(() {
      _clickable = value;
    });
  }

  List<CardEnum> _elements = [
    CardEnum.start,
    CardEnum.end,
  ];
  CardEnum _selectedElement = CardEnum.start;

  List<CardEnum> get elements => _elements;
  set elements(List<CardEnum> value) {
    setState(() {
      _elements = value;
    });
  }

  CardEnum get selectedElement => _selectedElement;

  set selectedElement(CardEnum value) {
    setState(() {
      _selectedElement = value;
    });
  }

  /// Determine if _hasDivider should be enabled
  void updateHasDivider() {
    setState(() {
      if (_numberOfItems == 0) {
        _hasDivider = false;
      }
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
