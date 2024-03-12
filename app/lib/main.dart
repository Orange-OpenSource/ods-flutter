/*
 * Software Name : Orange Design System
 * SPDX-FileCopyrightText: Copyright (c) Orange SA
 * SPDX-License-Identifier: MIT
 *
 * This software is distributed under the MIT license,
 * the text of which is available at https://opensource.org/license/MIT/
 * or see the "LICENSE" file for more details.
 *
 * Software description: Flutter library of reusable graphical components for Android and iOS
 */

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ods_flutter/l10n/gen/ods_localizations.dart';
import 'package:ods_flutter/theme/ods_theme.dart';
import 'package:ods_flutter_demo/domain/recipes/recipes_entities.dart';
import 'package:ods_flutter_demo/l10n/gen/ods_flutter_app_localizations.dart';
import 'package:ods_flutter_demo/ui/main_screen.dart';
import 'package:ods_flutter_demo/ui/theme/model_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(OdsApplication());
}

class OdsApplication extends StatefulWidget {
  const OdsApplication({super.key});
  static List<Recipe> recipes = [];
  static List<Category> category = [];
  static List<Food> foods = [];

  @override
  State<OdsApplication> createState() => _OdsApplicationState();
}

class _OdsApplicationState extends State<OdsApplication> {
  // Fetch content from the json file
  Future<void> _readJson() async {
    final String response = await rootBundle.loadString('assets/recipes.json');
    Entity entity = entityFromJson(response);

    OdsApplication.category = entity.category;
    OdsApplication.recipes = entity.recipes;
    OdsApplication.foods = entity.foods;
  }

  @override
  void initState() {
    super.initState();
    _readJson();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
          builder: (context, ModelTheme themeNotifier, child) {
        return GetMaterialApp(
          title: 'Orange Design System - Flutter Demo App',
          theme: OdsTheme.lightTheme,
          darkTheme: OdsTheme.darkTheme,
          themeMode: themeNotifier.themeMode,
          debugShowCheckedModeBanner: false,
          home: MainScreen(),
          // Localization setup
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: [
            AppLocalizations.delegate,
            OdsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        );
      }),
    );
  }
}
