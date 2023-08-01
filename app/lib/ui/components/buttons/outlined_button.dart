import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ods_flutter/components/button/ods_outlined_button.dart';
import 'package:ods_flutter_demo/ui/components/buttons/button_customization.dart';
import 'package:ods_flutter_demo/ui/components/utilities/customization_bottom_sheet.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentOutlinedButtons extends StatefulWidget {
  const ComponentOutlinedButtons({super.key});

  @override
  State<ComponentOutlinedButtons> createState() =>
      _ComponentOutlinedButtonsState();
}

class _ComponentOutlinedButtonsState extends State<ComponentOutlinedButtons> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ButtonCustomization(
      child: Scaffold(
          bottomSheet: CustomizationBottomSheet(
            content: _CustomizationContent(),
          ),
          key: _scaffoldKey,
          appBar: MainAppBar(
              AppLocalizations.of(context)!.outlinedButtonsVariantTitle),
          body: _Body()),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ButtonCustomizationState? customizationState =
        ButtonCustomization.of(context);

    var colorScheme = Theme.of(context).colorScheme;
    var colorFilter = ColorFilter.mode(colorScheme.primary, BlendMode.srcIn);

    return Semantics(
      header: true,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15, top: 25, right: 15, bottom: 15.0),
        child: OdsOutlinedButton(
          title: AppLocalizations.of(context)!.componentButtonsExampleTitle,
          icon: customizationState?.hasIcon == true
              ? SvgPicture.asset('assets/ic_about_info.svg',
                  width: 24, height: 24, colorFilter: colorFilter)
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
