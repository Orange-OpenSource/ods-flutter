import 'package:flutter/material.dart';
import 'package:ods_flutter/components/card/ods_small_card.dart';
import 'package:ods_flutter/guidelines/spacings.dart';

import 'component.dart';

class ComponentsScreen extends StatelessWidget {
  Components group = Components();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.only(
                    left: spacingXs, right: spacingXs, top: spacingS),
                child: GridView.count(
                    crossAxisCount: 2,
                    children:
                        List.generate(group.getComponent().length, (index) {
                      return OdsSmallCard(
                        title: group.getName(index),
                        image: Image.asset(group.getImage(index),
                            semanticLabel: 'Flutter image',
                            fit: BoxFit.fitHeight),
                        onTap: () {
                          Navigator.pushNamed(
                              context, group.getDirections(index));
                        },
                      );
                    })))));
  }
}
