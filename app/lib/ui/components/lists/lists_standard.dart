import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ods_flutter/components/chips/ods_filter_chips.dart';
import 'package:ods_flutter/components/lists/ods_list_standard_item.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/domain/recipes/recipes_entities.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/lists/lists_customization.dart';
import 'package:ods_flutter_demo/ui/components/lists/lists_leading_enum.dart';
import 'package:ods_flutter_demo/ui/components/lists/lists_trailing_enum.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentListsStandard extends StatefulWidget {
  const ComponentListsStandard({super.key});

  @override
  State<ComponentListsStandard> createState() => _ComponentListsStandardState();
}

class _ComponentListsStandardState extends State<ComponentListsStandard> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListsCustomization(
      child: Scaffold(
        key: _scaffoldKey,
        bottomSheet: OdsSheetsBottom(
          content: _CustomizationContent(),
          title: AppLocalizations.of(context)!.componentCustomizeTitle,
        ),
        appBar:
            MainAppBar(AppLocalizations.of(context)!.listsVariantStandardTitle),
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  List<bool> switchValues = List.filled(OdsApplication.recipes.length, true);

  @override
  Widget build(BuildContext context) {
    final ListsCustomizationState? customizationState =
        ListsCustomization.of(context);

    var colorScheme = Theme.of(context).colorScheme;
    var activeColorFilter =
        ColorFilter.mode(colorScheme.secondary, BlendMode.srcIn);

    Widget? buildFadeInImage(Recipe recipe) {
      if (customizationState?.selectedLeadingElement == ListsLeadingEnum.none) {
        return null;
      } else if (customizationState?.selectedLeadingElement ==
          ListsLeadingEnum.icon) {
        String url = "";
        if (recipe.iconName == "Restaurant") {
          url = 'assets/recipes/ic_restaurant.svg';
        } else if (recipe.iconName == "CookingPot") {
          url = 'assets/recipes/ic_cooking_pot.svg';
        } else if (recipe.iconName == "IceCream") {
          url = 'assets/recipes/ic_ice_cream.svg';
        } else if (recipe.iconName == "Cafe") {
          url = 'assets/recipes/ic_coffee.svg';
        } else if (recipe.iconName == "InformationData") {
          url = 'assets/recipes/ic_restaurant.svg';
        } else if (recipe.iconName == "OrangeDetente") {
          url = 'assets/recipes/ic_coffee.svg';
        } else if (recipe.iconName == "OrangeExpert") {
          url = 'assets/recipes/ic_ice_cream.svg';
        }

        return SvgPicture.asset(
          url,
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
        );
      } else if (customizationState?.selectedLeadingElement ==
          ListsLeadingEnum.circle) {
        return CircleAvatar(
          backgroundImage: NetworkImage(recipe.url),
          radius: 25,
        );
      } else if (customizationState?.selectedLeadingElement ==
          ListsLeadingEnum.wide) {
        return FadeInImage(
          placeholder: const AssetImage('assets/placeholder.png'),
          image: NetworkImage(recipe.url),
          fit: BoxFit.cover,
          alignment: Alignment.center,
          width: 110,
          height: 74,
          imageErrorBuilder: (context, error, stackTrace) {
            return const Image(
              image: AssetImage('assets/placeholder.png'),
              fit: BoxFit.cover,
              alignment: Alignment.center,
              width: 110,
              height: 74,
            );
          },
        );
      } else if (customizationState?.selectedLeadingElement ==
          ListsLeadingEnum.square) {
        return FadeInImage(
          placeholder: const AssetImage('assets/placeholder.png'),
          image: NetworkImage(recipe.url),
          fit: BoxFit.cover,
          alignment: Alignment.center,
          width: 60,
          height: 74,
          imageErrorBuilder: (context, error, stackTrace) {
            return const Image(
              image: AssetImage('assets/placeholder.png'),
              fit: BoxFit.cover,
              alignment: Alignment.center,
              width: 60,
              height: 74,
            );
          },
        );
      }
      return null;
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: OdsApplication.recipes.length - 4,
        itemBuilder: (context, index) {
          var recipe = OdsApplication.recipes[index];

          return OdsListStandardItem(
            title: recipe.title,
            subtitle: customizationState?.hasSubtitle == true
                ? recipe.subtitle
                : null,
            image: buildFadeInImage(recipe),
            icon: customizationState?.selectedTrailingStandardElement ==
                    ListsTrailingEnum.trailingInfoButton
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.info),
                    color: colorScheme.secondary)
                : null,
            text: customizationState?.selectedTrailingStandardElement ==
                    ListsTrailingEnum.trailingText
                ? AppLocalizations.of(context)!.listsTrailingExampleDetails
                : null,
            divider: true,
          );
        },
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
  int selectedStandardTrailingIndex = 0;
  bool isLeadingFiltered = true;
  bool isTrailingFiltered = true;

  @override
  Widget build(BuildContext context) {
    final ListsCustomizationState? customizationState =
        ListsCustomization.of(context);
    return SafeArea(
      child: Column(
        children: [
          SwitchListTile(
              value: customizationState?.hasSubtitle ?? true,
              title: Text(
                  AppLocalizations.of(context)!.listsCustomizationSubtitle),
              onChanged: (bool value) {
                customizationState?.hasSubtitle = value;
              }),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(spacingM),
              child: Text(
                AppLocalizations.of(context)!.listsLeadingCustomizationTitle,
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
                    customizationState!.leadingElements.length, (int index) {
                  ListsLeadingEnum currentElement =
                      customizationState.leadingElements[index];
                  bool isSelected = currentElement ==
                      customizationState.selectedLeadingElement;
                  return Padding(
                    padding: EdgeInsets.only(right: spacingXs, left: spacingS),
                    child: OdsFilterChips(
                      label: customizationState.leadingElements[index]
                          .stringValue(context),
                      isSelected: isSelected,
                      onSelected: (selected) {
                        setState(
                          () {
                            selectedLeadingIndex = index;
                            isLeadingFiltered = selected!;
                            customizationState.selectedLeadingElement =
                                customizationState.leadingElements[index];
                          },
                        );
                      },
                    ),
                  );
                }),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(spacingM),
              child: Text(
                AppLocalizations.of(context)!.listsTrailingCustomizationTitle,
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
                    customizationState.trailingStandardElements.length,
                    (int index) {
                  ListsTrailingEnum currentElement =
                      customizationState.trailingStandardElements[index];
                  bool isSelected = currentElement ==
                      customizationState.selectedTrailingStandardElement;
                  return Padding(
                    padding: EdgeInsets.only(right: spacingXs, left: spacingS),
                    child: OdsFilterChips(
                      label: customizationState.trailingStandardElements[index]
                          .stringValue(context),
                      isSelected: isSelected,
                      onSelected: (selected) {
                        setState(
                          () {
                            selectedStandardTrailingIndex = index;
                            isTrailingFiltered = selected!;
                            customizationState.selectedTrailingStandardElement =
                                customizationState
                                    .trailingStandardElements[index];
                          },
                        );
                      },
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
