import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/guidelines/spacings.dart';

class CustomizationBottomSheet extends StatefulWidget {
  const CustomizationBottomSheet({Key? key, required this.content})
      : super(key: key);

  final Widget content;

  @override
  State<CustomizationBottomSheet> createState() =>
      _CustomizationBottomSheetState();
}

class _CustomizationBottomSheetState extends State<CustomizationBottomSheet> {
  bool expanded = false;
  double chevronTurns = 0.0;

  void _changeChevronRotation() {
    setState(() => chevronTurns += 0.5);
  }

  @override
  Widget build(BuildContext context) {
    double collapsedHeight = Platform.isAndroid ? 56 : 71;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
          ),
        ],
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: expanded ? collapsedHeight : null,
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: _expandCloseBottomSheet,
                child: Row(children: [
                  AnimatedRotation(
                    turns: chevronTurns,
                    duration: const Duration(milliseconds: 200),
                    child: IconButton(
                        icon: const Icon(
                          Icons.expand_more,
                          size: 31,
                        ),
                        onPressed: _expandCloseBottomSheet),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(spacingM),
                    child: Text(
                      AppLocalizations.of(context)!.componentCustomizeTitle,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  )),
                ]),
              ),
              Platform.isIOS
                  ? Padding(
                      padding: EdgeInsets.only(bottom: spacingXl),
                      child: widget.content,
                    )
                  : widget.content,
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
