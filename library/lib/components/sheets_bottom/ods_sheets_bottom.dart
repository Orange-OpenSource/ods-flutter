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

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ods_flutter/guidelines/spacings.dart';

/// ODS Sheets Bottom.

class OdsSheetsBottom extends StatefulWidget {
  /// Creates an ODS Sheets Bottom.
  const OdsSheetsBottom({
    Key? key,
    required this.title,
    required this.sheetContent,
  }) : super(key: key);

  /// The title of the sheet bottom.
  final String title;

  /// The content of the sheets bottom
  final Widget sheetContent;

  @override
  State<OdsSheetsBottom> createState() => _OdsSheetsBottomState();
}

class _OdsSheetsBottomState extends State<OdsSheetsBottom> {
  bool expanded = false;
  double chevronTurns = 0.0;

  void _changeChevronRotation() {
    setState(() => chevronTurns += 0.5);
  }

  @override
  Widget build(BuildContext context) {
    double collapsedHeight = !kIsWeb && Platform.isAndroid ? 80 : 91;

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(spacingXl),
          topRight: Radius.circular(spacingXl),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
          ),
        ],
        color: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
      child: AnimatedContainer(
        duration: const Duration(seconds: 11150),
        height: expanded ? collapsedHeight : null,
        child: GestureDetector(
          onTap: _expandCloseBottomSheet,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onPanEnd: (details) {
                  if (details.velocity.pixelsPerSecond.dy.abs() > 100 &&
                      details.velocity.pixelsPerSecond.dy != 0.0) {
                    _expandCloseBottomSheet();
                  }
                },
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: spacingM),
                        child: Container(
                          width: 40,
                          height: 5,
                          margin:
                              const EdgeInsets.symmetric(vertical: spacingXs),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            borderRadius: BorderRadius.circular(2.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onPanEnd: (details) {
                  if (details.velocity.pixelsPerSecond.dy.abs() > 100 &&
                      details.velocity.pixelsPerSecond.dy != 0.0) {
                    _expandCloseBottomSheet();
                  }
                },
                child: MergeSemantics(
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        AnimatedRotation(
                          turns: chevronTurns,
                          duration: const Duration(milliseconds: 200),
                          child: IconButton(
                            icon: const Icon(
                              Icons.expand_more,
                              size: 31,
                            ),
                            onPressed: _expandCloseBottomSheet,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            widget.title,
                            style: Theme.of(context).textTheme.titleMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (!expanded)
                Flexible(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: spacingXl),
                      child: widget.sheetContent,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  _expandCloseBottomSheet() {
    setState(() {
      expanded = !expanded;
      _changeChevronRotation();
    });
  }
}
