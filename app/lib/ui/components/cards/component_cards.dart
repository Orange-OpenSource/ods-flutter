import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_small.dart';

class ComponentCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 24),
            ),
            onPressed: () {},
            child: Text('Cards'),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Get.to(CardSmall());
              },
              title: const Center(child: Text('Small Card')),
            ),
          ),
        ],
      ),
    );
  }
}
