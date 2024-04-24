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

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ods_flutter/l10n/gen/ods_localizations.dart';
import 'package:ods_flutter/theme/ods_theme.dart';
import 'package:ods_flutter_demo/domain/declaration/declaration_entities.dart';
import 'package:ods_flutter_demo/domain/recipes/recipes_entities.dart' as ods;
import 'package:ods_flutter_demo/ui/main_screen.dart';
import 'package:provider/provider.dart';

import 'ui/theme/model_theme.dart';

void main() {
  runApp(OdsApplication());
}

class OdsApplication extends StatefulWidget {
  const OdsApplication({super.key});
  static List<ods.Recipe> recipes = [];
  static List<ods.Category> category = [];
  static List<ods.Food> foods = [];
  static late Declaration declaration;

  @override
  State<OdsApplication> createState() => _OdsApplicationState();
}

class _OdsApplicationState extends State<OdsApplication> {
  /// Fetch content from the json file
  Future<void> _readJson() async {
    ///Declaration
    final String responseDeclaration;

    if (kIsWeb || Platform.isAndroid) {
      responseDeclaration =
          await rootBundle.loadString('assets/declaration_ios.json');
    } else {
      responseDeclaration =
          await rootBundle.loadString('assets/declaration_android.json');
    }

    Declaration entityDeclaration =
        entityDeclarationFromJson(responseDeclaration);

    OdsApplication.declaration = entityDeclaration;

    ///Recipes
    final String response = await rootBundle.loadString('assets/recipes.json');
    ods.Entity entity = ods.entityFromJson(response);

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
