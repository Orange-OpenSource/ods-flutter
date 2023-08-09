import 'package:flutter/material.dart';
import 'package:ods_flutter/guidelines/spacings.dart';

/// ODS Slider.

class OdsSlider extends StatefulWidget {
  /// Creates an ODS Slider.
  const OdsSlider({
    Key? key,
    required this.sliderValue,
    this.iconLeft,
    this.iconRight,
    this.divisions,
    this.label,
  }) : super(key: key);

  /// The initial value of the slider.
  final double sliderValue;

  /// The icon displayed on the left side of the slider.
  final Widget? iconLeft;

  /// The icon displayed on the right side of the slider.
  final Widget? iconRight;

  /// The division step of the slider.
  final int? divisions;

  /// The division step of the slider.
  final String? label;

  @override
  State<OdsSlider> createState() => _OdsSliderState();
}

class _OdsSliderState extends State<OdsSlider> {
  late double _currentSliderValue;

  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.sliderValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (widget.iconLeft != null)
              Padding(
                padding: const EdgeInsets.all(spacingS),
                child: widget.iconLeft,
              ),
            Expanded(
              child: Slider(
                max: 100,
                value: _currentSliderValue,
                divisions: widget.divisions,
                //inactiveColor: Colors.red,
                label: widget.label != null
                    ? _currentSliderValue.round().toString()
                    : null,
                onChanged: (value) {
                  setState(
                    () {
                      _currentSliderValue = value;
                    },
                  );
                },
              ),
            ),
            if (widget.iconRight != null)
              Padding(
                padding: const EdgeInsets.all(spacingS),
                child: widget.iconRight,
              ),
          ],
        ),
      ],
    );
  }
}
