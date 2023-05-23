import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/card/ods_small_card.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/constants.dart';

class ComponentCardSmall extends StatefulWidget {
  const ComponentCardSmall({super.key});

  @override
  State<ComponentCardSmall> createState() => _ComponentCardSmallState();
}

class _ComponentCardSmallState extends State<ComponentCardSmall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.cardSmallVariantTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(spacingM),
        child: Column(
          children: [
            SizedBox(
              width: _computeCardWidth(),
              child: OdsSmallCard(
                title: AppLocalizations.of(context)!.cardSmallVariantTitle,
                subtitle:
                    AppLocalizations.of(context)!.cardSmallVariantSubTitle,
                image: Image.asset('assets/placeholder.png',
                    semanticLabel: 'Flutter image', fit: BoxFit.fitHeight),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _computeCardWidth() {
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
