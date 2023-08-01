import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ods_flutter/components/chips/ods_filter_chips.dart';
import 'package:ods_flutter/components/lists/ods_list_standard_item.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentSheetsBottom extends StatefulWidget {
  const ComponentSheetsBottom({super.key});

  @override
  State<ComponentSheetsBottom> createState() => _ComponentSheetsBottomState();
}

class _ComponentSheetsBottomState extends State<ComponentSheetsBottom> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CardCustomization(
      child: Scaffold(
          bottomSheet: OdsSheetsBottom(
            content: _CustomizationContent(),
            title: AppLocalizations.of(context)!.componentCustomizeTitle,
          ),
          key: _scaffoldKey,
          appBar:
              MainAppBar(AppLocalizations.of(context)!.cardSmallVariantTitle),
          body: _Body()),
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
    final CardCustomizationState? customizationState =
        CardCustomization.of(context);

    int selectedIndex = 0;
    bool isFiltered = true;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
            left: spacingS, right: spacingM, top: spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.chipsVariantFilterDescription,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: spacingM),
            Wrap(
              spacing: spacingS,
              children: List<Widget>.generate(2, (int index) {
                bool isSelected = selectedIndex == index;

                return OdsFilterChips(
                  label: 'Test',
                  isSelected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      selectedIndex = index;
                      isFiltered = selected!;
                    });
                  },
                );
              }),
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
    final CardCustomizationState? customizationState =
        CardCustomization.of(context);

    var colorScheme = Theme.of(context).colorScheme;
    var activeColorFilter =
        ColorFilter.mode(colorScheme.secondary, BlendMode.srcIn);

    return Column(
      children: [
        OdsListStandardItem(
          title: 'Summer Salad',
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
        ),
        OdsListStandardItem(
          title: 'Broccoli Soup',
          image: SvgPicture.asset(
            'assets/recipes/ic_restaurant.svg',
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
        ),
        OdsListStandardItem(
          title: 'Pesto Farfalle',
          image: SvgPicture.asset(
            'assets/recipes/ic_restaurant.svg',
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
        ),
      ],
    );
  }
}
