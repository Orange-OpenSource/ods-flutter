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

/// A button in an [OdsAlertDialog].
///
/// @constructor Creates an instance of [OdsAlertDialogButton].
/// It represents a simple button with a [text]
/// Will be called when the user clicks the button [onClick].
class OdsAlertDialogButton {
  const OdsAlertDialogButton({
    required this.text,
    required this.onClick,
  });

  /// The text label for this button.
  final String text;

  /// The action executed on button click.
  final VoidCallback onClick;
}

/// ODS Design Button.
///
/// Displays a customizable dialog with an optional dismiss button.
/// The dialog can expand to full screen width if specified.
class OdsAlertDialog {
  /// Creates an ODS Alert Dialog.
  ///
  /// * [text] - Text displayed into the dialog which presents the details regarding the Dialog's purpose.
  /// * [confirmButton] - [OdsAlertDialogButton] displayed into the dialog which is meant to confirm a proposed action, thus resolving what triggered the dialog
  /// * [dismissButton] - Button displayed into the dialog which is meant to dismiss the dialog.
  /// * [title] - Title displayed into the dialog which should specify the purpose of the dialog. The title is not mandatory, because there may be sufficient information inside the `text`.
  ///
  ///
  static void openDialog({
    required BuildContext context,
    required String text,
    required OdsAlertDialogButton confirmButton,
    OdsAlertDialogButton? dismissButton,
    String? title,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: title != null ? Text(title) : null,
        content: (title == null)
            ? Padding(
                padding: const EdgeInsets.only(top: spacingL),
                child: SingleChildScrollView(child: Text(text)),
              )
            : SingleChildScrollView(child: Text(text)),
        actions: <Widget>[
          TextButton(
            onPressed: confirmButton.onClick,
            child: Text(confirmButton.text),
          ),
          if (dismissButton != null)
            TextButton(
              onPressed: dismissButton.onClick,
              child: Text(dismissButton.text),
            ),
        ],
      ),
    );
  }

  static void openFullscreenDialog({
    required BuildContext context,
    required String text,
    Widget? body,
    String? buttonRight,
    Function()? onButtonRightClick,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => Dialog.fullscreen(
        child: Padding(
          padding: const EdgeInsets.all(spacingM),
          child: Scaffold(
            appBar: AppBar(
              title: Text(text),
              centerTitle: false,
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
              actions: [
                if (buttonRight != null)
                  TextButton(
                    onPressed: onButtonRightClick,
                    child: Text(buttonRight),
                  ),
              ],
            ),
            body: SingleChildScrollView(child: body),
          ),
        ),
      ),
    );
  }
}
