import 'package:flutter/material.dart';
import 'package:ods_flutter/components/app_bar/top/ods_top_app_bars.dart';

class ComponentTopAppBars extends StatefulWidget {
  const ComponentTopAppBars({Key? key}) : super(key: key);

  @override
  _ComponentTopAppBarsState createState() => _ComponentTopAppBarsState();
}

class _ComponentTopAppBarsState extends State<ComponentTopAppBars> {
  bool showOdsAppTopBar = false;

  void toggleOdsAppTopBar() {
    setState(() {
      showOdsAppTopBar = !showOdsAppTopBar;
    });
  }

  static final actions = [
    IconButton(icon: const Icon(Icons.attach_file), onPressed: () {}),
    IconButton(icon: const Icon(Icons.event), onPressed: () {}),
    IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        leading: IconButton(
          icon: const BackButton(),
          onPressed: () {
            // Action for leading button
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Action for search button
            },
          ),
        ],
      ),
      body: OdsAppTopBars(
        title: const Text('Title'),
        leading: const BackButton(),
        actions: actions, // Customize the toolbar height as needed
      ),
    );
  }
}
