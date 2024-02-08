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
import 'package:ods_flutter_demo/ui/components/textfields/enum/keyboard_enum.dart';
import 'package:ods_flutter_demo/ui/components/textfields/enum/textfield_enum.dart';

class _TextFieldCustomization extends InheritedWidget {
  _TextFieldCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final TextFieldCustomizationState data;

  @override
  bool updateShouldNotify(_TextFieldCustomization oldWidget) => true;
}

class TextFieldCustomization extends StatefulWidget {
  const TextFieldCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  TextFieldCustomizationState createState() => TextFieldCustomizationState();

  static TextFieldCustomizationState? of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<_TextFieldCustomization>())
        ?.data;
  }
}

class TextFieldCustomizationState extends State<TextFieldCustomization> {
  ///
  ///
  /// TEXTFIELD
  ///
  ///

  bool _leadingIcon = false;
  bool _characterCount = false;

  bool get characterCount => _characterCount;
  set characterCount(bool value) {
    setState(() {
      _characterCount = value;
    });
  }

  bool get leadingIcon => _leadingIcon;
  set leadingIcon(bool value) {
    setState(() {
      _leadingIcon = value;
    });
  }

  ///Input Type
  List<TextFieldEnum> _elements = [
    TextFieldEnum.single,
    TextFieldEnum.multi,
  ];
  TextFieldEnum _selectedElement = TextFieldEnum.single;

  List<TextFieldEnum> get elements => _elements;
  set elements(List<TextFieldEnum> value) {
    setState(() {
      _elements = value;
    });
  }

  TextFieldEnum get selectedElement => _selectedElement;

  set selectedElement(TextFieldEnum value) {
    setState(() {
      _selectedElement = value;
    });
  }

  /// State
  List<TextFieldStateEnum> _states = [
    TextFieldStateEnum.stateDefault,
    TextFieldStateEnum.error,
    TextFieldStateEnum.disabled,
  ];
  TextFieldStateEnum _selectedState = TextFieldStateEnum.stateDefault;

  List<TextFieldStateEnum> get states => _states;
  set states(List<TextFieldStateEnum> value) {
    setState(() {
      _states = value;
    });
  }

  TextFieldStateEnum get selectedState => _selectedState;

  set selectedState(TextFieldStateEnum value) {
    setState(() {
      _selectedState = value;
    });
  }

  /// Trailing
  List<TextFieldTrailingEnum> _trailings = [
    TextFieldTrailingEnum.none,
    TextFieldTrailingEnum.icon,
    TextFieldTrailingEnum.text,
  ];
  TextFieldTrailingEnum _selectedTrailing = TextFieldTrailingEnum.none;

  List<TextFieldTrailingEnum> get trailings => _trailings;
  set trailings(List<TextFieldTrailingEnum> value) {
    setState(() {
      _trailings = value;
    });
  }

  TextFieldTrailingEnum get selectedTrailing => _selectedTrailing;

  set selectedTrailing(TextFieldTrailingEnum value) {
    setState(() {
      _selectedTrailing = value;
    });
  }

  ///
  ///
  /// KEYBOARD TYPE
  ///
  ///

  bool _capitalization = false;

  bool get capitalization => _capitalization;
  set capitalization(bool value) {
    setState(() {
      _capitalization = value;
    });
  }

  /// Keyboard Type
  List<KeyboardTypeEnum> _keyboardTypes = [
    KeyboardTypeEnum.text,
    KeyboardTypeEnum.decimal,
    KeyboardTypeEnum.email,
    KeyboardTypeEnum.number,
    KeyboardTypeEnum.phone,
    KeyboardTypeEnum.url,
  ];
  KeyboardTypeEnum _selectedKeyboardType = KeyboardTypeEnum.text;

  List<KeyboardTypeEnum> get keyboardTypes => _keyboardTypes;
  set keyboardTypes(List<KeyboardTypeEnum> value) {
    setState(() {
      _keyboardTypes = value;
    });
  }

  KeyboardTypeEnum get selectedKeyboardType => _selectedKeyboardType;

  set selectedKeyboardType(KeyboardTypeEnum value) {
    setState(() {
      _selectedKeyboardType = value;
    });
  }

  /// Keyboard Action
  List<KeyboardActionEnum> _keyboardActions = [
    KeyboardActionEnum.none,
    KeyboardActionEnum.defaultAction,
    KeyboardActionEnum.done,
    KeyboardActionEnum.go,
    KeyboardActionEnum.search,
    KeyboardActionEnum.send,
    KeyboardActionEnum.previous,
    KeyboardActionEnum.next,
  ];
  KeyboardActionEnum _selectedKeyboardAction = KeyboardActionEnum.none;

  List<KeyboardActionEnum> get keyboardActions => _keyboardActions;
  set keyboardActions(List<KeyboardActionEnum> value) {
    setState(() {
      _keyboardActions = value;
    });
  }

  KeyboardActionEnum get selectedKeyboardAction => _selectedKeyboardAction;

  set selectedKeyboardAction(KeyboardActionEnum value) {
    setState(() {
      _selectedKeyboardAction = value;
    });
  }

  ///
  ///
  /// PASSWORD TEXTFIELD
  ///
  ///
  ///

  bool _visualisationIcon = true;

  bool get visualisationIcon => _visualisationIcon;
  set visualisationIcon(bool value) {
    setState(() {
      _visualisationIcon = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _TextFieldCustomization(
      data: this,
      child: widget.child,
    );
  }
}
