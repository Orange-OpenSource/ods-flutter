import 'package:flutter/material.dart';

/// ODS Tab.
///
/// The tab displays a list of destinations that can be selected.
/// It highlights the selected destination and calls a callback when a destination is selected.
class OdsTab extends StatefulWidget {
  /// Creates an ODS Tab.
  const OdsTab({
    Key? key,
    required this.selectedIndex,
    required this.destinations,
    this.onDestinationSelected,
  }) : super(key: key);

  /// The index of the currently selected destination.
  final int selectedIndex;

  /// The list of destinations to display.
  final List<Widget> destinations;

  /// The callback function called when a destination is selected.
  final void Function(int)? onDestinationSelected;

  @override
  State<OdsTab> createState() => _OdsTabState();
}

class _OdsTabState extends State<OdsTab> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        selectedIndex: widget.selectedIndex,
        onDestinationSelected: widget.onDestinationSelected,
        destinations: widget.destinations);
  }
}
