import 'package:flutter/material.dart';
import 'package:ods_flutter/guidelines/spacings.dart';

/// ODS Slider.

class OdsSlider extends StatefulWidget {
  /// Creates an ODS Slider.
  const OdsSlider({
    Key? key,
    required this.value,
    this.leftIcon,
    this.rightIcon,
    this.steps,
    this.label,
  }) : super(key: key);

  /// The initial value of the slider.
  final double value;

  /// The icon displayed on the left side of the slider.
  final Widget? leftIcon;

  /// The icon displayed on the right side of the slider.
  final Widget? rightIcon;

  /// The division step of the slider.
  final int? steps;

  /// The division step of the slider.
  final String? label;

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
            if (widget.leftIcon != null)
              Padding(
                padding: const EdgeInsets.all(spacingS),
                child: widget.leftIcon,
              ),
            Expanded(
              child: Slider(
                max: 100,
                value: currentValue,
                divisions: widget.steps,
                //inactiveColor: Colors.red,
                label: widget.label != null
                    ? currentValue.round().toString()
                    : null,
                onChanged: (value) {
                  setState(
                    () {
                      currentValue = value;
                    },
                  );
                },
              ),
            ),
            if (widget.rightIcon != null)
              Padding(
                padding: const EdgeInsets.all(spacingS),
                child: widget.rightIcon,
              ),
          ],
        ),
      ],
    );
  }
}
