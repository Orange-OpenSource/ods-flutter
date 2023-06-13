import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/navigation_bar/navigarion_bar_customization.dart';
import 'package:ods_flutter_demo/ui/components/utilities/customization_bottom_sheet.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';
import 'package:ods_flutter_demo/ui/utilities/component_count_row.dart';

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
    SchedulerBinding.instance.addPostFrameCallback((_) => displayPersistentBottomSheet());
  }

  void displayPersistentBottomSheet() {
    _scaffoldKey.currentState?.showBottomSheet<void>(enableDrag: false, (BuildContext context) {
      return CustomizationBottomSheet(content: _CustomizationContent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBarCustomization(
        child: Scaffold(
      key: _scaffoldKey,
      appBar: MainAppBar(AppLocalizations.of(context)!.cardSmallVariantTitle),
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
    final NavigationBarCustomizationState? customizationState = NavigationBarCustomization.of(context);

    return Column(/*mainAxisAlignment: MainAxisAlignment.center, */ crossAxisAlignment: CrossAxisAlignment.center, children: [
      Padding(
          padding: EdgeInsets.all(spacingM),
          child: Focus(
              autofocus: false,
              child: NavigationBar(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  // destinations: _destinations(context).sublist(0, customizationState?.numberOfItems))))
                  destinations: _destinationsStatic().sublist(0, customizationState?.numberOfItems))))
      //_destinations(customizationState?.numberOfItems))))
    ]);
  }

  List<NavigationDestination> _destinationsStatic() {
    return [
      NavigationDestination(tooltip: '', icon: Icon(Icons.coffee), label: 'Coffee'),
      NavigationDestination(tooltip: '', icon: Icon(Icons.soup_kitchen), label: 'Cooking Pot'),
      NavigationDestination(tooltip: '', icon: Icon(Icons.icecream_outlined), label: 'Ice Cream'),
      NavigationDestination(tooltip: '', icon: Icon(Icons.restaurant_outlined), label: 'Restaurant'),
      NavigationDestination(tooltip: '', icon: Icon(Icons.favorite_outlined), label: 'Favorites')
    ];
  }

  List<NavigationDestination> _destinations(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    var activeColorFilter = ColorFilter.mode(colorScheme.primary, BlendMode.srcIn);
    var colorFilter = ColorFilter.mode(colorScheme.secondary, BlendMode.srcIn);
    return [
      NavigationDestination(
          tooltip: '',
          icon: SvgPicture.asset("assets/recipes/ic_coffee.svg", colorFilter: activeColorFilter),
          selectedIcon: SvgPicture.asset("assets/recipes/ic_coffee.svg", colorFilter: colorFilter),
          label: "Coffee"),
      NavigationDestination(
          tooltip: '',
          icon: SvgPicture.asset("assets/recipes/ic_cooking_pot.svg", colorFilter: activeColorFilter),
          selectedIcon: SvgPicture.asset("assets/recipes/ic_cooking_pot.svg", colorFilter: colorFilter),
          label: "Cooking Pot"),
      NavigationDestination(
          tooltip: '',
          icon: SvgPicture.asset("assets/recipes/ic_ice_cream.svg", colorFilter: activeColorFilter),
          selectedIcon: SvgPicture.asset("assets/recipes/ic_ice_cream.svg", colorFilter: colorFilter),
          label: "Ice Cream"),
      NavigationDestination(
          tooltip: '',
          icon: SvgPicture.asset("assets/recipes/ic_restaurant.svg", colorFilter: activeColorFilter),
          selectedIcon: SvgPicture.asset("assets/recipes/ic_restaurant.svg", colorFilter: colorFilter),
          label: "Restaurant"),
      NavigationDestination(
          tooltip: '',
          icon: SvgPicture.asset("assets/ic_heart.svg", colorFilter: activeColorFilter),
          selectedIcon: SvgPicture.asset("assets/ic_heart.svg", colorFilter: colorFilter),
          label: "Favorites"),
    ];
  }
}

// Bottom Sheet content
class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavigationBarCustomizationState? customizationState = NavigationBarCustomization.of(context);
    return Column(
      children: [
        ComponentCountRow(
            title: AppLocalizations.of(context)!.navigationBarCustomizationCount,
            minCount: NavigationBarCustomizationState.minNavigationItemCount,
            maxCount: NavigationBarCustomizationState.maxNavigationItemCount,
            count: customizationState!.numberOfItems,
            onChanged: (value) {
              customizationState!.numberOfItems = value;
            })
      ],
    );
  }
}
