import 'package:flutter/material.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter/l10n/gen/ods_localizations.dart';

class OdsLinearProgressIndicator extends StatefulWidget {
  /// ODS CircularProgressIndicator.
  const OdsLinearProgressIndicator({
    Key? key,
    this.progress,
    this.label,
    this.icon,
    this.showCurrentValue,
  }) : super(key: key);

  /// The initial value of the circular progress indicator.
  final double? progress;

  /// The label text step of the circular progress indicator.
  final String? label;

  /// The icon of the circular progress indicator.
  final Widget? icon;

  /// The final bool? showCurrentValue; step of the circular progress indicator.
  final bool? showCurrentValue;

  @override
  State<OdsLinearProgressIndicator> createState() =>
      _OdsLinearProgressIndicatorState();
}

class _OdsLinearProgressIndicatorState
    extends State<OdsLinearProgressIndicator> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: spacingS, bottom: spacingS),
            child: Row(
              children: [
                if (widget.icon != null) ...[
                  widget.icon!,
                  const SizedBox(width: 8),
                ],
                if (widget.label != null)
                  Flexible(
                    child: Text(
                      widget.label!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              LinearProgressIndicator(
                semanticsLabel:
                    OdsLocalizations.of(context)!.componentProgressTitle,
                value: widget.progress,
              ),
              ExcludeSemantics(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: spacingS, bottom: spacingS),
                  child: widget.showCurrentValue == true &&
                          widget.showCurrentValue != null
                      ? Text(
                          "${(widget.progress! * 100).toInt()} %",
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
