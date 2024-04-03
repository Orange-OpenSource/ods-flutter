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
import 'package:ods_flutter/l10n/gen/ods_localizations.dart';

class OdsCircularProgressIndicator extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final progressValue = progress ?? 0.0;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: progressValue),
      duration: const Duration(seconds: 3),
      builder: (BuildContext context, double value, Widget? child) {
        final circularProgress = CircularProgressIndicator(
          semanticsLabel: OdsLocalizations.of(context)!.componentProgressTitle,
          value: progress != null ? value : null,
        );

        return MergeSemantics(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              circularProgress,
              if (label != null)
                Padding(
                  padding: const EdgeInsets.all(spacingM),
                  child: Text(
                    label!,
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
