import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/lists/ods_list_standard_item.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class GuidelineSpacingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<_SpacingItem> spacingItems = [
      _SpacingItem(density: '0 dp', ratio: 'Ratio -', code: 'spacingNone'),
      _SpacingItem(density: '4 dp', ratio: 'Ratio 0.5', code: 'spacingXs'),
      _SpacingItem(density: '8 dp', ratio: 'Ratio 1', code: 'spacingS'),
      _SpacingItem(density: '16 dp', ratio: 'Ratio 2', code: 'spacingM'),
      _SpacingItem(density: '24 dp', ratio: 'Ratio 3', code: 'spacingL'),
      _SpacingItem(density: '32 dp', ratio: 'Ratio 4', code: 'spacingXl'),
      _SpacingItem(density: '40 dp', ratio: 'Ratio 5', code: 'spacingXxl'),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: MainAppBar(AppLocalizations.of(context)!.guidelinesSpacings),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(spacingS),
                child: Image.asset(
                  'assets/il_spacing.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(height: spacingS),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacingM),
                child: Text(
                  AppLocalizations.of(context)!.guidelinesSpacingsDescription,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              SizedBox(
                height: spacingM,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: spacingItems.length,
                itemBuilder: (context, index) {
                  var spacing = spacingItems[index];

                  return OdsListStandardItem(
                    title: spacing.code,
                    subtitle: spacing.density,
                    image: Image.asset(
                      'assets/il_spacing.png',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      width: 60,
                      height: 74,
                    ),
                    text: spacing.ratio,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SpacingItem {
  const _SpacingItem({
    required this.density,
    required this.ratio,
    required this.code,
  });

  final String density;
  final String ratio;
  final String code;
}
