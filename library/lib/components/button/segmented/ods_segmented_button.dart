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

/// ODS RadioButton.
///
/// The OdsCheckbox widget represents a checkbox element that can be checked or unchecked.
/// It allows for handling the checkbox state and triggering a callback when its state changes.
class OdsSegmentedButton<T> extends StatefulWidget {
  /// Creates an ODS RadioButton.
  const OdsSegmentedButton({
    Key? key,
    required this.selected,
    required this.segments,
    required this.onSelectionChanged,
    this.multiSelectionEnabled = true,
    this.enabled = true,
  }) : super(key: key);

  /// The function that is called when the selection changes.
  /// The callback's parameter indicates which of the segments are selected.
  final void Function(Set<T>)? onSelectionChanged;

  /// The set of [ButtonSegment.values] that indicate which [segments] are selected.
  final Set<T> selected;

  /// Determines if multiple segments can be selected at one time.
  final bool? multiSelectionEnabled;

  /// Controls the enabled state of the segmented button. When false, this segmented button will not be clickable.
  final bool? enabled;

  /// Descriptions of the segments in the button.
  final List<ButtonSegment<T>> segments;

  @override
  State<OdsSegmentedButton<T>> createState() => _OdsSegmentedButtonState<T>();
}

class _OdsSegmentedButtonState<T> extends State<OdsSegmentedButton<T>> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      child: SegmentedButton<T>(
        segments: widget.segments.length > 5
            ? widget.segments.sublist(0, 5)
            : widget.segments,
        selected: widget.selected,
        onSelectionChanged:
            widget.enabled != false ? widget.onSelectionChanged : null,
        multiSelectionEnabled: true,
        //emptySelectionAllowed: true,
      ),
    );
  }
}
