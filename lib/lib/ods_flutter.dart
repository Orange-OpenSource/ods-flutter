library ods_flutter;

import 'package:flutter/material.dart';

/// A Calculator.
class Calculator {
  var val = 0;

  void addValue(int value) {
    val += value;
  }

  int get() {
    return val;
  }
}

class TotoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {  },
        child: Text('Next')
    );
  }
}

var totoThemeData = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.orange,
    accentColor: Colors.red,
    // Dark mode?
    // brightness: Brightness.dark
  )
);


// Core lib with basic components + basic OSS themes
// github.com/ods-flutter
  // theme by default
  // other OSS theme
  // Components
    // Button
    // ButtonGroup
    // Card

// Sub-libs with their own themes and can create their own specific components
// internal.com/otherbrand-flutter-theme-1
  // otherbrand theme
  // Components
    // Specific component for Brand 1

// internal.com/otherbrand-flutter-theme-2
// otherbrand theme




// internal.com/app1
  // use github.com/ods-flutter
    // Button (avec style par défaut)

// internal.com/app2
  // internal.com/otherbrand-flutter-theme-2
    // Button but with another theme



// TODO: Create an Orange Theme based on Material
// TODO: Create custom components
