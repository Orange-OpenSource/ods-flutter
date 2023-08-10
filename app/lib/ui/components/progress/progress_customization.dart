import 'package:flutter/material.dart';
import 'package:ods_flutter_demo/ui/components/progress/progress_enum.dart';

class _ProgressCustomization extends InheritedWidget {
  _ProgressCustomization({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final ProgressCustomizationState data;

  @override
  bool updateShouldNotify(_ProgressCustomization oldWidget) => true;
}

class ProgressCustomization extends StatefulWidget {
  const ProgressCustomization({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  ProgressCustomizationState createState() => ProgressCustomizationState();

  static ProgressCustomizationState? of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<_ProgressCustomization>())
        ?.data;
  }
}

class ProgressCustomizationState extends State<ProgressCustomization> {
  bool _hasLabel = false;
  bool _hasIcon = false;
  bool _hasCurrentValue = false;

  bool get hasLabel => _hasLabel;
  set hasLabel(bool value) {
    setState(() {
      _hasLabel = value;
    });
  }

  bool get hasIcon => _hasIcon;
  set hasIcon(bool value) {
    setState(() {
      _hasIcon = value;
    });
  }

  bool get hasCurrentValue => _hasCurrentValue;
  set hasCurrentValue(bool value) {
    setState(() {
      _hasCurrentValue = value;
    });
  }

  ///Progress Enum
  List<ProgressEnum> _progressType = [
    ProgressEnum.determinate,
    ProgressEnum.indeterminate,
  ];
  ProgressEnum _selectedProgressType = ProgressEnum.determinate;

  ///Progress Enum
  List<ProgressEnum> get progressType => _progressType;
  set progressType(List<ProgressEnum> value) {
    setState(() {
      _progressType = value;
    });
  }

  ProgressEnum get selectedProgressType => _selectedProgressType;

  set selectedProgressType(ProgressEnum value) {
    setState(() {
      _selectedProgressType = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _ProgressCustomization(
      data: this,
      child: widget.child,
    );
  }
}
