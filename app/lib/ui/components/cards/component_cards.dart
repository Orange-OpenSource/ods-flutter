import 'package:flutter/material.dart';

class ComponentCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                Navigator.pushNamed(context, '/card_small');
              },
              title: const Center(child: Text('Small Card')),
            ),
          ),
        ],
      ),
    );
  }
}
