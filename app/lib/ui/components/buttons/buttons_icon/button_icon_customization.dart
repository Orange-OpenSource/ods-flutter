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
import 'package:ods_flutter_demo/ui/components/buttons/buttons_icon/button_icon_enum.dart';

class _ButtonIconCustomization extends InheritedWidget {
  _ButtonIconCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final ButtonIconCustomizationState data;

  @override
  bool updateShouldNotify(_ButtonIconCustomization oldWidget) => true;
}

class ButtonIconCustomization extends StatefulWidget {
  const ButtonIconCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  ButtonIconCustomizationState createState() => ButtonIconCustomizationState();

  static ButtonIconCustomizationState? of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<_ButtonIconCustomization>())
        ?.data;
  }
}

class ButtonIconCustomizationState extends State<ButtonIconCustomization> {
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
  List<ButtonsIconEnum> _style = [
    ButtonsIconEnum.functionalStandard,
    ButtonsIconEnum.functionalFilled,
    ButtonsIconEnum.functionalTonal,
    ButtonsIconEnum.functionalOutlined,
  ];
  ButtonsIconEnum _selectedStyle = ButtonsIconEnum.functionalStandard;

  ///Style Enum
  List<ButtonsIconEnum> get style => _style;
  set style(List<ButtonsIconEnum> value) {
    setState(() {
      _style = value;
    });
  }

  ButtonsIconEnum get selectedStyle => _selectedStyle;

  set selectedStyle(ButtonsIconEnum value) {
    setState(() {
      _selectedStyle = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _ButtonIconCustomization(
      data: this,
      child: widget.child,
    );
  }
}
