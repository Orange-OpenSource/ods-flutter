import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ods_flutter/guidelines/spacings.dart';

import '../utilities/display_image.dart';
import 'component.dart';

class ComponentDetailScreen extends StatelessWidget {
  final Component component;

  const ComponentDetailScreen({required this.component});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(component.titleRes),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            displayImage(
              component.imageRes,
              MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: spacingM,
                  right: spacingM,
                  left: spacingM,
                  bottom: spacingM),
              child: Text(
                component.descriptionRes,
                style: TextStyle(fontSize: spacingM, letterSpacing: 0.5),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount:
                  component.variants.isNotEmpty ? component.variants.length : 1,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: SvgPicture.asset("assets/ic_modules_molecule.svg"),
                  title: component.variants.isNotEmpty
                      ? Text(component.variants[index].titleRes)
                      : Text("${component.titleRes} demo"),
                  subtitle: component.variants.isNotEmpty
                      ? Text(component.variants[index].composableName)
                      : Text(component.composableName),
                  onTap: () {
                    Navigator.pushNamed(context, component.direction);
                  },
                );
              },
            ))
          ],
        ));
  }
}
