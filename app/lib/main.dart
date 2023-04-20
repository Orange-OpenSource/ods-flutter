// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ods_flutter/ods_theme.dart';
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
          theme: OdsTheme.lightTheme,
          darkTheme: OdsTheme.darkTheme,
          themeMode: themeNotifier.themeMode,
          debugShowCheckedModeBanner: false,
          home: MainScreen(),
        );
      }),
    );
  }
}
