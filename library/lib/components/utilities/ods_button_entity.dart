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

import 'dart:ui';

/// Button entity used in ODS components.
/// It represents a simple button with a [label]
/// Will be called when the user clicks the button [onClick].
class OdsButtonEntity {
  const OdsButtonEntity({
    required this.label,
    required this.onClick,
  });

  /// The text label for this button.
  final String label;

  /// The action executed on button click.
  final VoidCallback onClick;
}
