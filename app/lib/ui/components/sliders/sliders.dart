import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/app_bar/top/ods_top_app_bars.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/components/sliders/ods_slider.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/sliders/sliders_customization.dart';
import 'package:ods_flutter_demo/ui/theme/theme_selector.dart';

class ComponentSliders extends StatelessWidget {
  const ComponentSliders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidersCustomization(
      child: Scaffold(
        bottomSheet: OdsSheetsBottom(
          content: _CustomizationContent(),
          title: AppLocalizations.of(context)!.componentCustomizeTitle,
        ),
        appBar: OdsAppTopBars(
            title: AppLocalizations.of(context)!.componentSlidersTitle,
            actions: [ThemeSelector()],
            leading: BackButton()),
        body: SafeArea(child: _Body()),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  double value = 20.0;

  @override
  Widget build(BuildContext context) {
    final SlidersCustomizationState? customizationState =
        SlidersCustomization.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(spacingXs),
        child: OdsSlider(
          value: value,
          steps: customizationState?.stepped == true ? 10 : null,
          displayValue: customizationState?.displayValue == true
              ? value.round().toString()
              : null,
          enabled: false,
          startIcon: customizationState?.hasIcon == true
              ? Icon(Icons.volume_mute)
              : null,
          endIcon: customizationState?.hasIcon == true
              ? Icon(Icons.volume_up)
              : null,
        ),
      ),
    );
  }
}

class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SlidersCustomizationState? customizationState =
        SlidersCustomization.of(context);
    return Column(
      children: [
        SwitchListTile(
          value: customizationState?.hasIcon ?? true,
          title:
              Text(AppLocalizations.of(context)!.componentSlidersCustomizeIcon),
          onChanged: (bool value) {
            if (customizationState != null) {
              customizationState.hasIcon = value;
            }
          },
        ),
        SwitchListTile(
          value: customizationState?.displayValue ?? true,
          title: Text(AppLocalizations.of(context)!
              .componentSlidersCustomizeDisplayValue),
          onChanged: (bool value) {
            if (customizationState != null) {
              customizationState.displayValue = value;
            }
          },
        ),
        SwitchListTile(
          value: customizationState?.stepped ?? true,
          title: Text(
              AppLocalizations.of(context)!.componentCustomizeSlidersStepped),
          onChanged: (bool value) {
            if (customizationState != null) {
              customizationState.stepped = value;
            }
          },
        ),
      ],
    );
  }
}
