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
import 'package:ods_flutter/guidelines/spacings.dart';

/// ODS OdsTextField.
///
/// A text field lets the user enter text, either with hardware keyboard or with an onscreen keyboard.
///
///.
class OdsTextField extends StatefulWidget {
  /// A controller for an editable text field
  final TextEditingController? controller;

  /// Called when the user selects a value from the popup menu created by this button
  final Function(String)? onClick;

  /// If false the text field is disabled. It ignores taps and its decoration is rendered in grey
  final bool? enabled;

  /// Controls the editable state of the text field.
  /// When `true`, the text field can not be modified, however, a user can focus it and copy text from it.
  /// Read-only text fields are usually used to display pre-filled forms that user can not edit.
  final bool readOnly;

  /// If non-null, the border's color animates to red and the [helperText] is
  /// not shown.
  final String? errorMessage;

  /// Label to be displayed inside or outside the text field.
  final String? label;

  /// Placeholder to be displayed when the text field is in focus and the input text is empty.
  final String? placeholder;

  /// Software keyboard options that contains configuration such as `KeyboardType` and `ImeAction`
  final TextInputType? keyboardType;

  /// When the input service emits an IME action, the corresponding callback is called.
  final TextInputAction? keyboardActions;

  /// Trailing text to display at the end of the text field
  final String? trailingText;

  /// Trailing icon to display at the end of the text field
  final Widget? trailingIcon;

  /// Icon displayed at the beginning of the text field container
  final Widget? leadingIcon;

  /// Character counter displayed below the text field
  final int? characterCounter;

  /// The maximum number of lines to show at one time, wrapping if necessary.
  final int? maxLines;

  /// Configures how the platform keyboard will select an uppercase or lowercase keyboard
  final bool? textCapitalization;

  /// Callback that is triggered when the input service updates the text. An updated text comes as a parameter of the callback
  final Function(String)? onValueChange;

  const OdsTextField({
    Key? key,
    this.controller,
    this.onClick,
    this.enabled,
    this.readOnly = false,
    this.errorMessage,
    this.label,
    this.placeholder,
    this.keyboardType,
    this.keyboardActions,
    this.trailingText,
    this.trailingIcon,
    this.leadingIcon,
    this.characterCounter,
    this.maxLines,
    this.textCapitalization = false,
    this.onValueChange,
  }) : super(key: key);

  @override
  State<OdsTextField> createState() => _OdsTextFieldState();
}

class _OdsTextFieldState extends State<OdsTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Semantics(
        child: TextField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          textInputAction: widget.keyboardActions,
          onChanged: widget.onValueChange,
          textCapitalization: widget.textCapitalization == true
              ? TextCapitalization.characters
              : TextCapitalization.none,
          keyboardAppearance: Theme.of(context).brightness == Brightness.dark
              ? Brightness.dark
              : Brightness.light,
          maxLength: widget.characterCounter,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          minLines: widget.maxLines != null ? 1 : null,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            prefixIcon: widget.leadingIcon,
            suffixIcon: widget.trailingText != null
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(
                        spacingM, spacingM, spacingM, spacingM),
                    child: Text(
                      widget.trailingText!,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                  )
                : widget.trailingIcon,
            labelText: widget.label,
            hintText: widget.placeholder,
            errorText: widget.errorMessage,
            border: const OutlineInputBorder(),
            filled: false,
          ),
        ),
      ),
    );
  }
}
