import 'package:flutter/material.dart';

import '../components_screen.dart';

class ComponentMaterial extends StatefulWidget {
  @override
  State<ComponentMaterial> createState() => _ComponentMaterialState();
}

class _ComponentMaterialState extends State<ComponentMaterial> {
  Options? _selectedOption = Options.option1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('Material components'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.black,
              height: 1.0,
            ),
          )),
      body: ListView(
        children: [
          BottomNavigations(
            selectedIndex: 1,
            isExampleBar: true,
            isBadgeExample: true,
          ),
          Buttons(),
          ButtonsIcons(),
          ButtonsFab(),
          ButtonsSegmented(),
          BottomSheets(),
          Cards(),
          Chips(),
          Dialogs(),
          Menus(),
          ProgressIndicators(),
          Sliders(),
          SnackBars(),
          TextFields(),
        ],
      ),
    );
  }
}
