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
import 'package:ods_flutter_demo/ui/components/buttons/button_enum.dart';

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
  bool _hasIcon = false;
  bool _hasFullScreen = false;
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

  ///Functional Enum
  List<ButtonsEnum> _functionalType = [
    ButtonsEnum.functionalPositive,
    ButtonsEnum.functionalNegative,
  ];
  ButtonsEnum _selectedFunctionalType = ButtonsEnum.functionalPositive;

  ///Functional Enum
  List<ButtonsEnum> get functionalType => _functionalType;
  set functionalType(List<ButtonsEnum> value) {
    setState(() {
      _functionalType = value;
    });
  }

  ButtonsEnum get selectedFunctionalType => _selectedFunctionalType;

  set selectedFunctionalType(ButtonsEnum value) {
    setState(() {
      _selectedFunctionalType = value;
    });
  }

  ///Style Enum
  List<ButtonsEnum> _style = [
    ButtonsEnum.functionalPrimary,
    ButtonsEnum.functionalDefault,
  ];
  ButtonsEnum _selectedStyle = ButtonsEnum.functionalDefault;

  ///Style Enum
  List<ButtonsEnum> get style => _style;
  set style(List<ButtonsEnum> value) {
    setState(() {
      _style = value;
    });
  }

  ButtonsEnum get selectedStyle => _selectedStyle;

  set selectedStyle(ButtonsEnum value) {
    setState(() {
      _selectedStyle = value;
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
