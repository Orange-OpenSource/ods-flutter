// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ods_flutter/ods_theme.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_small.dart';
import 'package:ods_flutter_demo/ui/components/cards/component_cards.dart';
import 'package:ods_flutter_demo/ui/components/checkboxes/component_checkboxes.dart';
import 'package:ods_flutter_demo/ui/components/material/component_material.dart';
import 'package:ods_flutter_demo/ui/components/radio_buttons/component_radio_buttons.dart';
import 'package:ods_flutter_demo/ui/components/switches/component_switches.dart';
import 'package:provider/provider.dart';

import './model_theme.dart';
import 'l10n/languages.dart';
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
          routes: {
            '/component_cards': (context) => ComponentCards(),
            '/card_small': (context) => CardSmall(),
            '/component_checkboxes': (context) => ComponentCheckboxes(),
            '/component_switches': (context) => ComponentSwitches(),
            '/component_radioButtons': (context) => ComponentRadioButtons(),
            '/component_material': (context) => ComponentMaterial(),
          },
          debugShowCheckedModeBanner: false,
          home: MainScreen(),
          // Localization setup
          supportedLocales: L10n.all,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        );
      }),
    );
  }
}
