## Introduction

Orange is providing a full Design System to build Orange Mobile Application. The objective of the [Orange Design System](https://system.design.orange.com/0c1af118d/p/7218a7-flutter/b/98eb3b) (ODS) is to propose a set of guidelines on how to apply the Orange Brand on mobile applications. The Orange design System also provides a series of components and modules that show in details how to use this in the Orange apps.

The Orange Design System has been implemented in a code library that provides:
- a Flutter code library
- a demo app that can be launched to show the guidelines, components and modules
- this demo app also shows how to use the lib or style existing components

Using these resources will allow you to create Orange branded applications faster and will inherit all the work that was done to make sure that all presented codes are fully tested regarding the brand and the accessibility compliance.

The Orange Design System framework supports iOS 11 and later.

## Instructions

### Use this package as a library

Run this command with Flutter :

```dart
flutter pub add ods_flutter
``` 

This will add a line like this to your package's pubspec.yaml (and run an implicit flutter pub get):

```dart
dependencies:
  ods_flutter: ^0.1.1
``` 
Alternatively, your editor might support flutter pub get. Check the docs for your editor to learn more.


Now in your Dart code, you can use:
```dart
import 'package:ods_flutter/ods_flutter.dart';
``` 
