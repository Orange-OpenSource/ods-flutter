import 'package:flutter/material.dart';
import 'package:ods_flutter/components/floating_action_button/ods_fab.dart';
import 'package:ods_flutter/components/floating_action_button/ods_fab_extended.dart';
import 'package:ods_flutter/components/floating_action_button/ods_fab_large.dart';
import 'package:ods_flutter/components/floating_action_button/ods_fab_small.dart';
import 'package:ods_flutter_demo/ui/components/utilities/customization_bottom_sheet.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

import 'floating_action_customization.dart';

class ComponentFloatingActionButton extends StatefulWidget {
  const ComponentFloatingActionButton({super.key});

  @override
  State<ComponentFloatingActionButton> createState() =>
      _ComponentFloatingActionButtonState();
}

class _ComponentFloatingActionButtonState
    extends State<ComponentFloatingActionButton> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButtonCustomization(
      child: Scaffold(
          key: _scaffoldKey, appBar: MainAppBar('Button : FAB'), body: _Body()),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    final FloatingActionButtonCustomizationState? customizationState =
        FloatingActionButtonCustomization.of(context);

    Widget? fab;

    if (customizationState?.hasDefault == true) {
      fab = OdsFloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        icon: const Icon(Icons.add),
        //label: 'Create',
      );
    } else if (customizationState?.hasSmall == true) {
      fab = OdsFloatingActionButtonSmall(
        onPressed: () {},
        tooltip: 'Increment',
        icon: const Icon(Icons.add),
        //label: 'Create',
      );
    } else if (customizationState?.hasLarge == true) {
      fab = OdsFloatingActionButtonLarge(
        onPressed: () {},
        tooltip: 'Increment',
        icon: const Icon(Icons.add),
        //label: 'Create',
      );
    } else if (customizationState?.hasExtended == true) {
      fab = OdsFloatingActionButtonExtended(
        onPressed: () {},
        tooltip: 'Increment',
        icon: const Icon(Icons.add),
        label: 'ADD',
        //label: 'Create',
      );
    }

    return Scaffold(
      bottomSheet: CustomizationBottomSheet(
        content: _CustomizationContent(),
      ),
      floatingActionButton: fab,
    );
  }
}

class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FloatingActionButtonCustomizationState? customizationState =
        FloatingActionButtonCustomization.of(context);
    return Column(
      children: [
        SwitchListTile(
            value: customizationState?.hasDefault ?? true,
            title: Text('Default'),
            onChanged: (bool value) {
              customizationState?.hasDefault = value;
            }),
        SwitchListTile(
            value: customizationState?.hasSmall ?? true,
            title: Text('Small'),
            onChanged: (bool value) {
              customizationState?.hasSmall = value;
            }),
        SwitchListTile(
            value: customizationState?.hasLarge ?? true,
            title: Text('Large'),
            onChanged: (bool value) {
              customizationState?.hasLarge = value;
            }),
        SwitchListTile(
            value: customizationState?.hasExtended ?? true,
            title: Text('Extended'),
            onChanged: (bool value) {
              customizationState?.hasExtended = value;
            })
      ],
    );
  }
}
