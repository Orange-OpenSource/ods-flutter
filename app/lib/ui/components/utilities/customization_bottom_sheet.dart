import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ods_flutter/guidelines/spacings.dart';

class CustomizationBottomSheet extends StatefulWidget {
  const CustomizationBottomSheet({Key? key, required this.content}) : super(key: key);

  final Widget content;

  @override
  State<CustomizationBottomSheet> createState() => _CustomizationBottomSheetState();
}

class _CustomizationBottomSheetState extends State<CustomizationBottomSheet> {
  bool expanded = false;
  double chevronTurns = 0.0;

  void _changeChevronRotation() {
    setState(() => chevronTurns += 0.5);
  }

  @override
  Widget build(BuildContext context) {
    double collapsedHeight = Platform.isAndroid ? 56 : 76;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      height: expanded ? MediaQuery.of(context).size.height / 2.20 : collapsedHeight,
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
                        Icons.expand_less,
                        size: 37,
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
            widget.content,
          ],
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
