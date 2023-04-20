import 'package:flutter/material.dart';
import 'package:ods_flutter_demo/model_theme.dart';
import 'package:provider/provider.dart';

class ThemeSelector extends StatefulWidget {
  const ThemeSelector({super.key});

  @override
  State<ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  String themeValue = ThemeMode.system.toString();

  @override
  Widget build(BuildContext context) {
    List<String> themeList = <String>[
      ThemeMode.light.toString(),
      ThemeMode.dark.toString(),
      ThemeMode.system.toString()
    ];
    var themeNotifier = Provider.of<ModelTheme>(context);

    return DropdownButton<String>(
      value: themeValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      onChanged: (String? value) {
        setState(() {
          themeValue = value!;
        });
        themeNotifier.themeMode = value == ThemeMode.system.toString()
            ? ThemeMode.system
            : (value == ThemeMode.dark.toString()
                ? ThemeMode.dark
                : ThemeMode.light);
      },
      items: themeList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Icon(value == ThemeMode.system.toString()
              ? Icons.circle_sharp
              : (value == ThemeMode.dark.toString()
                  ? Icons.nightlight_round
                  : Icons.wb_sunny)),
        );
      }).toList(),
    );
  }
}
