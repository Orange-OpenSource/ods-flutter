import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ods_flutter/components/app_bar/top/ods_top_app_bars.dart';
import 'package:ods_flutter/components/chips/ods_filter_chips.dart';
import 'package:ods_flutter/components/chips/ods_input_chips.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/chips/chips_customization.dart';
import 'package:ods_flutter_demo/ui/components/chips/chips_enum.dart';
import 'package:ods_flutter_demo/ui/theme/theme_selector.dart';

class ComponentChipsInput extends StatefulWidget {
  const ComponentChipsInput({super.key});
  @override
  State<ComponentChipsInput> createState() => _ComponentChipsInputState();
}

class _ComponentChipsInputState extends State<ComponentChipsInput> {
  bool isFiltered = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChipsCustomization(
      child: Scaffold(
        bottomSheet: OdsSheetsBottom(
          content: _CustomizationContent(),
          title: AppLocalizations.of(context)!.componentCustomizeTitle,
        ),
        appBar: OdsAppTopBars(
            title: AppLocalizations.of(context)!.chipsVariantInputTitle,
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
  int selectedIndex = 0;
  bool isFiltered = true;

  @override
  Widget build(BuildContext context) {
    final ChipsCustomizationState? customizationState =
        ChipsCustomization.of(context);
    var colorScheme = Theme.of(context).colorScheme;
    var colorFilter = ColorFilter.mode(colorScheme.secondary, BlendMode.srcIn);

    return Padding(
      padding:
          const EdgeInsets.only(left: spacingS, right: spacingM, top: spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.chipsVariantFilterDescription,
              style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: spacingM),
          Wrap(
            spacing: spacingS,
            children: List<Widget>.generate(1, (int index) {
              Widget? avatar;

              if (customizationState?.selectedElement == ChipsEnum.none) {
                avatar = null;
              } else if (customizationState?.selectedElement ==
                  ChipsEnum.avatar) {
                avatar = CircleAvatar(
                  backgroundImage: NetworkImage(
                    OdsApplication.recipes[index].url,
                  ),
                );
              } else if (customizationState?.selectedElement ==
                  ChipsEnum.icon) {
                avatar = SvgPicture.asset("assets/recipes/ic_cooking_pot.svg",
                    colorFilter: colorFilter);
              }

              return OdsInputChips(
                label: OdsApplication.recipes[index].title,
                avatar: avatar,
                onPressed:
                    customizationState?.hasEnabled == true ? () {} : null,
                onDeleted:
                    customizationState?.hasEnabled == true ? () {} : null,
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _CustomizationContent extends StatefulWidget {
  @override
  State<_CustomizationContent> createState() => _CustomizationContentState();
}

class _CustomizationContentState extends State<_CustomizationContent> {
  int selectedIndex = 0;
  bool isFiltered = true;

  @override
  Widget build(BuildContext context) {
    final ChipsCustomizationState? customizationState =
        ChipsCustomization.of(context);
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                AppLocalizations.of(context)!.componentChipsLeading,
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
                children: List<Widget>.generate(3, (int index) {
                  ChipsEnum? currentElement =
                      customizationState?.elements[index];
                  bool isSelected =
                      currentElement == customizationState?.selectedElement;
                  return Padding(
                    padding: EdgeInsets.only(right: 5, left: 10),
                    child: OdsFilterChips(
                      label: customizationState?.elements[index]
                              .stringValue(context) ??
                          '',
                      isSelected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          selectedIndex = index;
                          isFiltered = selected!;
                          customizationState?.selectedElement =
                              customizationState.elements[index];
                        });
                      },
                    ),
                  );
                }),
              ),
            ),
          ),
          OdsListSwitch(
              title: AppLocalizations.of(context)!.componentChipsEnabled,
              checked: customizationState?.hasEnabled ?? true,
              onCheckedChange: (bool value) {
                customizationState?.hasEnabled = value;
              }),
        ],
      ),
    );
  }
}
