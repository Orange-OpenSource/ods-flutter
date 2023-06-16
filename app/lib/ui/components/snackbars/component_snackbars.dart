import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter_demo/ui/components/snackbars/component_snackbars_customization.dart';
import 'package:ods_flutter_demo/ui/components/utilities/customization_bottom_sheet.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentSnackbars extends StatefulWidget {
  const ComponentSnackbars({Key? key}) : super(key: key);

  @override
  State<ComponentSnackbars> createState() => _ComponentSnackbarsState();
}

class _ComponentSnackbarsState extends State<ComponentSnackbars> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance
        .addPostFrameCallback((_) => displayPersistentBottomSheet());
  }

  void displayPersistentBottomSheet() {
    _scaffoldKey.currentState?.showBottomSheet<void>(enableDrag: false,
        (BuildContext context) {
      return CustomizationBottomSheet(content: _CustomizationContent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return ComponentSnackbarsCustomization(
      child: Scaffold(
          key: _scaffoldKey,
          appBar:
              MainAppBar(AppLocalizations.of(context)!.componentSnackbarsTitle),
          body: _Body()),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final ComponentSnackbarsCustomizationState? customizationState =
    ComponentSnackbarsCustomization.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
            child: Text(
              'Customize the snackbar before displaying it',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                final snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  width: 400.0,
                  content: const Text('This is a snackbar'),
                  action: SnackBarAction(
                    label: 'Close',
                    onPressed: () {},
                  ),
                );

                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text(
                'Show snackbar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ComponentSnackbarsCustomizationState? customizationState =
        ComponentSnackbarsCustomization.of(context);
    return Column(
      children: [
        SwitchListTile(
            value: customizationState?.clickable ?? true,
            title: Text(AppLocalizations.of(context)!.componentCardClickable),
            onChanged: (bool value) {
              customizationState?.clickable = value;
            }),
        SwitchListTile(
            value: customizationState?.hasSubtitle ?? true,
            title: Text(AppLocalizations.of(context)!.componentElementSubtitle),
            onChanged: (bool value) {
              customizationState?.hasSubtitle = value;
            })
      ],
    );
  }
}
