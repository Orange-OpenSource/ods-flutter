import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ods_flutter/components/app_bar/top/ods_top_app_bars.dart';
import 'package:ods_flutter/components/chips/ods_action_chips.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/chips/chips_customization.dart';
import 'package:ods_flutter_demo/ui/components/utilities/customization_bottom_sheet.dart';
import 'package:ods_flutter_demo/ui/theme/theme_selector.dart';

class ComponentChipsAction extends StatefulWidget {
  const ComponentChipsAction({super.key});
  @override
  State<ComponentChipsAction> createState() => _ComponentChipsActionState();
}

class _ComponentChipsActionState extends State<ComponentChipsAction> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isFiltered = true;

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
    return ChipsCustomization(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: OdsAppTopBars(
            title: AppLocalizations.of(context)!.chipsVariantActionTitle,
            actions: [ThemeSelector()],
            leading: BackButton()),
        body: SafeArea(child: _Body()),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ChipsCustomizationState? customizationState =
        ChipsCustomization.of(context);
    var colorScheme = Theme.of(context).colorScheme;
    var colorFilter = ColorFilter.mode(colorScheme.secondary, BlendMode.srcIn);
    return Padding(
      padding:
          const EdgeInsets.only(left: spacingS, right: spacingM, top: spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.chipsVariantActionDescription,
              style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: spacingM),
          OdsActionChips(
            label: OdsApplication.recipes[0].title,
            avatar: SvgPicture.asset("assets/recipes/ic_cooking_pot.svg",
                colorFilter: colorFilter),
            onPressed: customizationState?.hasEnabled == true ? () {} : null,
          ),
        ],
      ),
    );
  }
}

class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ChipsCustomizationState? customizationState =
        ChipsCustomization.of(context);
    return Column(
      children: [
        SwitchListTile(
            value: customizationState?.hasEnabled ?? true,
            title: Text(AppLocalizations.of(context)!.componentChipsEnabled),
            onChanged: (bool value) {
              customizationState?.hasEnabled = value;
            }),
      ],
    );
  }
}
