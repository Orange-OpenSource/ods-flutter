// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ods_flutter/ods_flutter.dart';
import 'package:ods_flutter_demo/ui/components/checkboxes/component_checkboxes.dart';
import 'package:ods_flutter_demo/ui/components/radioButtons/component_radioButtons.dart';
import 'package:ods_flutter_demo/ui/components/switches/component_switches.dart';
import 'package:provider/provider.dart';

import './model_theme.dart';
import 'ui/main_screen.dart';

void main() {
  runApp(OdsApplication());
}

class OdsApplication extends StatelessWidget {
  const OdsApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
          builder: (context, ModelTheme themeNotifier, child) {
        return MaterialApp(
          title: 'Orange Design System - Flutter Demo App',
          theme: lightThemeData,
          darkTheme: darkThemeData,
          routes: {
            '/component_checkboxes': (context) => ComponentCheckboxes(),
            '/component_switches': (context) => ComponentSwitches(),
            '/component_radioButtons': (context) => ComponentRadioButtons(),
          },
          themeMode: themeNotifier.themeMode,
          debugShowCheckedModeBanner: false,
          home: MainScreen(),
        );
      }),
    );
  }
}
