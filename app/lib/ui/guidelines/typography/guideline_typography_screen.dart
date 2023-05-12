import 'package:flutter/material.dart';
import 'package:ods_flutter/guidelines/spacings.dart';

class GuidelineTypographyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text('Typography'),
        ),
        body: SafeArea(
          child: ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: spacingM, vertical: spacingS),
              children: [
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
              ]),
        ));
  }
}
