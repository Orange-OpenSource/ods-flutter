import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:get/get.dart';
import 'package:ods_flutter/components/app_bar/top/ods_top_app_bars.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/app_bars/top/component_top_app_bars_customization.dart';
import 'package:ods_flutter_demo/ui/components/utilities/customization_bottom_sheet.dart';
import 'package:ods_flutter_demo/ui/components/utilities/customization_counter.dart';
import 'package:ods_flutter_demo/ui/theme/theme_selector.dart';

class ComponentTopAppBars extends StatefulWidget {
  const ComponentTopAppBars({super.key});
  @override
  State<ComponentTopAppBars> createState() => _ComponentTopAppBarsState();
}

class _ComponentTopAppBarsState extends State<ComponentTopAppBars> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
    return ComponentTopAppBarsCustomization(
      child: Scaffold(key: _scaffoldKey, body: _Body()),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ComponentTopAppBarsCustomizationState? customizationState =
        ComponentTopAppBarsCustomization.of(context);
    final CustomizationCounterState state =
        Get.put(CustomizationCounterState());

    final actions = [
      IconButton(icon: const Icon(Icons.color_lens), onPressed: () {}),
      ThemeSelector(),
      PopupMenuButton<String>(
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          for (var recipe in OdsApplication.recipes)
            PopupMenuItem<String>(
              value: recipe.title,
              child: Text(recipe.title),
            ),
        ],
        onSelected: (String? value) {
          if (value != null) {
            final snackBar = SnackBar(
              content: Text('Click on $value'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
      ),
    ];

    return Semantics(
      checked: state.count.value >= actions.length,
      child: Obx(() => Scaffold(
            appBar: OdsAppTopBars(
              title: AppLocalizations.of(context)!.componentAppTopBarsTitle,
              actions: actions.sublist(0, state.count.value),
              leading: customizationState?.navigationIcon == true
                  ? BackButton()
                  : null,
            ),
            body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                final itemNumber = index.toString();
                return ListTile(
                  title: Text(
                    'Item #$itemNumber',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                );
              },
            ),
          )),
    );
  }
}

class _CustomizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ComponentTopAppBarsCustomizationState? customizationState =
        ComponentTopAppBarsCustomization.of(context);
    return Column(
      children: [
        SwitchListTile(
            value: customizationState?.navigationIcon ?? true,
            title: Text(AppLocalizations.of(context)!
                .componentAppTopBarsNavigationIcon),
            onChanged: (bool value) {
              customizationState?.navigationIcon = value;
            }),
        CustomizationCounter(),
      ],
    );
  }
}
