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
import 'package:ods_flutter/l10n/l10n.dart';

class OdsCircularProgressIndicator extends StatefulWidget {
  /// ODS CircularProgressIndicator.
  const OdsCircularProgressIndicator({
    Key? key,
    this.progress,
    this.label,
  }) : super(key: key);

  /// The initial value of the circular progress indicator.
  final double? progress;

  /// The division step of the circular progress indicator.
  final String? label;

  @override
  State<OdsCircularProgressIndicator> createState() =>
      _OdsCircularProgressIndicatorState();
}

class _OdsCircularProgressIndicatorState
    extends State<OdsCircularProgressIndicator> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.odsL10n;

    final progressValue = widget.progress ?? 0.0;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: progressValue),
      duration: const Duration(seconds: 3),
      builder: (BuildContext context, double value, Widget? child) {
        final circularProgress = CircularProgressIndicator(
          semanticsLabel: l10n.componentProgressTitle,
          value: widget.progress != null ? value : null,
        );

        return MergeSemantics(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              circularProgress,
              if (widget.label != null)
                Padding(
                  padding: const EdgeInsets.all(spacingM),
                  child: Text(
                    widget.label!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
