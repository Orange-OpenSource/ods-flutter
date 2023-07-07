import 'package:flutter/material.dart';
import 'package:ods_flutter_demo/ui/theme/model_theme.dart';
import 'package:provider/provider.dart';

class ThemeSelector extends StatefulWidget {
  const ThemeSelector({super.key});

  @override
  State<ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  String themeValue = ThemeMode.system.toString();

  final Map<String, IconData> themeIcons = {
    ThemeMode.light.toString(): Icons.wb_sunny,
    ThemeMode.dark.toString(): Icons.nightlight_round,
    ThemeMode.system.toString(): Icons.circle_sharp,
  };

  @override
  Widget build(BuildContext context) {
    List<String> themeList = <String>[
      ThemeMode.light.toString(),
      ThemeMode.dark.toString(),
      ThemeMode.system.toString()
    ];
    var themeNotifier = Provider.of<ModelTheme>(context);

    return PopupMenuButton<String>(
      initialValue: themeValue,
      icon: Icon(themeIcons[themeValue]),
      itemBuilder: (BuildContext context) {
        return themeList.map((String value) {
          return PopupMenuItem<String>(
            value: value,
            child: ListTile(
              leading: Icon(themeIcons[value]),
              title: Text(value),
            ),
          );
        }).toList();
      },
      onSelected: (String value) {
        setState(() {
          themeValue = value;
        });
        themeNotifier.themeMode = value == ThemeMode.system.toString()
            ? ThemeMode.system
            : (value == ThemeMode.dark.toString()
                ? ThemeMode.dark
                : ThemeMode.light);
      },
    );
  }
}
