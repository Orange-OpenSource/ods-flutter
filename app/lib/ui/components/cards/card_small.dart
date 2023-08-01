import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/card/ods_small_card.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_customization.dart';
import 'package:ods_flutter_demo/ui/components/utilities/customization_bottom_sheet.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class CardSmall extends StatefulWidget {
  const CardSmall({super.key});

  @override
  State<CardSmall> createState() => _CardSmallState();
}

class _CardSmallState extends State<CardSmall> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CardCustomization(
      child: Scaffold(
          bottomSheet: CustomizationBottomSheet(
            content: _CustomizationContent(),
          ),
          key: _scaffoldKey,
          appBar:
              MainAppBar(AppLocalizations.of(context)!.cardSmallVariantTitle),
          body: _Body()),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CardCustomizationState? customizationState =
        CardCustomization.of(context);

    return SafeArea(
      child: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            childAspectRatio: orientation == Orientation.portrait ? 0.9 : 1.1,
            children: OdsApplication.recipes
                .map(
                  (recipe) {
                    return Column(
                      children: [
                        OdsSmallCard(
                          title: recipe.title,
                          subtitle: customizationState?.hasSubtitle == true
                              ? recipe.subtitle
                              : null,
                          image: FadeInImage(
                            placeholder: AssetImage('assets/placeholder.png'),
                            image: NetworkImage(recipe.url),
                            fit: BoxFit.cover,
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Image(
                                image: AssetImage('assets/placeholder.png'),
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                          onTap: customizationState!.clickable ? () {} : null,
                        ),
                      ],
                    );
                  },
                )
                .take(1) // Take only the first element from the map
                .toList(),
          );
        },
      ),
    );
  }
}

class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CardCustomizationState? customizationState =
        CardCustomization.of(context);
    return Column(
      children: [
        SwitchListTile(
            value: customizationState?.clickable ?? true,
            title: Text(AppLocalizations.of(context)!.componentCardClickable),
            onChanged: (bool value) {
              customizationState?.clickable = value;
            }),
        SwitchListTile(
            value: customizationState?.hasSubtitle ?? true,
            title: Text(AppLocalizations.of(context)!.componentElementSubtitle),
            onChanged: (bool value) {
              customizationState?.hasSubtitle = value;
            })
      ],
    );
  }
}
