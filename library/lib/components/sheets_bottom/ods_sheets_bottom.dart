import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ods_flutter/guidelines/spacings.dart';

/// ODS Sheets Bottom.

class OdsSheetsBottom extends StatefulWidget {
  /// Creates an ODS Sheets Bottom.
  const OdsSheetsBottom({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  /// The title of the sheet bottom.
  final String title;

  /// The content of the sheets bottom
  final Widget content;

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
    double collapsedHeight = Platform.isAndroid ? 56 : 71;

    return Container(
      color: Theme.of(context).colorScheme.onSecondaryContainer,
      child: SafeArea(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: expanded ? collapsedHeight : null,
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: _expandCloseBottomSheet,
                  child: MergeSemantics(
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
                          child: Padding(
                            padding: const EdgeInsets.all(spacingM),
                            child: Text(
                              widget.title,
                              style: Theme.of(context).textTheme.titleMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (Platform.isIOS) ...[
                  Padding(
                    padding: const EdgeInsets.only(bottom: spacingXl),
                    child: widget.content,
                  ),
                ] else ...[
                  widget.content,
                ],
              ],
            ),
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
