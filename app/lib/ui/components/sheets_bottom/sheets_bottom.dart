import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ods_flutter/components/app_bar/top/ods_top_app_bars.dart';
import 'package:ods_flutter/components/chips/ods_filter_chips.dart';
import 'package:ods_flutter/components/lists/ods_list_standard_item.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/sheets_bottom/sheets_bottom_customization.dart';
import 'package:ods_flutter_demo/ui/components/sheets_bottom/sheets_bottom_enum.dart';
import 'package:ods_flutter_demo/ui/theme/theme_selector.dart';

class ComponentSheetsBottom extends StatefulWidget {
  const ComponentSheetsBottom({super.key});
  @override
  State<ComponentSheetsBottom> createState() => _ComponentSheetsBottomState();
}

class _ComponentSheetsBottomState extends State<ComponentSheetsBottom> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SheetsBottomCustomization(
      child: Scaffold(
        bottomSheet: OdsSheetsBottom(
          content: _CustomizationContent(),
          title: AppLocalizations.of(context)!.sheetsBottomCustomizeTitle,
        ),
        appBar: OdsAppTopBars(
            title: AppLocalizations.of(context)!.componentSheetsBottomTitle,
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
    final SheetsBottomCustomizationState? customizationState =
        SheetsBottomCustomization.of(context);

    return Padding(
      padding:
          const EdgeInsets.only(left: spacingS, right: spacingM, top: spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.sheetsBottomDescriptionExample,
              style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: spacingM),
          Text(AppLocalizations.of(context)!.sheetsBottomSubtitleExample,
              style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: spacingM),
          Wrap(
            spacing: spacingS,
            children: List<Widget>.generate(
              customizationState!.elements.length,
              (int index) {
                SheetsBottomEnum? currentElement =
                    customizationState.elements[index];
                bool isSelected =
                    currentElement == customizationState.selectedElement;

                return OdsFilterChips(
                  label:
                      customizationState.elements[index].stringValue(context),
                  isSelected: isSelected,
                  onSelected: (selected) {
                    setState(
                      () {
                        selectedIndex = index;
                        isFiltered = selected!;
                        customizationState.selectedElement =
                            customizationState.elements[index];
                        print(customizationState.selectedElement);
                      },
                    );
                  },
                );
              },
            ).toList(),
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
  @override
  Widget build(BuildContext context) {
    final SheetsBottomCustomizationState? customizationState =
        SheetsBottomCustomization.of(context);
    var colorScheme = Theme.of(context).colorScheme;
    var activeColorFilter =
        ColorFilter.mode(colorScheme.secondary, BlendMode.srcIn);

    if (customizationState?.selectedElement == SheetsBottomEnum.empty) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.2,
      );
    }

    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            var recipe = OdsApplication.recipes[index];

            return OdsListStandardItem(
              title: recipe.title,
              image: SvgPicture.asset(
                'assets/recipes/ic_cooking_pot.svg',
                fit: BoxFit.cover,
                width: 55,
                height: 45,
                colorFilter: activeColorFilter,
                placeholderBuilder: (context) => Image.asset(
                  'assets/placeholder.png',
                  fit: BoxFit.cover,
                  width: 55,
                  height: 45,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
