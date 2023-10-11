import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ods_flutter/components/button/model/ods_button_colors.dart';
import 'package:ods_flutter/components/button/ods_text_button.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/buttons/button_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentTextButtons extends StatefulWidget {
  const ComponentTextButtons({super.key});

  @override
  State<ComponentTextButtons> createState() => _ComponentTextButtonsState();
}

class _ComponentTextButtonsState extends State<ComponentTextButtons> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ButtonCustomization(
      child: Scaffold(
          bottomSheet: OdsSheetsBottom(
            content: _CustomizationContent(),
            title: AppLocalizations.of(context)!.componentCustomizeTitle,
          ),
          key: _scaffoldKey,
          appBar:
              MainAppBar(AppLocalizations.of(context)!.textButtonsVariantTitle),
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
        padding: const EdgeInsets.only(
            left: spacingM, top: spacingL, right: spacingM, bottom: spacingM),
        child: OdsTextButton(
          title: AppLocalizations.of(context)!.componentButtonsExampleTitle,
          icon: customizationState?.hasIcon == true
              ? SvgPicture.asset('assets/ic_profil.svg', width: 18, height: 18)
              : null,
          onPressed: customizationState?.hasEnabled == true ? () {} : null,
          fullScreenWidth: customizationState?.hasFullScreen ?? false,
          style: OdsTextButtonStyle.functionalDefault,
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
