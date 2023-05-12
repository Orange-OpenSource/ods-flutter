import 'package:flutter/material.dart';

/// ODS Divider is a styled thin line of 1dp thickness that groups content in lists and layouts.
class OdsDivider extends StatelessWidget {
  const OdsDivider({super.key});

  final double _dividerOpacity = 0.12;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 10,
      thickness: 1,
      color:
          Theme.of(context).colorScheme.onSurface.withOpacity(_dividerOpacity),
    );
  }
}
