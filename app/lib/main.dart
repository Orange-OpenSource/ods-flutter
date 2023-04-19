// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ods_flutter/ods_flutter.dart';
import 'package:provider/provider.dart';

import 'domain/recipes/my_app_state.dart';
import 'ui/main_screen.dart';

void main() {
  runApp(OdsApplication());
}

class OdsApplication extends StatelessWidget {
  const OdsApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Orange Design System - Flutter Demo App',
        theme: lightThemeData,
        darkTheme: darkThemeData,
        home: MainScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
