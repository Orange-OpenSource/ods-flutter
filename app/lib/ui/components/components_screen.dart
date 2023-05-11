import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ods_flutter/components/card/ods_small_card.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/component_detail_screen.dart';
import 'package:ods_flutter_demo/ui/components/component_list.dart';
import 'package:ods_flutter_demo/ui/utilities/display_image.dart';

class ComponentsScreen extends StatefulWidget {
  @override
  State<ComponentsScreen> createState() => _ComponentsScreenState();
}

class _ComponentsScreenState extends State<ComponentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(
                    left: spacingXs, right: spacingXs, top: spacingS),
                child: GridView.count(
                    crossAxisCount: 2,
                    children: odsComponents
                        .map((component) => OdsSmallCard(
                              title: component.title,
                              image: displayImage(
                                  component.imageResourceName, double.infinity),
                              onTap: () {
                                Get.to(ComponentDetailScreen(
                                    component: component));
                              },
                            ))
                        .toList()))));
  }
}

/*
class ComponentsScreen extends StatefulWidget {
  @override
  State<ComponentsScreen> createState() => _ComponentsScreenState();
}

class _ComponentsScreenState extends State<ComponentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
<<<<<<< HEAD
            child: Padding(
                padding: const EdgeInsets.only(
                    left: spacingXs, right: spacingXs, top: spacingS),
                child: GridView.count(
                    crossAxisCount: 2,
                    children: odsComponents
                        .map((component) => OdsSmallCard(
                              title: component.title,
                              image: displayImage(
                                  component.imageResourceName, double.infinity),
                              onTap: () {
                                Get.to(ComponentDetailScreen(
                                    component: component));
                              },
                            ))
                        .toList()))));
=======
      child: ListView(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 24),
            ),
            onPressed: () {},
            child: Text(AppLocalizations.of(context)!.componentScreenTitle),
          ),
          Card(
            child: ListTile(title: OdsLocalizedComponent()),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/component_cards');
              },
              title: Text(
                AppLocalizations.of(context)!.componentScreenCardsTitle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Card(
              child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/component_checkboxes');
            },
            title: Text(
              AppLocalizations.of(context)!.componentScreenCheckboxesTitle,
              textAlign: TextAlign.center,
            ),
          )),
          Card(
              child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/component_radioButtons');
            },
            title: Text(
              AppLocalizations.of(context)!.componentScreenRadioButtonsTitle,
              textAlign: TextAlign.center,
            ),
          )),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/component_switches');
              },
              title: Text(
                AppLocalizations.of(context)!.componentScreenSwitchesTitle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle:
                  const TextStyle(fontSize: 24, decorationColor: Colors.black),
            ),
            onPressed: () {},
            child: Text('Material'),
          ),
          Card(
              child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/component_material');
            },
            title: Text(
              AppLocalizations.of(context)!.componentScreenAllTitle,
              textAlign: TextAlign.center,
            ),
          )),
        ],
      ),
    ));
>>>>>>> 2e28285... add localization string keys
  }
}
*/
