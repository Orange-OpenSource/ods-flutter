import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ods_flutter/components/button/ods_button.dart';
import 'package:ods_flutter/components/chips/ods_filter_chips.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/buttons/button_customization.dart';
import 'package:ods_flutter_demo/ui/components/buttons/button_enum.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

enum ButtonEmphasis {
  highEmphasis,
  mediumEmphasis,
  functional,
}

class ButtonsContained extends StatefulWidget {
  final ButtonEmphasis emphasis;

  ButtonsContained({Key? key, required this.emphasis}) : super(key: key);

  @override
  _ButtonsContainedState createState() => _ButtonsContainedState();
}

class _ButtonsContainedState extends State<ButtonsContained> {
  _ButtonsContainedState();

  @override
  Widget build(BuildContext context) {
    return ButtonCustomization(
      child: Scaffold(
        bottomSheet: OdsSheetsBottom(
          content: _CustomizationContent(emphasis: widget.emphasis),
          title: AppLocalizations.of(context)!.componentCustomizeTitle,
        ),
        appBar: MainAppBar(getAppBarTitle()),
        body: SafeArea(child: _Body(emphasis: widget.emphasis)),
      ),
    );
  }

  String getAppBarTitle() {
    switch (widget.emphasis) {
      case ButtonEmphasis.highEmphasis:
        return AppLocalizations.of(context)!.buttonsHighEmphasisVariantTitle;
      case ButtonEmphasis.mediumEmphasis:
        return AppLocalizations.of(context)!.buttonsMediumEmphasisVariantTitle;
      case ButtonEmphasis.functional:
        return AppLocalizations.of(context)!.buttonsFunctionalVariantTitle;
    }
  }
}

class _Body extends StatelessWidget {
  final ButtonEmphasis emphasis;

  _Body({required this.emphasis});

  @override
  Widget build(BuildContext context) {
    final ButtonCustomizationState? customizationState =
        ButtonCustomization.of(context);

    final functionalStyle = customizationState != null
        ? (customizationState.selectedFunctionalType ==
                ButtonsEnum.functionalPositive
            ? OdsButtonStyle.functionalPositive
            : OdsButtonStyle.functionalNegative)
        : OdsButtonStyle.functionalNegative;

    return Semantics(
      header: true,
      child: Padding(
        padding: const EdgeInsets.only(
            left: spacingM, top: spacingL, right: spacingM, bottom: spacingM),
        child: OdsButton(
          title: AppLocalizations.of(context)!.componentButtonsExampleTitle,
          icon: customizationState?.hasIcon == true
              ? SvgPicture.asset('assets/ic_profile.svg', width: 18, height: 18)
              : null,
          onPressed: customizationState?.hasEnabled == true ? () {} : null,
          fullScreenWidth: customizationState?.hasFullScreen ?? false,
          style: emphasis == ButtonEmphasis.highEmphasis
              ? OdsButtonStyle.functionalPrimary
              : emphasis == ButtonEmphasis.mediumEmphasis
                  ? OdsButtonStyle.functionalDefault
                  : functionalStyle,
        ),
      ),
    );
  }
}

class _CustomizationContent extends StatefulWidget {
  final ButtonEmphasis emphasis;

  _CustomizationContent({required this.emphasis});

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
        if (ButtonEmphasis.functional == widget.emphasis)
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(spacingM),
                  child: Text(
                    AppLocalizations.of(context)!
                        .buttonsFunctionalCustomizeFunctionalTitle,
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
                      customizationState!.functionalType.length,
                      (int index) {
                        ButtonsEnum currentElement =
                            customizationState.functionalType[index];
                        bool isSelected = currentElement ==
                            customizationState.selectedFunctionalType;
                        return Padding(
                          padding:
                              EdgeInsets.only(right: spacingXs, left: spacingS),
                          child: OdsFilterChips(
                            label: customizationState.functionalType[index]
                                .stringValue(context),
                            isSelected: isSelected,
                            onSelected: (selected) {
                              setState(
                                () {
                                  customizationState.selectedFunctionalType =
                                      customizationState.functionalType[index];
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
            ],
          ),
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
