import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentCheckboxes extends StatefulWidget {
  const ComponentCheckboxes({super.key});

  @override
  State<ComponentCheckboxes> createState() => _ComponentCheckboxesState();
}

class _ComponentCheckboxesState extends State<ComponentCheckboxes> {
  bool isChecked0 = true;
  bool isChecked1 = true;
  bool isChecked2 = false;
  bool isEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          MainAppBar(AppLocalizations.of(context)!.componentCheckboxesTitle),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(25),
              child: Semantics(
                header: true,
                child: Text(
                  AppLocalizations.of(context)!
                      .checkboxesVariantTitleInformation,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            Semantics(
              label: 'Chocolate Checkbox',
              value: isChecked0 ? 'Checked' : 'Unchecked',
              enabled: isEnable,
              child: ExcludeSemantics(
                child: CheckboxListTile(
                  value: isChecked0,
                  title: Text('Chocolate'),
                  enabled: isEnable,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked0 = value!;
                    });
                  },
                ),
              ),
            ),
            Semantics(
              label: 'Butter Checkbox',
              value: isChecked2 ? 'Checked' : 'Unchecked',
              enabled: isEnable,
              child: ExcludeSemantics(
                child: CheckboxListTile(
                  value: isChecked2,
                  title: Text('Butter'),
                  enabled: isEnable,
                  onChanged: (value) {
                    setState(() {
                      isChecked2 = value!;
                    });
                  },
                ),
              ),
            ),
            Semantics(
              label: 'Sugar Checkbox',
              value: 'Checked',
              enabled: false,
              child: ExcludeSemantics(
                child: CheckboxListTile(
                    title: Text('Sugar'),
                    value: true,
                    enabled: false,
                    onChanged: (value) {
                      setState(() {
                        isChecked2 = value!;
                      });
                    }),
              ),
            ),
            Semantics(
              label: 'Eggs Checkbox',
              value: 'Unchecked',
              enabled: false,
              child: ExcludeSemantics(
                child: CheckboxListTile(
                    title: Text('Eggs'),
                    value: false,
                    enabled: false,
                    onChanged: (value) {
                      setState(() {
                        isChecked2 = value!;
                      });
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
