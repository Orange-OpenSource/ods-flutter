import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ods_flutter/components/button/ods_elevated_button.dart';
import 'package:ods_flutter_demo/ui/components/buttons/component_button_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

import '../utilities/customization_bottom_sheet.dart';

class ComponentElevatedButtons extends StatefulWidget {
  const ComponentElevatedButtons({super.key});

  @override
  State<ComponentElevatedButtons> createState() =>
      _ComponentElevatedButtonsState();
}

class _ComponentElevatedButtonsState extends State<ComponentElevatedButtons> {
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
    final ButtonCustomizationState? customizationState =
        ButtonCustomization.of(context);

    return Semantics(
      header: true,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15, top: 25, right: 15, bottom: 15.0),
        child: OdsElevatedButton(
          title: 'BUTTON',
          icon: customizationState?.hasIcon == true
              ? SvgPicture.asset('assets/ic_about_info.svg',
                  width: 24, height: 24)
              : null,
          onPressed: customizationState?.hasEnabled == true ? () {} : null,
          fullScreenWidth: customizationState?.hasFullScreen ?? false,
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
          value: customizationState?.hasIcon ?? true,
          title: Text(AppLocalizations.of(context)!.componentCustomizeIcon),
          onChanged: (bool value) {
            customizationState?.hasIcon = value;
          },
        ),
        SwitchListTile(
          value: customizationState?.hasFullScreen ?? true,
          title:
              Text(AppLocalizations.of(context)!.componentCustomizeFullScreen),
          onChanged: (bool value) {
            customizationState?.hasFullScreen = value;
          },
        ),
        SwitchListTile(
          value: customizationState?.hasEnabled ?? true,
          title: Text(AppLocalizations.of(context)!.componentCustomizeEnable),
          onChanged: (bool value) {
            customizationState?.hasEnabled = value;
          },
        ),
      ],
    );
  }
}