import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/card/ods_small_card.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/constants.dart';
import 'package:ods_flutter_demo/ui/components/cards/card_customization.dart';
import 'package:ods_flutter_demo/ui/components/utilities/customization_bottom_sheet.dart';

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
    SchedulerBinding.instance.addPostFrameCallback((_) => displayPersistentBottomSheet());
  }

  void displayPersistentBottomSheet() {
    _scaffoldKey.currentState?.showBottomSheet<void>((BuildContext context) {
      return CustomizationBottomSheet(content: _CustomizationContent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return CardCustomization(
      child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.cardSmallVariantTitle),
          ),
          body: _Content()),
    );
  }
}

class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CardCustomizationState? customizationState = CardCustomization.of(context);
    return Column(
      children: [
        SwitchListTile(
            value: customizationState?.clickable ?? true,
            title: Text("Clickable card"),
            onChanged: (bool value) {
              customizationState?.clickable = value;
            }),
        SwitchListTile(
            value: customizationState?.hasSubtitle ?? true,
            title: Text("Subtitle"),
            onChanged: (bool value) {
              customizationState?.hasSubtitle = value;
            })
      ],
    );
  }
}

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CardCustomizationState? customizationState = CardCustomization.of(context);
    return Padding(
      padding: const EdgeInsets.all(spacingM),
      child: Column(
        children: [
          SizedBox(
            width: _computeCardWidth(customizationState!.context),
            child: OdsSmallCard(
              title: AppLocalizations.of(context)!.cardSmallVariantTitle,
              subtitle: customizationState.hasSubtitle == true ? AppLocalizations.of(context)!.cardSmallVariantSubtitle : null,
              image: Image.asset('assets/placeholder.png', semanticLabel: 'Flutter image', fit: BoxFit.fitHeight),
              onTap: customizationState.clickable ? () {} : null,
            ),
          ),
        ],
      ),
    );
  }

  double _computeCardWidth(BuildContext context) {
    // 1. remove horizontal paddings
    var cardWidth = -2 * spacingM;
    if (MediaQuery.of(context).size.width < mobileUiMaxScreenWidth) {
      // 2. split screen width in two for small width screens (2 cards per line)
      cardWidth += MediaQuery.of(context).size.width / 2;
    } else {
      // 2. split screen width in 3 for larger screens (3 cards per line)
      cardWidth += MediaQuery.of(context).size.width / 3;
    }

    return cardWidth;
  }
}
