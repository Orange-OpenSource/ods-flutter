import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ods_flutter/components/navigation_bar/ods_tab.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/tabs/tabs_customization.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';
import 'package:ods_flutter_demo/ui/utilities/component_count_row.dart';
import 'package:ods_flutter_demo/ui/utilities/expandable_text.dart';

class ComponentTabs extends StatefulWidget {
  const ComponentTabs({Key? key}) : super(key: key);

  @override
  State<ComponentTabs> createState() => _ComponentTabsState();
}

class _ComponentTabsState extends State<ComponentTabs> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabsCustomization(
        child: Scaffold(
      bottomSheet: OdsSheetsBottom(
        content: _CustomizationContent(),
        title: AppLocalizations.of(context)!.componentCustomizeTitle,
      ),
      key: _scaffoldKey,
      appBar: MainAppBar(AppLocalizations.of(context)!.componentTabTitle),
      body: _TabsDemo(),
    ));
  }
}

class _TabsDemo extends StatefulWidget {
  _TabsDemo();

  @override
  State<_TabsDemo> createState() => _TabsDemoState();
}

class _TabsDemoState extends State<_TabsDemo> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    final TabsCustomizationState? customizationState =
        TabsCustomization.of(context);

    List<Widget> navigationDestinations =
        _destinations(context).sublist(0, customizationState?.numberOfItems);

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Screens for each navigation destination
            SizedBox(
              height: 110,
              child: IndexedStack(
                index: selectedIndex,
                children: [
                  Center(child: Text('Coffee Screen')),
                  Center(child: Text('Cooking Pot Screen')),
                  Center(child: Text('Ice Cream Screen')),
                  Center(child: Text('Restaurant Screen')),
                  Center(child: Text('Favorites Screen')),
                ],
              ),
            ),

            /// Navigation Bar icon
            Padding(
              padding: EdgeInsets.all(spacingM),
              child: Align(
                alignment: Alignment.center,
                child: OdsTab(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  destinations: navigationDestinations,
                ),
              ),
            ),
            SizedBox(height: spacingM),

            /// Documention for svg icon
            Semantics(
              header: true,
              child: Text(
                AppLocalizations.of(context)!.tabVariantSubtitleExample,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            SizedBox(height: spacingM),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                AppLocalizations.of(context)!.tabVariantDescriptionSvgExample,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: spacingM),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ExpandableTextWidget(
                text: destinationsSvgCode,
                maxLines: 50,
              ),
            ),
            SizedBox(height: spacingM),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                AppLocalizations.of(context)!.tabVariantDescriptionPngExample,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<NavigationDestination> _destinationsStatic() {
    return [
      NavigationDestination(
          tooltip: '', icon: Icon(Icons.coffee), label: 'Coffee'),
      NavigationDestination(
          tooltip: '', icon: Icon(Icons.soup_kitchen), label: 'Cooking Pot'),
      NavigationDestination(
          tooltip: '', icon: Icon(Icons.icecream_outlined), label: 'Ice Cream'),
      NavigationDestination(
          tooltip: '',
          icon: Icon(Icons.restaurant_outlined),
          label: 'Restaurant'),
      NavigationDestination(
          tooltip: '', icon: Icon(Icons.favorite_outlined), label: 'Favorites')
    ];
  }

  List<NavigationDestination> _destinations(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    var activeColorFilter =
        ColorFilter.mode(colorScheme.primary, BlendMode.srcIn);
    var colorFilter = ColorFilter.mode(colorScheme.secondary, BlendMode.srcIn);
    return [
      NavigationDestination(
          tooltip: '',
          icon: SvgPicture.asset("assets/recipes/ic_coffee.svg",
              colorFilter: colorFilter),
          selectedIcon: SvgPicture.asset("assets/recipes/ic_coffee.svg",
              colorFilter: activeColorFilter),
          label: "Coffee"),
      NavigationDestination(
          tooltip: '',
          icon: SvgPicture.asset("assets/recipes/ic_cooking_pot.svg",
              colorFilter: colorFilter),
          selectedIcon: SvgPicture.asset("assets/recipes/ic_cooking_pot.svg",
              colorFilter: activeColorFilter),
          label: "Cooking Pot"),
      NavigationDestination(
          tooltip: '',
          icon: SvgPicture.asset("assets/recipes/ic_ice_cream.svg",
              colorFilter: colorFilter),
          selectedIcon: SvgPicture.asset("assets/recipes/ic_ice_cream.svg",
              colorFilter: activeColorFilter),
          label: "Ice Cream"),
      NavigationDestination(
          tooltip: '',
          icon: SvgPicture.asset("assets/recipes/ic_restaurant.svg",
              colorFilter: colorFilter),
          selectedIcon: SvgPicture.asset("assets/recipes/ic_restaurant.svg",
              colorFilter: activeColorFilter),
          label: "Restaurant"),
      NavigationDestination(
          tooltip: '',
          icon: SvgPicture.asset("assets/recipes/ic_heart_favorite.svg",
              colorFilter: colorFilter),
          selectedIcon: SvgPicture.asset("assets/recipes/ic_heart_favorite.svg",
              colorFilter: activeColorFilter),
          label: "Favorites"),
    ];
  }

  String destinationsSvgCode = '''
  var colorScheme = Theme.of(context).colorScheme;
  var activeColorFilter = ColorFilter.mode(colorScheme.primary, BlendMode.srcIn);
  var colorFilter = ColorFilter.mode(colorScheme.secondary, BlendMode.srcIn);
''';
  String destinationsIconCode = '''
For images provided in PNG, there is nothing to do (just provide icon: parameter), the system do it itself.
''';
}

// Bottom Sheet content
class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TabsCustomizationState? customizationState =
        TabsCustomization.of(context);
    return Column(
      children: [
        ComponentCountRow(
            title: AppLocalizations.of(context)!.tabCustomizationCount,
            minCount: TabsCustomizationState.minTabItemCount,
            maxCount: TabsCustomizationState.maxTabItemCount,
            count: customizationState!.numberOfItems,
            onChanged: (value) {
              customizationState.numberOfItems = value;
            })
      ],
    );
  }
}
