// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:underscore_48484645478084414891891/underscore_48484645478084414891891.dart';

import 'domain/recipes/my_app_state.dart';
import 'ui/main_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: totoThemeData,
        home: MyHomePage(),
      ),
    );
  }
}


