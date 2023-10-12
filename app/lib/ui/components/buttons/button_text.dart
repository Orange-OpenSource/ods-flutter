import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ods_flutter/components/button/ods_text_button.dart';
import 'package:ods_flutter/components/chips/ods_filter_chips.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/buttons/button_customization.dart';
import 'package:ods_flutter_demo/ui/components/buttons/button_enum.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ButtonsText extends StatefulWidget {
  const ButtonsText({super.key});

  @override
  State<ButtonsText> createState() => _ButtonsTextState();
}

class _ButtonsTextState extends State<ButtonsText> {
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
          appBar: MainAppBar(
              AppLocalizations.of(context)!.buttonsLowestEmphasisVariantTitle),
          body: _Body()),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ButtonCustomizationState? customizationState =
        ButtonCustomization.of(context);

    final functionalStyle = customizationState != null
        ? (customizationState.selectedStyle == ButtonsEnum.functionalPrimary
            ? OdsTextButtonStyle.functionalPrimary
            : OdsTextButtonStyle.functionalDefault)
        : OdsTextButtonStyle.functionalDefault;

    return Semantics(
      header: true,
      child: Padding(
        padding: const EdgeInsets.only(
            left: spacingM, top: spacingL, right: spacingM, bottom: spacingM),
        child: OdsTextButton(
          title: AppLocalizations.of(context)!.componentButtonsExampleTitle,
          icon: customizationState?.hasIcon == true
              ? SvgPicture.asset('assets/ic_profile.svg', width: 18, height: 18)
              : null,
          onPressed: customizationState?.hasEnabled == true ? () {} : null,
          fullScreenWidth: customizationState?.hasFullScreen ?? false,
          style: functionalStyle,
        ),
      ),
    );
  }
}

class _CustomizationContent extends StatefulWidget {
  _CustomizationContent();

  @override
  State<_CustomizationContent> createState() => _CustomizationContentState();
}

class _CustomizationContentState extends State<_CustomizationContent> {
  _CustomizationContentState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonCustomizationState? customizationState =
        ButtonCustomization.of(context);

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(spacingM),
            child: Text(
              AppLocalizations.of(context)!
                  .buttonsTextFunctionalCustomizeFunctionalTitle,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List<Widget>.generate(
                customizationState!.style.length,
                (int index) {
                  ButtonsEnum currentElement = customizationState.style[index];
                  bool isSelected =
                      currentElement == customizationState.selectedStyle;
                  return Padding(
                    padding: EdgeInsets.only(right: spacingXs, left: spacingS),
                    child: OdsFilterChips(
                      label:
                          customizationState.style[index].stringValue(context),
                      isSelected: isSelected,
                      onSelected: (selected) {
                        setState(
                          () {
                            customizationState.selectedStyle =
                                customizationState.style[index];
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        SwitchListTile(
          value: customizationState.hasIcon,
          title: Text(AppLocalizations.of(context)!.componentCustomizeIcon),
          onChanged: (bool value) {
            customizationState.hasIcon = value;
          },
        ),
        SwitchListTile(
          value: customizationState.hasFullScreen,
          title:
              Text(AppLocalizations.of(context)!.componentCustomizeFullScreen),
          onChanged: (bool value) {
            customizationState.hasFullScreen = value;
          },
        ),
        SwitchListTile(
          value: customizationState.hasEnabled,
          title: Text(AppLocalizations.of(context)!.componentCustomizeEnable),
          onChanged: (bool value) {
            customizationState.hasEnabled = value;
          },
        ),
      ],
    );
  }
}
