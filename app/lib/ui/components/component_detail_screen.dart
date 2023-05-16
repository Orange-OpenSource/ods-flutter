import 'package:flutter/material.dart';
import 'package:ods_flutter/guidelines/spacings.dart';

import 'component.dart';

class ComponentDetailScreen extends StatefulWidget {
  final Component? component;

  const ComponentDetailScreen({Key? key, this.component}) : super(key: key);

  @override
  State<ComponentDetailScreen> createState() => _ComponentDetailScreenState();
}

class _ComponentDetailScreenState extends State<ComponentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text('Cards'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Image.asset(
              'assets/placeholder.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitHeight,
            ),
            Padding(
              padding: const EdgeInsets.all(spacingM),
              child: Text(
                "Cards are important components that can be used to organise and present a number of different types of related information",
                style: TextStyle(fontSize: spacingM, letterSpacing: 0.5),
              ),
            ),
            //Column(children: <Widget>[
            //GridView.count(crossAxisCount: 1, children: <Widget>[
            Card(
              child: ListTile(
                leading: FlutterLogo(),
                //onTap: () { Navigator.pushNamed(context, '/card_small');},
                title: Text('Small Card'),
              ),
            ),
            Card(
              child: ListTile(
                leading: FlutterLogo(),
                //onTap: () { Navigator.pushNamed(context, '/card_small');},
                title: Text('Small Card'),
              ),
            ),
            //])
            //])
          ]),
        ));
  }
}
