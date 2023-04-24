import 'package:flutter/material.dart';
import 'package:ods_flutter/components/card/ods_small_card.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/constants.dart';

class CardSmall extends StatefulWidget {
  const CardSmall({super.key});

  @override
  State<CardSmall> createState() => _CardSmallState();
}

class _CardSmallState extends State<CardSmall> {
  @override
  Widget build(BuildContext context) {
    var cardWidth = -2 * spacingM;
    if (MediaQuery.of(context).size.width < mobileUiMaxScreenWidth) {
      cardWidth += MediaQuery.of(context).size.width / 2;
    } else {
      cardWidth += MediaQuery.of(context).size.width / 3.5;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Small Card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(spacingM),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: cardWidth,
              child: OdsSmallCard(
                title: 'Small card',
                subtitle: 'subtitle',
                image: Image.asset('assets/placeholder.png',
                    semanticLabel: 'Flutter image', fit: BoxFit.fitHeight),
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
