import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/button/ods_elevated_button.dart';
import 'package:ods_flutter_demo/ui/components/buttons/component_button_customization.dart';
import 'package:ods_flutter_demo/ui/components/utilities/customization_bottom_sheet.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentElevatedButtons extends StatefulWidget {
  const ComponentElevatedButtons({super.key});

  @override
  State<ComponentElevatedButtons> createState() => _ElevatedButtonsState();
}

class _ElevatedButtonsState extends State<ComponentElevatedButtons> {
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
              AppLocalizations.of(context)!.elevatedButtonsVariantTitle),
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
            OdsElevatedButton(
              onPressed: null,
              title: 'Outlined',
              enabled: false,
              icon: Icons.access_alarm,
            ),
          ],
        ),
      ),
    ));
  }
}

/*
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
            OdsElevatedButton(
              onPressed: isDisabled ? null : () {},
              title: 'Outlined',
              enabled: false,
              iconButton: true,
              icon: const Icon(Icons.favorite),
            ),
          ],
        ),
      ),
    );
  }
}
 */

class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ButtonCustomizationState? customizationState =
        ButtonCustomization.of(context);
    return Column(
      children: [
        SwitchListTile(
            value: customizationState?.hasFullScreen ?? true,
            title: Text(AppLocalizations.of(context)!.componentCustomizeIcon),
            onChanged: (bool value) {
              customizationState?.hasFullScreen = value;
            }),
        SwitchListTile(
            value: customizationState?.hasIcon ?? true,
            title: Text(
                AppLocalizations.of(context)!.componentCustomizeFullScreen),
            onChanged: (bool value) {
              customizationState?.hasIcon = value;
            }),
        SwitchListTile(
            value: customizationState?.hasEnabled ?? true,
            title: Text(AppLocalizations.of(context)!.componentCustomizeEnable),
            onChanged: (bool value) {
              customizationState?.hasEnabled = value;
            })
      ],
    );
  }
}
