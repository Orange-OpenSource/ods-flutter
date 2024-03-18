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

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  final int maxLines;

  ExpandableTextWidget({required this.text, this.maxLines = 2});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceVariant,
                        borderRadius: BorderRadius.circular(4),
                        border:
                            Border.all(color: colorScheme.secondaryContainer),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Text(
                        widget.text,
                        style: Theme.of(context).textTheme.labelLarge,
                        maxLines: isExpanded || constraints.maxWidth < 200
                            ? null
                            : widget.maxLines,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              children: [
                Spacer(),
                Text(
                  !isExpanded ? 'Show less' : 'Show more',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.primary,
                      ),
                ),
                SizedBox(width: 8),
                Icon(
                  !isExpanded ? Icons.arrow_upward : Icons.arrow_downward,
                  color: colorScheme.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
