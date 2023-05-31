import 'package:flutter/material.dart';
import 'package:ods_flutter_demo/main.dart';

class ModulesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold is a basic layout structure for an app screen
      body: Container(), // Use an empty container to create an empty screen
    );
  }
}

class RecipesList extends StatefulWidget {
  const RecipesList({super.key});

  @override
  State<RecipesList> createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  @override
  Widget build(BuildContext context) {
    return OdsApplication.recipes.isNotEmpty
        ? ListView.builder(
            itemCount: OdsApplication.recipes.length,
            itemBuilder: (context, index) {
              return Card(
                key: ValueKey(OdsApplication.recipes.elementAt(index).catId),
                margin: const EdgeInsets.all(10),
                color: Colors.amber.shade100,
                child: ListTile(
                  leading: Text(OdsApplication.recipes.elementAt(index).iconName),
                  title: Text('${OdsApplication.recipes.elementAt(index).title}' '. '),
                  subtitle: Text(OdsApplication.recipes.elementAt(index).subtitle),
                ),
              );
            },
          )
        : Container();
  }
}
