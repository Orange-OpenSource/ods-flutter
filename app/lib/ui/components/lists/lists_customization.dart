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
import 'package:ods_flutter_demo/ui/components/lists/lists_leading_enum.dart';
import 'package:ods_flutter_demo/ui/components/lists/lists_trailing_enum.dart';

class _ListsCustomization extends InheritedWidget {
  _ListsCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final ListsCustomizationState data;

  @override
  bool updateShouldNotify(_ListsCustomization oldWidget) => true;
}

class ListsCustomization extends StatefulWidget {
  const ListsCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  ListsCustomizationState createState() => ListsCustomizationState();

  static ListsCustomizationState? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_ListsCustomization>())
        ?.data;
  }
}

class ListsCustomizationState extends State<ListsCustomization> {
  bool _hasSubtitle = true;

  ///Leading Enum
  List<ListsLeadingEnum> _leadingElements = [
    ListsLeadingEnum.none,
    ListsLeadingEnum.icon,
    ListsLeadingEnum.circle,
    ListsLeadingEnum.wide,
    ListsLeadingEnum.square,
  ];
  ListsLeadingEnum _selectedLeadingElement = ListsLeadingEnum.circle;

  ///Trailing Enum
  List<ListsTrailingEnum> _trailingElements = [
    ListsTrailingEnum.none,
    ListsTrailingEnum.trailingSwitch,
    ListsTrailingEnum.trailingCheckbox,
  ];
  ListsTrailingEnum _selectedTrailingElement = ListsTrailingEnum.none;

  ///Trailing Standard Enum
  List<ListsTrailingEnum> _trailingStandardElements = [
    ListsTrailingEnum.none,
    ListsTrailingEnum.trailingText,
    ListsTrailingEnum.trailingInfoButton,
  ];
  ListsTrailingEnum _selectedTrailingStandardElement = ListsTrailingEnum.none;

  bool get hasSubtitle => _hasSubtitle;
  set hasSubtitle(bool value) {
    setState(() {
      _hasSubtitle = value;
    });
  }

  ///Leading Enum
  List<ListsLeadingEnum> get leadingElements => _leadingElements;
  set leadingElements(List<ListsLeadingEnum> value) {
    setState(() {
      _leadingElements = value;
    });
  }

  ListsLeadingEnum get selectedLeadingElement => _selectedLeadingElement;

  set selectedLeadingElement(ListsLeadingEnum value) {
    setState(() {
      _selectedLeadingElement = value;
    });
  }

  ///Trailing Enum
  List<ListsTrailingEnum> get trailingElements => _trailingElements;
  set trailingElements(List<ListsTrailingEnum> value) {
    setState(() {
      _trailingElements = value;
    });
  }

  ListsTrailingEnum get selectedTrailingElement => _selectedTrailingElement;

  set selectedTrailingElement(ListsTrailingEnum value) {
    setState(() {
      _selectedTrailingElement = value;
    });
  }

  ///Trailing Standard Enum
  List<ListsTrailingEnum> get trailingStandardElements =>
      _trailingStandardElements;
  set trailingStandardElements(List<ListsTrailingEnum> value) {
    setState(() {
      _trailingStandardElements = value;
    });
  }

  ListsTrailingEnum get selectedTrailingStandardElement =>
      _selectedTrailingStandardElement;

  set selectedTrailingStandardElement(ListsTrailingEnum value) {
    setState(() {
      _selectedTrailingStandardElement = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _ListsCustomization(
      data: this,
      child: widget.child,
    );
  }
}
