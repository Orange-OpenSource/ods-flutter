import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ods_flutter/components/navigation_bar/ods_navigation_bar.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/navigation_bar/navigarion_bar_customization.dart';
import 'package:ods_flutter_demo/ui/components/utilities/customization_bottom_sheet.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';
import 'package:ods_flutter_demo/ui/utilities/component_count_row.dart';
import 'package:ods_flutter_demo/ui/utilities/expandable_text.dart';

class ComponentNavigationBar extends StatefulWidget {
  const ComponentNavigationBar({Key? key}) : super(key: key);

  @override
  State<ComponentNavigationBar> createState() => _ComponentNavigationBarState();
}

class _ComponentNavigationBarState extends State<ComponentNavigationBar> {
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
    return NavigationBarCustomization(
        child: Scaffold(
      key: _scaffoldKey,
      appBar:
          MainAppBar(AppLocalizations.of(context)!.componentNavigationBarTitle),
      body: _NavBarDemo(),
    ));
  }
}

class _NavBarDemo extends StatefulWidget {
  _NavBarDemo({super.key});

  @override
  State<_NavBarDemo> createState() => _NavBarDemoState();
}

class _NavBarDemoState extends State<_NavBarDemo> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    final NavigationBarCustomizationState? customizationState =
        NavigationBarCustomization.of(context);

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
                child: OdsNavigationBar(
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
                AppLocalizations.of(context)!
                    .navigationBarVariantSubtitleExample,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            SizedBox(height: spacingM),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                AppLocalizations.of(context)!
                    .navigationBarVariantDescriptionSvgExample,
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
                AppLocalizations.of(context)!
                    .navigationBarVariantDescriptionPngExample,
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
    final NavigationBarCustomizationState? customizationState =
        NavigationBarCustomization.of(context);
    return Column(
      children: [
        ComponentCountRow(
            title:
                AppLocalizations.of(context)!.navigationBarCustomizationCount,
            minCount: NavigationBarCustomizationState.minNavigationItemCount,
            maxCount: NavigationBarCustomizationState.maxNavigationItemCount,
            count: customizationState!.numberOfItems,
            onChanged: (value) {
              customizationState.numberOfItems = value;
            })
      ],
    );
  }
}
