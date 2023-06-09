import 'package:flutter/material.dart';
import 'package:ods_flutter/components/app_bar/top/ods_top_app_bars.dart';

class ComponentTopAppBars extends StatefulWidget {
  @override
  State<ComponentTopAppBars> createState() => _ComponentTopAppBarsState();
}

class _ComponentTopAppBarsState extends State<ComponentTopAppBars> {
  bool showOdsAppTopBar = false;

  void toggleOdsAppTopBar() {
    setState(() {
      showOdsAppTopBar = !showOdsAppTopBar;
    });
  }

  static final actions = [
    IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
    IconButton(icon: const Icon(Icons.share), onPressed: () {}),
    IconButton(icon: const Icon(Icons.search), onPressed: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          OdsAppTopBars(
            leading: const BackButton(),
            title: const Text('Large App Bar'),
            actions: actions,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              List<Widget>.generate(31, (index) {
                final itemNumber = index.toString();
                return ListTile(
                  title: Text(
                    'Item #$itemNumber',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
