import 'package:flutter/material.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter/l10n/gen/ods_localizations.dart';

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
    return MergeSemantics(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            semanticsLabel:
                OdsLocalizations.of(context)!.componentProgressTitle,
            value: widget.progress != null ? widget.progress! : null,
          ),
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
  }
}
