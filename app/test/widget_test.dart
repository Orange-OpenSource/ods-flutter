// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:ods_flutter_demo/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const OdsApplication());

    expect(find.text('Guidelines'),
        findsNWidgets(2)); // 1 in the bottom bar and 1 in the title
    expect(find.text('Modules'), findsOneWidget); // 1 in the tab bar

    await tester.tap(find.text('Components').last);
    await tester.pump();

    expect(find.text('App bars: top'), findsOneWidget);
    expect(find.text('Bar: Navigation'), findsOneWidget);
    expect(find.text('Buttons'), findsOneWidget);
    expect(find.text('Buttons: FAB'), findsOneWidget);
    expect(find.text('Cards'), findsOneWidget);
    expect(find.text('Checkboxes'), findsOneWidget);
    expect(find.text('Chips'), findsOneWidget);
    expect(find.text('List item'), findsOneWidget);

    expect(find.text('Modules'), findsOneWidget); // 1 in the tab bar
  });
}
