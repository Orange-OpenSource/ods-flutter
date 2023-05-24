import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/card/ods_vertical_image_first_card.dart';
import 'package:ods_flutter/guidelines/spacings.dart';

class CardVerticalImageFirst extends StatefulWidget {
  const CardVerticalImageFirst({super.key});

  @override
  State<CardVerticalImageFirst> createState() => _CardVerticalImageFirstState();
}

class _CardVerticalImageFirstState extends State<CardVerticalImageFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context)!.cardVerticalImageFirstVariantTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(spacingM),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: OdsVerticalImageFirstCard(
                image: Image.asset('assets/placeholder.png', fit: BoxFit.cover),
                title: "Title", //TODO Add FoODS content
                subtitle: "Subtitle", //TODO Add FoODS content
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.", //TODO Add FoODS content
                button1Text:
                    AppLocalizations.of(context)?.componentElementButton1,
                button2Text:
                    AppLocalizations.of(context)?.componentElementButton2,
                onButton1Click: () {},
                onButton2Click: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
