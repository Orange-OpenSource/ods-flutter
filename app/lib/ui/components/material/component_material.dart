import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';

const rowSpacer = SizedBox(width: spacingM);
const componentSpacer = SizedBox(height: spacingS);
const double cardWidth = 240;
const double widthConstraint = 450;

class ComponentMaterial extends StatefulWidget {
  @override
  State<ComponentMaterial> createState() => _ComponentMaterialState();
}

class _ComponentMaterialState extends State<ComponentMaterial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar('Material components'),
      body: ListView(
        children: [
          Buttons(),
          ButtonsIcons(),
          ButtonsFab(),
          ButtonsSegmented(),
          BottomSheets(),
          Cards(),
          Chips(),
          Dialogs(),
          Menus(),
          ProgressIndicators(),
          Sliders(),
          SnackBars(),
          TextFields(),
        ],
      ),
    );
  }
}

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      header: true,
      child: _Component(
        name: AppLocalizations.of(context)!.componentButtonsTitle,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const <Widget>[
              ButtonsVariants(isDisabled: false),
              ButtonsVariants(isDisabled: true),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonsVariants extends StatelessWidget {
  final bool isDisabled;

  const ButtonsVariants({super.key, required this.isDisabled});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              onPressed: isDisabled ? null : () {},
              child: Text(AppLocalizations.of(context)!.componentButtonsDemoElevated),
            ),
            componentSpacer,
            FilledButton(
              onPressed: isDisabled ? null : () {},
              child: Text(AppLocalizations.of(context)!.componentButtonsDemoHighest),
            ),
            componentSpacer,
            FilledButton.tonal(
              onPressed: isDisabled ? null : () {},
              child: Text(AppLocalizations.of(context)!.componentButtonsDemoHigh),
            ),
            componentSpacer,
            OutlinedButton(
              onPressed: isDisabled ? null : () {},
              child: Text(AppLocalizations.of(context)!.componentButtonsDemoMedium),
            ),
            componentSpacer,
            TextButton(
              onPressed: isDisabled ? null : () {},
              child: Text(AppLocalizations.of(context)!.componentButtonsDemoLow),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonsFab extends StatelessWidget {
  const ButtonsFab({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
        header: true,
        child: _Component(
          name: 'Floating Action Buttons (FAB)',
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: spacingS,
            spacing: spacingS,
            children: [
              FloatingActionButton.small(
                heroTag: 'btn1',
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
              FloatingActionButton.extended(
                heroTag: 'btn2',
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Create'),
              ),
              FloatingActionButton(
                heroTag: 'btn3',
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
              FloatingActionButton.large(
                heroTag: 'btn4',
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ));
  }
}

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
        header: true,
        child: _Component(
          name: 'Cards',
          child: Column(
            children: [
              SizedBox(
                width: cardWidth,
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(spacingM, spacingS, spacingS, spacingM),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: const Icon(Icons.more_vert),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(height: spacingL),
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text('Elevated'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: cardWidth,
                child: Card(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  elevation: 0,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: const Icon(Icons.more_vert),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text('Filled'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: cardWidth,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: const Icon(Icons.more_vert),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text('Outlined'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class _ClearButton extends StatelessWidget {
  const _ClearButton({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => controller.clear(),
      );
}

class TextFields extends StatefulWidget {
  const TextFields({super.key});

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  final TextEditingController _controllerFilled = TextEditingController();
  final TextEditingController _controllerOutlined = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _Component(
      name: 'Text fields',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(spacingS),
            child: TextField(
              controller: _controllerFilled,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _ClearButton(controller: _controllerFilled),
                labelText: 'Filled',
                hintText: 'hint text',
                helperText: 'helper text',
                filled: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(spacingS),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      maxLength: 10,
                      maxLengthEnforcement: MaxLengthEnforcement.none,
                      controller: _controllerFilled,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: _ClearButton(controller: _controllerFilled),
                        labelText: 'Filled',
                        hintText: 'hint text',
                        helperText: 'helper text',
                        filled: true,
                        errorText: 'error text',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: spacingS),
                Flexible(
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      controller: _controllerFilled,
                      enabled: false,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: _ClearButton(controller: _controllerFilled),
                        labelText: 'Disabled',
                        hintText: 'hint text',
                        helperText: 'helper text',
                        filled: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(spacingS),
            child: TextField(
              controller: _controllerOutlined,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _ClearButton(controller: _controllerOutlined),
                labelText: 'Outlined',
                hintText: 'hint text',
                helperText: 'helper text',
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(spacingS),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Flexible(
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      controller: _controllerOutlined,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: _ClearButton(controller: _controllerOutlined),
                        labelText: 'Outlined',
                        hintText: 'hint text',
                        helperText: 'helper text',
                        errorText: 'error text',
                        border: const OutlineInputBorder(),
                        filled: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: spacingS),
                Flexible(
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      controller: _controllerOutlined,
                      enabled: false,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: _ClearButton(controller: _controllerOutlined),
                        labelText: 'Disabled',
                        hintText: 'hint text',
                        helperText: 'helper text',
                        border: const OutlineInputBorder(),
                        filled: true,
                      ),
                    ),
                  ),
                ),
              ])),
        ],
      ),
    );
  }
}

class Dialogs extends StatefulWidget {
  const Dialogs({super.key});

  @override
  State<Dialogs> createState() => _DialogsState();
}

class _DialogsState extends State<Dialogs> {
  void openDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('What is a dialog?'),
        content: const Text(
            'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.'),
        actions: <Widget>[
          TextButton(
            child: const Text('Okay'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FilledButton(
            child: const Text('Dismiss'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void openFullscreenDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => Dialog.fullscreen(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Full-screen dialog'),
              centerTitle: false,
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
              actions: [
                TextButton(
                  child: const Text('Close'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _Component(
      name: 'Dialogs',
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          TextButton(
            child: const Text(
              'Show dialog',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () => openDialog(context),
          ),
          TextButton(
            child: const Text(
              'Show full-screen dialog',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () => openFullscreenDialog(context),
          ),
        ],
      ),
    );
  }
}

class ProgressIndicators extends StatefulWidget {
  const ProgressIndicators({super.key});

  @override
  State<ProgressIndicators> createState() => _ProgressIndicatorsState();
}

class _ProgressIndicatorsState extends State<ProgressIndicators> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
        header: true,
        child: _Component(
          name: 'Progress indicators',
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        rowSpacer,
                        CircularProgressIndicator(
                          value: null,
                        ),
                        rowSpacer,
                        Expanded(
                          child: LinearProgressIndicator(
                            value: null,
                          ),
                        ),
                        rowSpacer,
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class ButtonsIcons extends StatefulWidget {
  const ButtonsIcons({super.key});

  @override
  State<ButtonsIcons> createState() => _ButtonsIconsState();
}

class _ButtonsIconsState extends State<ButtonsIcons> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
        header: true,
        child: _Component(
          name: 'Buttons: Icons',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: const <Widget>[
                  IconToggleButton(
                    isEnabled: true,
                    tooltip: 'Standard',
                  ),
                  componentSpacer,
                  IconToggleButton(
                    isEnabled: false,
                    tooltip: 'Standard (disabled)',
                  ),
                ],
              ),
              Column(
                children: const <Widget>[
                  // Filled IconButton
                  IconToggleButton(
                    isEnabled: true,
                    tooltip: 'Filled',
                    getDefaultStyle: enabledFilledButtonStyle,
                  ),
                  componentSpacer,
                  IconToggleButton(
                    isEnabled: false,
                    tooltip: 'Filled (disabled)',
                    getDefaultStyle: disabledFilledButtonStyle,
                  ),
                ],
              ),
              Column(
                children: const <Widget>[
                  // Filled Tonal IconButton
                  IconToggleButton(
                    isEnabled: true,
                    tooltip: 'Filled tonal',
                    getDefaultStyle: enabledFilledTonalButtonStyle,
                  ),
                  componentSpacer,
                  IconToggleButton(
                    isEnabled: false,
                    tooltip: 'Filled tonal (disabled)',
                    getDefaultStyle: disabledFilledTonalButtonStyle,
                  ),
                ],
              ),
              Column(
                children: const <Widget>[
                  // Outlined IconButton
                  IconToggleButton(
                    isEnabled: true,
                    tooltip: 'Outlined',
                    getDefaultStyle: enabledOutlinedButtonStyle,
                  ),
                  componentSpacer,
                  IconToggleButton(
                    isEnabled: false,
                    tooltip: 'Outlined (disabled)',
                    getDefaultStyle: disabledOutlinedButtonStyle,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class IconToggleButton extends StatefulWidget {
  const IconToggleButton({
    required this.isEnabled,
    required this.tooltip,
    this.getDefaultStyle,
    super.key,
  });

  final bool isEnabled;
  final String tooltip;
  final ButtonStyle? Function(bool, ColorScheme)? getDefaultStyle;

  @override
  State<IconToggleButton> createState() => _IconToggleButtonState();
}

class _IconToggleButtonState extends State<IconToggleButton> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final VoidCallback? onPressed = widget.isEnabled
        ? () {
            setState(() {
              selected = !selected;
            });
          }
        : null;
    ButtonStyle? style = widget.getDefaultStyle?.call(selected, colors);

    return IconButton(
      visualDensity: VisualDensity.standard,
      isSelected: selected,
      tooltip: widget.tooltip,
      icon: const Icon(Icons.settings_outlined),
      selectedIcon: const Icon(Icons.settings),
      onPressed: onPressed,
      style: style,
    );
  }
}

ButtonStyle enabledFilledButtonStyle(bool selected, ColorScheme colors) {
  return IconButton.styleFrom(
    foregroundColor: selected ? colors.onPrimary : colors.primary,
    backgroundColor: selected ? colors.primary : colors.surfaceVariant,
    disabledForegroundColor: colors.onSurface.withOpacity(0.38),
    disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
    hoverColor: selected ? colors.onPrimary.withOpacity(0.08) : colors.primary.withOpacity(0.08),
    focusColor: selected ? colors.onPrimary.withOpacity(0.12) : colors.primary.withOpacity(0.12),
    highlightColor: selected ? colors.onPrimary.withOpacity(0.12) : colors.primary.withOpacity(0.12),
  );
}

ButtonStyle disabledFilledButtonStyle(bool selected, ColorScheme colors) {
  return IconButton.styleFrom(
    disabledForegroundColor: colors.onSurface.withOpacity(0.38),
    disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
  );
}

ButtonStyle enabledFilledTonalButtonStyle(bool selected, ColorScheme colors) {
  return IconButton.styleFrom(
    foregroundColor: selected ? colors.onSecondaryContainer : colors.onSurfaceVariant,
    backgroundColor: selected ? colors.secondaryContainer : colors.surfaceVariant,
    hoverColor: selected ? colors.onSecondaryContainer.withOpacity(0.08) : colors.onSurfaceVariant.withOpacity(0.08),
    focusColor: selected ? colors.onSecondaryContainer.withOpacity(0.12) : colors.onSurfaceVariant.withOpacity(0.12),
    highlightColor: selected ? colors.onSecondaryContainer.withOpacity(0.12) : colors.onSurfaceVariant.withOpacity(0.12),
  );
}

ButtonStyle disabledFilledTonalButtonStyle(bool selected, ColorScheme colors) {
  return IconButton.styleFrom(
    disabledForegroundColor: colors.onSurface.withOpacity(0.38),
    disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
  );
}

ButtonStyle enabledOutlinedButtonStyle(bool selected, ColorScheme colors) {
  return IconButton.styleFrom(
    backgroundColor: selected ? colors.inverseSurface : null,
    hoverColor: selected ? colors.onInverseSurface.withOpacity(0.08) : colors.onSurfaceVariant.withOpacity(0.08),
    focusColor: selected ? colors.onInverseSurface.withOpacity(0.12) : colors.onSurfaceVariant.withOpacity(0.12),
    highlightColor: selected ? colors.onInverseSurface.withOpacity(0.12) : colors.onSurface.withOpacity(0.12),
    side: BorderSide(color: colors.outline),
  ).copyWith(
    foregroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return colors.onInverseSurface;
      }
      if (states.contains(MaterialState.pressed)) {
        return colors.onSurface;
      }
      return null;
    }),
  );
}

ButtonStyle disabledOutlinedButtonStyle(bool selected, ColorScheme colors) {
  return IconButton.styleFrom(
    disabledForegroundColor: colors.onSurface.withOpacity(0.38),
    disabledBackgroundColor: selected ? colors.onSurface.withOpacity(0.12) : null,
    side: selected ? null : BorderSide(color: colors.outline.withOpacity(0.12)),
  );
}

class Chips extends StatefulWidget {
  const Chips({super.key});

  @override
  State<Chips> createState() => _ChipsState();
}

class _ChipsState extends State<Chips> {
  bool isFiltered = true;

  @override
  Widget build(BuildContext context) {
    return Semantics(
        header: true,
        child: _Component(
          name: 'Chips',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Wrap(
                spacing: spacingS,
                runSpacing: spacingS,
                children: <Widget>[
                  ActionChip(
                    label: const Text('Assist'),
                    avatar: const Icon(Icons.event),
                    onPressed: () {},
                  ),
                  FilterChip(
                    label: const Text('Filter'),
                    selected: isFiltered,
                    onSelected: (selected) {
                      setState(() => isFiltered = selected);
                    },
                  ),
                  InputChip(
                    label: const Text('Input'),
                    onPressed: () {},
                    onDeleted: () {},
                  ),
                  ActionChip(
                    label: const Text('Suggestion'),
                    onPressed: () {},
                  ),
                ],
              ),
              componentSpacer,
              Wrap(
                spacing: spacingS,
                runSpacing: spacingS,
                children: <Widget>[
                  const ActionChip(
                    label: Text('Assist'),
                    avatar: Icon(Icons.event),
                  ),
                  FilterChip(
                    label: const Text('Filter'),
                    selected: isFiltered,
                    onSelected: null,
                  ),
                  InputChip(
                    label: const Text('Input'),
                    onDeleted: () {},
                    isEnabled: false,
                  ),
                  const ActionChip(
                    label: Text('Suggestion'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class ButtonsSegmented extends StatelessWidget {
  const ButtonsSegmented({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
        header: true,
        child: _Component(
          name: 'Segmented buttons',
          child: Column(
            children: const <Widget>[
              SingleChoice(),
              componentSpacer,
              MultipleChoice(),
            ],
          ),
        ));
  }
}

enum Calendar { day, week, month, year }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(value: Calendar.day, label: Text('Day'), icon: Icon(Icons.calendar_view_day)),
        ButtonSegment<Calendar>(value: Calendar.week, label: Text('Week'), icon: Icon(Icons.calendar_view_week)),
        ButtonSegment<Calendar>(value: Calendar.month, label: Text('Month'), icon: Icon(Icons.calendar_view_month)),
        ButtonSegment<Calendar>(value: Calendar.year, label: Text('Year'), icon: Icon(Icons.calendar_today)),
      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          calendarView = newSelection.first;
        });
      },
    );
  }
}

enum Sizes { extraSmall, small, medium, large, extraLarge }

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>(
      segments: const <ButtonSegment<Sizes>>[
        ButtonSegment<Sizes>(value: Sizes.extraSmall, label: Text('XS')),
        ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
        ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
        ButtonSegment<Sizes>(
          value: Sizes.large,
          label: Text('L'),
        ),
        ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text('XL')),
      ],
      selected: selection,
      onSelectionChanged: (newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}

class SnackBars extends StatelessWidget {
  const SnackBars({super.key});

  @override
  Widget build(BuildContext context) {
    return _Component(
      name: 'Snackbars',
      child: TextButton(
        onPressed: () {
          final snackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            width: 400.0,
            content: const Text('This is a snackbar'),
            action: SnackBarAction(
              label: 'Close',
              onPressed: () {},
            ),
          );

          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text(
          'Show snackbar',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class BottomSheets extends StatefulWidget {
  const BottomSheets({super.key});

  @override
  State<BottomSheets> createState() => _BottomSheetsState();
}

class _BottomSheetsState extends State<BottomSheets> {
  bool isNonModalBottomSheetOpen = false;
  PersistentBottomSheetController<void>? _nonModalBottomSheetController;

  @override
  Widget build(BuildContext context) {
    List<Widget> buttonList = <Widget>[
      IconButton(onPressed: () {}, icon: const Icon(Icons.share_outlined)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.delete_outline)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.archive_outlined)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
    ];
    List<Text> labelList = const <Text>[Text('Share'), Text('Add to'), Text('Trash'), Text('Archive'), Text('Settings'), Text('Favorite')];

    buttonList = List.generate(
        buttonList.length,
        (index) => Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buttonList[index],
                  labelList[index],
                ],
              ),
            ));

    return Semantics(
      header: true,
      child: _Component(
        name: 'Bottom sheet',
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: [
            TextButton(
              child: const Text(
                'Show modal bottom sheet',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  // TODO: Remove when this is in the framework https://github.com/flutter/flutter/issues/118619
                  constraints: const BoxConstraints(maxWidth: 640),
                  builder: (context) {
                    return SizedBox(
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: buttonList,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            TextButton(
              child: Text(
                isNonModalBottomSheetOpen ? 'Hide bottom sheet' : 'Show bottom sheet',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                if (isNonModalBottomSheetOpen) {
                  _nonModalBottomSheetController?.close();
                  setState(() {
                    isNonModalBottomSheetOpen = false;
                  });
                  return;
                } else {
                  setState(() {
                    isNonModalBottomSheetOpen = true;
                  });
                }

                _nonModalBottomSheetController = showBottomSheet<void>(
                  elevation: 8.0,
                  context: context,
                  // TODO: Remove when this is in the framework https://github.com/flutter/flutter/issues/118619
                  constraints: const BoxConstraints(maxWidth: 640),
                  builder: (context) {
                    return SizedBox(
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: buttonList,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomAppBars extends StatelessWidget {
  const BottomAppBars({super.key});

  @override
  Widget build(BuildContext context) {
    return _Component(
      name: 'Bottom app bar',
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                elevation: 0.0,
                child: const Icon(Icons.add),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
              bottomNavigationBar: BottomAppBar(
                child: Row(
                  children: <Widget>[
                    const IconButtonAnchorExample(),
                    IconButton(
                      tooltip: 'Search',
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                    IconButton(
                      tooltip: 'Favorite',
                      icon: const Icon(Icons.favorite),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconButtonAnchorExample extends StatelessWidget {
  const IconButtonAnchorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder: (context, controller, child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(Icons.more_vert),
        );
      },
      menuChildren: [
        MenuItemButton(
          child: const Text('Menu 1'),
          onPressed: () {},
        ),
        MenuItemButton(
          child: const Text('Menu 2'),
          onPressed: () {},
        ),
        SubmenuButton(
          menuChildren: <Widget>[
            MenuItemButton(
              onPressed: () {},
              child: const Text('Menu 3.1'),
            ),
            MenuItemButton(
              onPressed: () {},
              child: const Text('Menu 3.2'),
            ),
            MenuItemButton(
              onPressed: () {},
              child: const Text('Menu 3.3'),
            ),
          ],
          child: const Text('Menu 3'),
        ),
      ],
    );
  }
}

class ButtonAnchorExample extends StatelessWidget {
  const ButtonAnchorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder: (context, controller, child) {
        return FilledButton.tonal(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          child: const Text('Show menu'),
        );
      },
      menuChildren: [
        MenuItemButton(
          leadingIcon: const Icon(Icons.people_alt_outlined),
          child: const Text('Item 1'),
          onPressed: () {},
        ),
        MenuItemButton(
          leadingIcon: const Icon(Icons.remove_red_eye_outlined),
          child: const Text('Item 2'),
          onPressed: () {},
        ),
        MenuItemButton(
          leadingIcon: const Icon(Icons.refresh),
          onPressed: () {},
          child: const Text('Item 3'),
        ),
      ],
    );
  }
}

class NavigationDrawers extends StatelessWidget {
  const NavigationDrawers({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return _Component(
      name: 'Navigation drawer',
      child: Column(
        children: [
          const SizedBox(height: 520, child: NavigationDrawerSection()),
          componentSpacer,
          componentSpacer,
          TextButton(
            child: const Text('Show modal navigation drawer', style: TextStyle(fontWeight: FontWeight.bold)),
            onPressed: () {
              scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
      ),
    );
  }
}

class NavigationDrawerSection extends StatefulWidget {
  const NavigationDrawerSection({super.key});

  @override
  State<NavigationDrawerSection> createState() => _NavigationDrawerSectionState();
}

class _NavigationDrawerSectionState extends State<NavigationDrawerSection> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: (selectedIndex) {
        setState(() {
          navDrawerIndex = selectedIndex;
        });
      },
      selectedIndex: navDrawerIndex,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text(
            'Mail',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        ...destinations.map((destination) {
          return NavigationDrawerDestination(
            label: Text(destination.label),
            icon: destination.icon,
            selectedIcon: destination.selectedIcon,
          );
        }),
        const Divider(indent: 28, endIndent: 28),
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text(
            'Labels',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        ...labelDestinations.map((destination) {
          return NavigationDrawerDestination(
            label: Text(destination.label),
            icon: destination.icon,
            selectedIcon: destination.selectedIcon,
          );
        }),
      ],
    );
  }
}

class ExampleDestination {
  const ExampleDestination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

const List<ExampleDestination> destinations = <ExampleDestination>[
  ExampleDestination('Inbox', Icon(Icons.inbox_outlined), Icon(Icons.inbox)),
  ExampleDestination('Outbox', Icon(Icons.send_outlined), Icon(Icons.send)),
  ExampleDestination('Favorites', Icon(Icons.favorite_outline), Icon(Icons.favorite)),
  ExampleDestination('Trash', Icon(Icons.delete_outline), Icon(Icons.delete)),
];

const List<ExampleDestination> labelDestinations = <ExampleDestination>[
  ExampleDestination('Family', Icon(Icons.bookmark_border), Icon(Icons.bookmark)),
  ExampleDestination('School', Icon(Icons.bookmark_border), Icon(Icons.bookmark)),
  ExampleDestination('Work', Icon(Icons.bookmark_border), Icon(Icons.bookmark)),
];

class NavigationRails extends StatelessWidget {
  const NavigationRails({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Component(
      name: 'Navigation rail',
      child: IntrinsicWidth(child: SizedBox(height: 420, child: NavigationRailSection())),
    );
  }
}

class NavigationRailSection extends StatefulWidget {
  const NavigationRailSection({super.key});

  @override
  State<NavigationRailSection> createState() => _NavigationRailSectionState();
}

class _NavigationRailSectionState extends State<NavigationRailSection> {
  int navRailIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      onDestinationSelected: (selectedIndex) {
        setState(() {
          navRailIndex = selectedIndex;
        });
      },
      elevation: 4,
      leading: FloatingActionButton(child: const Icon(Icons.create), onPressed: () {}),
      groupAlignment: 0.0,
      selectedIndex: navRailIndex,
      labelType: NavigationRailLabelType.selected,
      destinations: <NavigationRailDestination>[
        ...destinations.map((destination) {
          return NavigationRailDestination(
            label: Text(destination.label),
            icon: destination.icon,
            selectedIcon: destination.selectedIcon,
          );
        }),
      ],
    );
  }
}

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return _Component(
      name: 'Tabs',
      child: SizedBox(
        height: 80,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              controller: _tabController,
              tabs: const <Widget>[
                Tab(
                  icon: Icon(Icons.videocam_outlined),
                  text: 'Video',
                  iconMargin: EdgeInsets.only(bottom: 0.0),
                ),
                Tab(
                  icon: Icon(Icons.photo_outlined),
                  text: 'Photos',
                  iconMargin: EdgeInsets.only(bottom: 0.0),
                ),
                Tab(
                  icon: Icon(Icons.audiotrack_sharp),
                  text: 'Audio',
                  iconMargin: EdgeInsets.only(bottom: 0.0),
                ),
              ],
            ),
            // TODO: Showcase secondary tab bar https://github.com/flutter/flutter/issues/111962
          ),
        ),
      ),
    );
  }
}

class TopAppBars extends StatelessWidget {
  const TopAppBars({super.key});

  static final actions = [
    IconButton(icon: const Icon(Icons.attach_file), onPressed: () {}),
    IconButton(icon: const Icon(Icons.event), onPressed: () {}),
    IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return _Component(
      name: 'Top app bars',
      child: Column(
        children: [
          AppBar(
            title: const Text('Center-aligned'),
            leading: const BackButton(),
            actions: [
              IconButton(
                iconSize: 32,
                icon: const Icon(Icons.account_circle_outlined),
                onPressed: () {},
              ),
            ],
            centerTitle: true,
          ),
          componentSpacer,
          AppBar(
            title: const Text('Small'),
            leading: const BackButton(),
            actions: actions,
            centerTitle: false,
          ),
          componentSpacer,
          SizedBox(
            height: 100,
            child: CustomScrollView(
              slivers: [
                SliverAppBar.medium(
                  title: const Text('Medium'),
                  leading: const BackButton(),
                  actions: actions,
                ),
                const SliverFillRemaining(),
              ],
            ),
          ),
          componentSpacer,
          SizedBox(
            height: 130,
            child: CustomScrollView(
              slivers: [
                SliverAppBar.large(
                  title: const Text('Large'),
                  leading: const BackButton(),
                  actions: actions,
                ),
                const SliverFillRemaining(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Menus extends StatefulWidget {
  const Menus({super.key});

  @override
  State<Menus> createState() => _MenusState();
}

class _MenusState extends State<Menus> {
  final TextEditingController colorController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  IconLabel? selectedIcon = IconLabel.smile;
  ColorLabel? selectedColor;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<ColorLabel>> colorEntries = <DropdownMenuEntry<ColorLabel>>[];
    for (final ColorLabel color in ColorLabel.values) {
      colorEntries.add(DropdownMenuEntry<ColorLabel>(value: color, label: color.label, enabled: color.label != 'Grey'));
    }

    final List<DropdownMenuEntry<IconLabel>> iconEntries = <DropdownMenuEntry<IconLabel>>[];
    for (final IconLabel icon in IconLabel.values) {
      iconEntries.add(DropdownMenuEntry<IconLabel>(value: icon, label: icon.label));
    }

    return _Component(
      name: 'Menus',
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              ButtonAnchorExample(),
              rowSpacer,
              IconButtonAnchorExample(),
            ],
          ),
          componentSpacer,
          Wrap(
            alignment: WrapAlignment.spaceAround,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: spacingS,
            runSpacing: spacingS,
            children: [
              DropdownMenu<ColorLabel>(
                controller: colorController,
                label: const Text('Color'),
                enableFilter: true,
                dropdownMenuEntries: colorEntries,
                inputDecorationTheme: const InputDecorationTheme(filled: true),
                onSelected: (color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
              ),
              DropdownMenu<IconLabel>(
                initialSelection: IconLabel.smile,
                controller: iconController,
                leadingIcon: const Icon(Icons.search),
                label: const Text('Icon'),
                dropdownMenuEntries: iconEntries,
                onSelected: (icon) {
                  setState(() {
                    selectedIcon = icon;
                  });
                },
              ),
              Icon(
                selectedIcon?.icon,
                color: selectedColor?.color ?? Colors.grey.withOpacity(0.5),
              )
            ],
          ),
        ],
      ),
    );
  }
}

enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Yellow', Colors.yellow),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);

  final String label;
  final Color color;
}

enum IconLabel {
  smile('Smile', Icons.sentiment_satisfied_outlined),
  cloud(
    'Cloud',
    Icons.cloud_outlined,
  ),
  brush('Brush', Icons.brush_outlined),
  heart('Heart', Icons.favorite);

  const IconLabel(this.label, this.icon);

  final String label;
  final IconData icon;
}

class Sliders extends StatefulWidget {
  const Sliders({super.key});

  @override
  State<Sliders> createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  double sliderValue0 = 30.0;
  double sliderValue1 = 20.0;

  @override
  Widget build(BuildContext context) {
    return _Component(
        name: 'Sliders',
        child: Column(
          children: <Widget>[
            Slider(
              max: 100,
              value: sliderValue0,
              onChanged: (value) {
                setState(() {
                  sliderValue0 = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Slider(
              max: 100,
              divisions: 5,
              value: sliderValue1,
              label: sliderValue1.round().toString(),
              onChanged: (value) {
                setState(() {
                  sliderValue1 = value;
                });
              },
            ),
          ],
        ));
  }
}

class _Component extends StatefulWidget {
  const _Component({
    super.key,
    required this.name,
    required this.child,
  });

  final String name;
  final Widget child;

  @override
  State<_Component> createState() => _ComponentState();
}

class _ComponentState extends State<_Component> {
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: spacingS, horizontal: spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: widthConstraint),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: spacingM),
                child: Center(
                  child: widget.child,
                ),
              ),
            ),
            componentSpacer,
          ],
        ),
      ),
    );
  }
}
