import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_small.dart';

class ComponentCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double _imageHeight = 110;

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text('Cards'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/placeholder.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Card(child: ListTile(
              onTap: () {
                Get.to(CardSmall());
              },
            ))
          ],
        ));
  }
}
