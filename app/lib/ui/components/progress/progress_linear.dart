import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/app_bar/top/ods_top_app_bars.dart';
import 'package:ods_flutter/components/chips/ods_filter_chips.dart';
import 'package:ods_flutter/components/progress/ods_linear_progress_indicator.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/progress/progress_customization.dart';
import 'package:ods_flutter_demo/ui/components/progress/progress_enum.dart';
import 'package:ods_flutter_demo/ui/theme/theme_selector.dart';

class ComponentProgressLinear extends StatelessWidget {
  const ComponentProgressLinear({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProgressCustomization(
      child: Scaffold(
        bottomSheet: OdsSheetsBottom(
          content: _CustomizationContent(),
          title: AppLocalizations.of(context)!.componentCustomizeTitle,
        ),
        appBar: OdsAppTopBars(
            title: AppLocalizations.of(context)!.progressLinearVariantTitle,
            actions: [ThemeSelector()],
            leading: BackButton()),
        body: SafeArea(child: _Body()),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    final ProgressCustomizationState? customizationState =
        ProgressCustomization.of(context);

    double? currentProgressValue;
    switch (customizationState?.selectedProgressType ?? "") {
      case ProgressEnum.determinate:
        currentProgressValue = 0.9;
        break;
      case ProgressEnum.indeterminate:
        currentProgressValue = null;
        break;
    }

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(spacingM),
          child: OdsLinearProgressIndicator(
              progress: currentProgressValue,
              label: customizationState?.hasLabel == true
                  ? AppLocalizations.of(context)!
                      .progressCircularVariantExampleLabel
                  : null,
              icon: customizationState?.hasIcon == true
                  ? const Icon(Icons.download)
                  : null,
              showCurrentValue:
                  customizationState?.hasCurrentValue == true ? true : null),
        ),
      ),
    );
  }
}

class _CustomizationContent extends StatefulWidget {
  @override
  State<_CustomizationContent> createState() => _CustomizationContentState();
}

class _CustomizationContentState extends State<_CustomizationContent> {
  int selectedLeadingIndex = 0;
  bool isFiltered = true;

  @override
  Widget build(BuildContext context) {
    final ProgressCustomizationState? customizationState =
        ProgressCustomization.of(context);
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(spacingM),
            child: Text(
              AppLocalizations.of(context)!.componentCustomizeProgressType,
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
                  customizationState!.progressType.length, (int index) {
                ProgressEnum currentElement =
                    customizationState.progressType[index];
                bool isSelected =
                    currentElement == customizationState.selectedProgressType;
                return Padding(
                  padding: EdgeInsets.only(right: spacingXs, left: spacingS),
                  child: OdsFilterChips(
                    label: customizationState.progressType[index]
                        .stringValue(context),
                    isSelected: isSelected,
                    onSelected: (selected) {
                      setState(
                        () {
                          selectedLeadingIndex = index;
                          isFiltered = selected!;
                          customizationState.selectedProgressType =
                              customizationState.progressType[index];

                          if (customizationState.selectedProgressType ==
                              ProgressEnum.indeterminate) {
                            customizationState.hasCurrentValue = false;
                          }
                        },
                      );
                    },
                  ),
                );
              }),
            ),
          ),
        ),
        SwitchListTile(
          value: customizationState.hasLabel,
          title: Text(
              AppLocalizations.of(context)!.componentCustomizeProgressLabel),
          onChanged: (bool value) {
            customizationState.hasLabel = value;
          },
        ),
        SwitchListTile(
          value: customizationState.hasIcon,
          title: Text(
              AppLocalizations.of(context)!.componentCustomizeProgressIcon),
          onChanged: (bool value) {
            customizationState.hasIcon = value;
          },
        ),
        SwitchListTile(
          value: customizationState.hasCurrentValue,
          title: Text(AppLocalizations.of(context)!
              .componentCustomizeProgressCurrentValue),
          onChanged: customizationState.selectedProgressType ==
                  ProgressEnum.determinate
              ? (bool value) {
                  customizationState.hasCurrentValue = value;
                }
              : null,
        ),
      ],
    );
  }
}
