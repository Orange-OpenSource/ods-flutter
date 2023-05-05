import 'package:flutter/material.dart';

class TestTextStyles extends StatefulWidget {
  const TestTextStyles({Key? key}) : super(key: key);

  @override
  _TestTextStylesState createState() => _TestTextStylesState();
}

class _TestTextStylesState extends State<TestTextStyles> {
  @override
  void initState() {
    super.initState();
  }

  // test widget to view material design available styles
  // used to test the light and dark mode setup
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'Text without any Style',
      ),
      const Divider(
        height: 10,
        thickness: 2,
        indent: 0,
        endIndent: 0,
        color: Color(0xFFCCCCCC),
        //color: Theme.of(context).colorScheme.primary,
      ),
      Text(
        'displayLarge',
        style: Theme.of(context).textTheme.displayLarge,
      ),
      Text(
        'displayMedium',
        style: Theme.of(context).textTheme.displayMedium,
      ),
      Text(
        'displaySmall',
        style: Theme.of(context).textTheme.displaySmall,
      ),
      const Divider(
        height: 10,
        thickness: 2,
        indent: 0,
        endIndent: 0,
        color: Color(0xFFCCCCCC),
      ),
      Text(
        'headlineLarge',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      Text(
        'headlineMedium',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      Text(
        'headlineSmall',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      const Divider(
        height: 10,
        thickness: 2,
        indent: 0,
        endIndent: 0,
        color: Color(0xFF0000BC),
      ),
      Text(
        'titleLarge',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      Text(
        'titleMedium',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      Text(
        'titleSmall',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      const Divider(
        height: 10,
        thickness: 2,
        indent: 0,
        endIndent: 0,
        color: Color(0xFF0000BC),
      ),
      Text(
        'bodyLarge',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      Text(
        'bodyMedium',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      Text(
        'bodySmall',
        style: Theme.of(context).textTheme.bodySmall,
      ),
      const Divider(
        height: 10,
        thickness: 2,
        indent: 0,
        endIndent: 0,
        color: Color(0xFF0000BC),
      ),
      Text(
        'labelLarge',
        style: Theme.of(context).textTheme.labelLarge,
      ),
      Text(
        'labelMedium',
        style: Theme.of(context).textTheme.labelMedium,
      ),
      Text(
        'labelSmall',
        style: Theme.of(context).textTheme.labelSmall,
      ),
    ]);
  }
}
