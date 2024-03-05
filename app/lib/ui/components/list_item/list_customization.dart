/*
 * Software Name : Orange Design System
 * SPDX-FileCopyrightText: Copyright (c) Orange SA
 * SPDX-License-Identifier: MIT
 *
 * This software is distributed under the MIT license,
 * the text of which is available at https://opensource.org/license/MIT/
 * or see the "LICENSE" file for more details.
 *
 * Software description: Flutter library of reusable graphical components for Android and iOS
 */

import 'package:flutter/material.dart';
import 'package:ods_flutter_demo/ui/components/list_item/list_leading_enum.dart';
import 'package:ods_flutter_demo/ui/components/list_item/list_trailing_enum.dart';

class _ListCustomization extends InheritedWidget {
  _ListCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final ListCustomizationState data;

  @override
  bool updateShouldNotify(_ListCustomization oldWidget) => true;
}

class ListCustomization extends StatefulWidget {
  const ListCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  ListCustomizationState createState() => ListCustomizationState();

  static ListCustomizationState? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_ListCustomization>())
        ?.data;
  }
}

class ListCustomizationState extends State<ListCustomization> {
  bool _hasSubtitle = true;

  ///Leading Enum
  List<ListLeadingEnum> _leadingElements = [
    ListLeadingEnum.none,
    ListLeadingEnum.icon,
    ListLeadingEnum.circle,
    ListLeadingEnum.wide,
    ListLeadingEnum.square,
  ];
  ListLeadingEnum _selectedLeadingElement = ListLeadingEnum.circle;

  ///Trailing Enum
  List<ListTrailingEnum> _trailingElements = [
    ListTrailingEnum.none,
    ListTrailingEnum.trailingSwitch,
    ListTrailingEnum.trailingCheckbox,
    ListTrailingEnum.trailingText,
    ListTrailingEnum.trailingInfoButton,
  ];
  ListTrailingEnum _selectedTrailingElement = ListTrailingEnum.none;

  bool get hasSubtitle => _hasSubtitle;
  set hasSubtitle(bool value) {
    setState(() {
      _hasSubtitle = value;
    });
  }

  ///Leading Enum
  List<ListLeadingEnum> get leadingElements => _leadingElements;
  set leadingElements(List<ListLeadingEnum> value) {
    setState(() {
      _leadingElements = value;
    });
  }

  ListLeadingEnum get selectedLeadingElement => _selectedLeadingElement;

  set selectedLeadingElement(ListLeadingEnum value) {
    setState(() {
      _selectedLeadingElement = value;
    });
  }

  ///Trailing Enum
  List<ListTrailingEnum> get trailingElements => _trailingElements;
  set trailingElements(List<ListTrailingEnum> value) {
    setState(() {
      _trailingElements = value;
    });
  }

  ListTrailingEnum get selectedTrailingElement => _selectedTrailingElement;

  set selectedTrailingElement(ListTrailingEnum value) {
    setState(() {
      _selectedTrailingElement = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _ListCustomization(
      data: this,
      child: widget.child,
    );
  }
}
