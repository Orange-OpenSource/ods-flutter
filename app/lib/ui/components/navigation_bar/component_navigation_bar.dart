import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: MainAppBar(AppLocalizations.of(context)!.navigationBarVariantTitle),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.all(spacingM),
              child: _NavBarDemo(selectedIndex: 1, items: [
                _MainMenuItem(icon: Icon(Icons.widgets_outlined), label: 'Component'), //TODO Add FoODS content
                _MainMenuItem(icon: Icon(Icons.format_paint_outlined), label: 'Color'), //TODO Add FoODS content
              ])),
          Padding(
              padding: EdgeInsets.all(spacingM),
              child: _NavBarDemo(selectedIndex: 1, items: [
                _MainMenuItem(icon: Icon(Icons.widgets_outlined), label: 'Component'), //TODO Add FoODS content
                _MainMenuItem(icon: Icon(Icons.format_paint_outlined), label: 'Color'), //TODO Add FoODS content
                _MainMenuItem(icon: Icon(Icons.text_snippet_outlined), label: 'Typography'), //TODO Add FoODS content
              ])),
          Padding(
            padding: EdgeInsets.all(spacingM),
            child: _NavBarDemo(selectedIndex: 1, items: [
              _MainMenuItem(icon: Icon(Icons.widgets_outlined), label: 'Component'), //TODO Add FoODS content
              _MainMenuItem(icon: Icon(Icons.format_paint_outlined), label: 'Color'), //TODO Add FoODS content
              _MainMenuItem(icon: Icon(Icons.text_snippet_outlined), label: 'Typography'), //TODO Add FoODS content
              _MainMenuItem(icon: Icon(Icons.invert_colors_on_outlined), label: 'Elevation'), //TODO Add FoODS content
            ]),
          ),
        ],
      ),
    );
  }
}

class _NavBarDemo extends StatefulWidget {
  _NavBarDemo({super.key, required this.selectedIndex, required this.items});

  final int selectedIndex;
  final List<_MainMenuItem> items;

  @override
  State<_NavBarDemo> createState() => _NavBarDemoState();
}

class _NavBarDemoState extends State<_NavBarDemo> {
  late int selectedIndex;
  late List<_MainMenuItem> items;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
    items = widget.items;
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
        autofocus: false,
        child: NavigationBar(
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            destinations: items.map((c) => NavigationDestination(tooltip: '', icon: c.icon, label: c.label)).toList()));
  }
}

class _MainMenuItem {
  const _MainMenuItem({
    required this.icon,
    required this.label,
  });

  /// The icon of the menu item.
  final Widget icon;

  /// The text label for this menu item.
  final String label;
}
