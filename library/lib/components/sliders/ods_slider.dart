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

/// ODS Design Slider.
///
/// Sliders allow users to make selections from a range of values.
///
/// Sliders reflect a range of values along a bar, from which users may select a single value.
/// They are ideal for adjusting settings such as volume, brightness, or applying image filters.
///
/// Use continuous sliders to allow users to make meaningful selections that don’t
/// require a specific value.
///
/// You can allow the user to choose only between predefined set of values by specifying the amount
/// of steps between min and max values.

class OdsSlider extends StatefulWidget {
  /// Creates an ODS Slider.
  ///
  /// * [value] - Current value of the slider
  /// * [startIcon] - Displayed at the start of the slider.
  /// * [endIcon] - Displayed at the end of the slider.
  /// * [enabled] - Controls the enabled state of the slider. If `false`, the user cannot interact with it.
  /// * [steps] - If greater than `0`, specifies the amounts of discrete values, evenly distributed between across the whole value range. If `0`, slider will
  /// * behave as a continuous slider and allow to choose any value from the range specified. Must not be negative.
  /// * [displayValue] - The button's style color.
  const OdsSlider({
    Key? key,
    required this.value,
    this.startIcon,
    this.endIcon,
    this.enabled = true,
    this.steps,
    this.displayValue,
  }) : super(key: key);

  /// Current value of the slider
  final double value;

  /// The icon displayed at the start of the slider
  final Widget? startIcon;

  /// The icon displayed on the end side of the slider.
  final Widget? endIcon;

  /// Controls the enabled state of the slider.
  final bool? enabled;

  /// The division step of the slider.
  final int? steps;

  /// The division step of the slider.
  final String? displayValue;

  @override
  State<OdsSlider> createState() => _OdsSliderState();
}

class _OdsSliderState extends State<OdsSlider> {
  late double currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (widget.startIcon != null)
              Padding(
                padding: const EdgeInsets.all(spacingS),
                child: widget.startIcon,
              ),
            Expanded(
              child: Slider(
                max: 100,
                value: currentValue,
                divisions: widget.steps,
                label: widget.displayValue != null
                    ? currentValue.round().toString()
                    : null,
                onChanged: widget.enabled == true
                    ? (value) {
                        setState(
                          () {
                            currentValue = value;
                          },
                        );
                      }
                    : null,
              ),
            ),
            if (widget.endIcon != null)
              Padding(
                padding: const EdgeInsets.all(spacingS),
                child: widget.endIcon,
              ),
          ],
        ),
      ],
    );
  }
}
