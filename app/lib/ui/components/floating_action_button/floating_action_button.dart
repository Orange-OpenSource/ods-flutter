import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/chips/ods_filter_chips.dart';
import 'package:ods_flutter/components/floating_action_button/ods_fab.dart';
import 'package:ods_flutter/components/floating_action_button/ods_fab_extended.dart';
import 'package:ods_flutter/components/floating_action_button/ods_fab_large.dart';
import 'package:ods_flutter/components/floating_action_button/ods_fab_small.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/components/floating_action_button/floating_action_button_enum.dart';
import 'package:ods_flutter_demo/ui/components/floating_action_button/floating_action_customization.dart';
import 'package:ods_flutter_demo/ui/components/utilities/customization_bottom_sheet.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

class ComponentFloatingActionButton extends StatefulWidget {
  const ComponentFloatingActionButton({super.key});

  @override
  State<ComponentFloatingActionButton> createState() =>
      _ComponentFloatingActionButtonState();
}

class _ComponentFloatingActionButtonState
    extends State<ComponentFloatingActionButton> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButtonCustomization(
      child: Scaffold(
          key: _scaffoldKey,
          appBar: MainAppBar(
              AppLocalizations.of(context)!.componentFloatingActionButtonTitle),
          body: _Body()),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    final FloatingActionButtonCustomizationState? customizationState =
        FloatingActionButtonCustomization.of(context);

    Widget? fab;

    if (customizationState?.selectedElement ==
        FloatingActionButtonEnum.defaultFab) {
      fab = OdsFloatingActionButton(
        onPressed: () {},
        tooltip:
            AppLocalizations.of(context)!.floatingActionButtonVariantTooltip,
        icon: const Icon(Icons.add),
        //label: 'Create',
      );
    } else if (customizationState?.selectedElement ==
        FloatingActionButtonEnum.smallFab) {
      fab = OdsFloatingActionButtonSmall(
        onPressed: () {},
        tooltip:
            AppLocalizations.of(context)!.floatingActionButtonVariantTooltip,
        icon: const Icon(Icons.add),
        //label: 'Create',
      );
    } else if (customizationState?.selectedElement ==
        FloatingActionButtonEnum.largeFab) {
      fab = OdsFloatingActionButtonLarge(
        onPressed: () {},
        tooltip:
            AppLocalizations.of(context)!.floatingActionButtonVariantTooltip,
        icon: const Icon(Icons.add),
        //label: 'Create',
      );
    } else if (customizationState?.selectedElement ==
        FloatingActionButtonEnum.extendedFab) {
      fab = OdsFloatingActionButtonExtended(
        onPressed: () {},
        tooltip:
            AppLocalizations.of(context)!.floatingActionButtonVariantTooltip,
        icon: const Icon(Icons.add),
        label: AppLocalizations.of(context)!
            .floatingActionButtonVariantExtendedAdd,
        //label: 'Create',
      );
    }

    return Scaffold(
      bottomSheet: CustomizationBottomSheet(
        content: _CustomizationContent(),
      ),
      floatingActionButton: fab,
    );
  }
}

class _CustomizationContent extends StatefulWidget {
  @override
  State<_CustomizationContent> createState() => _CustomizationContentState();
}

class _CustomizationContentState extends State<_CustomizationContent> {
  int selectedIndex = 0;
  bool isFiltered = true;

  @override
  Widget build(BuildContext context) {
    final FloatingActionButtonCustomizationState? customizationState =
        FloatingActionButtonCustomization.of(context);
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(spacingM),
              child: Text(
                AppLocalizations.of(context)!.floatingActionButtonVariantSize,
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
                children: List<Widget>.generate(4, (int index) {
                  bool isSelected = selectedIndex == index;
                  return Padding(
                    padding: EdgeInsets.only(right: spacingXs, left: spacingS),
                    child: OdsFilterChips(
                      label: customizationState?.elements[index]
                              .stringValue(context) ??
                          '',
                      isSelected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          selectedIndex = index;
                          isFiltered = selected!;
                          customizationState?.selectedElement =
                              customizationState.elements[index];
                        });
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
