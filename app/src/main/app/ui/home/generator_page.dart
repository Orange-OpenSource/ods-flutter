import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:underscore_48484645478084414891891/underscore_48484645478084414891891.dart';
import '../../domain/recipes/my_app_state.dart';
import 'big_card/big_card.dart';
import 'history/history_list_view.dart';

class GeneratorPage extends StatelessWidget {
  var calculator = Calculator();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: HistoryListView(),
          ),
          SizedBox(height: 10),
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  calculator.addValue(12);
                  print(calculator.get());
                  appState.getNext();
                },
                child: Text('Next'),
              ),
              SizedBox(width: 10),
              TotoWidget()
            ],
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}