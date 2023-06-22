import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter_demo/ui/components/buttons/component_button_customization.dart';
import 'package:ods_flutter_demo/ui/components/material/component_material.dart';
import 'package:ods_flutter_demo/ui/components/utilities/customization_bottom_sheet.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentFilledButtons extends StatefulWidget {
  const ComponentFilledButtons({super.key});

  @override
  State<ComponentFilledButtons> createState() => _ComponentFilledButtonsState();
}

class _ComponentFilledButtonsState extends State<ComponentFilledButtons> {
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
    return ButtonCustomization(
      child: Scaffold(
          key: _scaffoldKey,
          appBar: MainAppBar(
              AppLocalizations.of(context)!.filledButtonsVariantTitle),
          body: _Body()),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Semantics(
      header: true,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            ButtonsVariants(isDisabled: false),
            ButtonsVariants(isDisabled: true),
          ],
        ),
      ),
    ));
  }
}

class ButtonsVariants extends StatelessWidget {
  final bool isDisabled;

  const ButtonsVariants({super.key, required this.isDisabled});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            componentSpacer,
            FilledButton(
              onPressed: () {
                // Action à exécuter lorsque le bouton est pressé
              },
              child: Text("Filled"),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ButtonCustomizationState? customizationState =
        ButtonCustomization.of(context);
    return Column(
      children: [
        SwitchListTile(
            value: customizationState?.hasFullScreen ?? true,
            title: Text(AppLocalizations.of(context)!.componentCardClickable),
            onChanged: (bool value) {
              customizationState?.hasFullScreen = value;
            }),
        SwitchListTile(
            value: customizationState?.hasIcon ?? true,
            title: Text(AppLocalizations.of(context)!.componentElementSubtitle),
            onChanged: (bool value) {
              customizationState?.hasIcon = value;
            })
      ],
    );
  }
}
