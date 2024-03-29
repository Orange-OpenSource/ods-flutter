/*
 * Software Name : Orange Design System
 * SPDX-FileCopyrightText: Copyright (c) Orange SA
 * SPDX-License-Identifier: MIT
 *
 * This software is distributed under the MIT license,
 * the text of which is available at https://opensource.org/license/MIT/
 * or see the "LICENSE" file for more details.
 *
 * Software description: Flutter library of reusable graphical components for Android and iOS
 */

import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_app_localizations.dart';
import 'package:ods_flutter/components/chips/ods_choice_chips.dart';
import 'package:ods_flutter/components/lists/ods_list_switch.dart';
import 'package:ods_flutter/components/sheets_bottom/ods_sheets_bottom.dart';
import 'package:ods_flutter/components/textfield/ods_text_field.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/main.dart';
import 'package:ods_flutter_demo/ui/components/textfields/enum/keyboard_enum.dart';
import 'package:ods_flutter_demo/ui/components/textfields/enum/textfield_enum.dart';
import 'package:ods_flutter_demo/ui/components/textfields/textfield_customization.dart';
import 'package:ods_flutter_demo/ui/theme/model_theme.dart';
import 'package:provider/provider.dart';

class ComponentTextField extends StatefulWidget {
  const ComponentTextField({super.key});

  @override
  State<ComponentTextField> createState() => _ComponentTextFieldState();
}

class _ComponentTextFieldState extends State<ComponentTextField> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<ModelTheme>(context);
    return TextFieldCustomization(
      child: Scaffold(
          bottomSheet: OdsSheetsBottom(
            sheetContent: _CustomizationContent(),
            title: AppLocalizations.of(context)!.componentCustomizeTitle,
          ),
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.componentTextField),
            actions: [
              IconButton(
                icon: Icon(themeNotifier.themeMode == ThemeMode.light
                    ? Icons.light_mode
                    : Icons.dark_mode),
                onPressed: () {
                  setState(
                    () {
                      FocusScope.of(context).unfocus();
                      themeNotifier.themeMode =
                          themeNotifier.themeMode == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light;
                    },
                  );
                },
                tooltip: themeNotifier.themeMode == ThemeMode.light
                    ? AppLocalizations.of(context)!.themeSelectorSwitchDarkMode
                    : AppLocalizations.of(context)!
                        .themeSelectorSwitchLightMode,
              ),
            ],
          ),
          body: SafeArea(child: _Body())),
    );
  }
}

class _Body extends StatefulWidget {
  _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  var recipe =
      OdsApplication.recipes[Random().nextInt(OdsApplication.recipes.length)];

  _BodyState();

  @override
  Widget build(BuildContext context) {
    final TextFieldCustomizationState? customizationState =
        TextFieldCustomization.of(context);
    final TextEditingController controllerTextField = TextEditingController();
    TextInputType? keyboardType;
    TextInputAction? keyboardAction;

    ///Keyboard type
    switch (customizationState?.selectedKeyboardType) {
      case KeyboardTypeEnum.text:
        keyboardType = TextInputType.text;
        break;
      case KeyboardTypeEnum.decimal:
        keyboardType = TextInputType.datetime;
        break;
      case KeyboardTypeEnum.email:
        keyboardType = TextInputType.emailAddress;
        break;
      case KeyboardTypeEnum.number:
        keyboardType = TextInputType.number;
        break;
      case KeyboardTypeEnum.phone:
        keyboardType = TextInputType.phone;
        break;
      case KeyboardTypeEnum.url:
        keyboardType = TextInputType.url;
        break;
      default:
        keyboardType = TextInputType.text;
    }

    ///Keyboard action
    switch (customizationState?.selectedKeyboardAction) {
      case KeyboardActionEnum.none:
        if (Platform.isAndroid) {
          keyboardAction = TextInputAction.none;
        } else if (Platform.isIOS) {
          keyboardAction = TextInputAction.unspecified;
        }
        break;
      case KeyboardActionEnum.defaultAction:
        keyboardAction = TextInputAction.send;
        break;
      case KeyboardActionEnum.done:
        keyboardAction = TextInputAction.done;
        break;
      case KeyboardActionEnum.go:
        keyboardAction = TextInputAction.go;
        break;
      case KeyboardActionEnum.search:
        keyboardAction = TextInputAction.search;
        break;
      case KeyboardActionEnum.send:
        keyboardAction = TextInputAction.send;
        break;
      case KeyboardActionEnum.previous:
        if (Platform.isAndroid) {
          keyboardAction = TextInputAction.previous;
        }
        break;
      case KeyboardActionEnum.next:
        keyboardAction = TextInputAction.next;
        break;
    }

    return Padding(
      padding: const EdgeInsets.only(
          top: spacingL, left: spacingS, right: spacingS, bottom: spacingS),
      child: OdsTextField(
        controller: controllerTextField,
        enabled:
            customizationState?.selectedState == TextFieldStateEnum.disabled
                ? false
                : true,
        errorMessage:
            customizationState?.selectedState == TextFieldStateEnum.error
                ? AppLocalizations.of(context)!.componentTextFieldErrorMessage
                : null,
        keyboardType: keyboardType,
        keyboardActions: keyboardAction,
        label: AppLocalizations.of(context)!.componentElementLabel,
        trailingIcon:
            customizationState?.selectedTrailing == TextFieldTrailingEnum.icon
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => controllerTextField.clear(),
                  )
                : null,
        trailingText:
            customizationState?.selectedTrailing == TextFieldTrailingEnum.text
                ? "Units"
                : null,
        leadingIcon: customizationState?.leadingIcon == true
            ? const Icon(Icons.search)
            : null,
        characterCounter:
            customizationState?.characterCount == true ? 20 : null,
        maxLines:
            customizationState?.selectedElement == TextFieldEnum.multi ? 5 : 1,
        textCapitalization:
            customizationState?.capitalization == true ? true : false,
      ),
    );
  }
}

class _CustomizationContent extends StatefulWidget {
  @override
  State<_CustomizationContent> createState() => _CustomizationContentState();
}

class _CustomizationContentState extends State<_CustomizationContent> {
  @override
  Widget build(BuildContext context) {
    final TextFieldCustomizationState? customizationState =
        TextFieldCustomization.of(context);

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              tabs: [
                Tab(
                  text: AppLocalizations.of(context)!
                      .componentTextField
                      .toUpperCase(),
                ),
                Tab(
                  text: AppLocalizations.of(context)!
                      .componentTextFieldKeyboard
                      .toUpperCase(),
                )
              ],
            ),
            SizedBox(
              height: 450,
              child: TabBarView(
                children: [
                  Column(
                    children: <Widget>[
                      OdsListSwitch(
                          title: AppLocalizations.of(context)!
                              .componentElementLeadingIcon,
                          checked: customizationState?.leadingIcon ?? true,
                          onCheckedChange: (bool value) {
                            customizationState?.leadingIcon = value;
                          }),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(spacingM),
                          child: Text(
                            AppLocalizations.of(context)!
                                .componentTextFieldInputType,
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
                            children: List<Widget>.generate(
                              customizationState!.elements.length,
                              (int index) {
                                TextFieldEnum currentElement =
                                    customizationState.elements[index];
                                bool isSelected = currentElement ==
                                    customizationState.selectedElement;
                                return Padding(
                                  padding: EdgeInsets.only(
                                      right: spacingXs, left: spacingS),
                                  child: OdsChoiceChip(
                                    text: customizationState.elements[index]
                                        .stringValue(context),
                                    selected: isSelected,
                                    onClick: (selected) {
                                      setState(
                                        () {
                                          FocusScope.of(context).unfocus();
                                          customizationState.selectedElement =
                                              customizationState
                                                  .elements[index];
                                          Future.delayed(
                                                  Duration(milliseconds: 100))
                                              .then((value) {
                                            FocusScope.of(context)
                                                .requestFocus();
                                          });
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(spacingM),
                          child: Text(
                            AppLocalizations.of(context)!.componentState,
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
                            children: List<Widget>.generate(
                              customizationState.states.length,
                              (int index) {
                                TextFieldStateEnum currentElement =
                                    customizationState.states[index];
                                bool isSelected = currentElement ==
                                    customizationState.selectedState;
                                return Padding(
                                  padding: EdgeInsets.only(
                                      right: spacingXs, left: spacingS),
                                  child: OdsChoiceChip(
                                    text: customizationState.states[index]
                                        .stringValue(context),
                                    selected: isSelected,
                                    onClick: (selected) {
                                      setState(
                                        () {
                                          FocusScope.of(context).unfocus();
                                          customizationState.selectedState =
                                              customizationState.states[index];
                                          Future.delayed(
                                                  Duration(milliseconds: 100))
                                              .then((value) {
                                            FocusScope.of(context)
                                                .requestFocus();
                                          });
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(spacingM),
                          child: Text(
                            AppLocalizations.of(context)!
                                .componentElementTrailing,
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
                            children: List<Widget>.generate(
                              customizationState.trailings.length,
                              (int index) {
                                TextFieldTrailingEnum currentElement =
                                    customizationState.trailings[index];
                                bool isSelected = currentElement ==
                                    customizationState.selectedTrailing;
                                return Padding(
                                  padding: EdgeInsets.only(
                                      right: spacingXs, left: spacingS),
                                  child: OdsChoiceChip(
                                    text: customizationState.trailings[index]
                                        .stringValue(context),
                                    selected: isSelected,
                                    onClick: (selected) {
                                      setState(
                                        () {
                                          FocusScope.of(context).unfocus();
                                          customizationState.selectedTrailing =
                                              customizationState
                                                  .trailings[index];
                                          Future.delayed(
                                                  Duration(milliseconds: 100))
                                              .then((value) {
                                            FocusScope.of(context)
                                                .requestFocus();
                                          });
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      OdsListSwitch(
                          title: AppLocalizations.of(context)!
                              .componentTextFieldCharacterCounter,
                          checked: customizationState.characterCount,
                          onCheckedChange: (bool value) {
                            customizationState.characterCount = value;
                          }),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(spacingM),
                          child: Text(
                            AppLocalizations.of(context)!
                                .componentTextFieldKeyboardType,
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
                            children: List<Widget>.generate(
                              customizationState.keyboardTypes.length,
                              (int index) {
                                KeyboardTypeEnum currentElement =
                                    customizationState.keyboardTypes[index];
                                bool isSelected = currentElement ==
                                    customizationState.selectedKeyboardType;
                                return Padding(
                                  padding: EdgeInsets.only(
                                      right: spacingXs, left: spacingS),
                                  child: OdsChoiceChip(
                                    text: customizationState
                                        .keyboardTypes[index]
                                        .stringValue(context),
                                    selected: isSelected,
                                    onClick: (selected) {
                                      setState(
                                        () {
                                          FocusScope.of(context).unfocus();
                                          customizationState
                                                  .selectedKeyboardType =
                                              customizationState
                                                  .keyboardTypes[index];
                                          print(customizationState
                                              .selectedKeyboardType);
                                          Future.delayed(
                                                  Duration(milliseconds: 100))
                                              .then((value) {
                                            FocusScope.of(context)
                                                .requestFocus();
                                          });
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      OdsListSwitch(
                        title: AppLocalizations.of(context)!
                            .componentTextFieldKeyboardCapitalization,
                        checked: customizationState.capitalization,
                        onCheckedChange: (bool value) {
                          FocusScope.of(context).unfocus();

                          customizationState.capitalization = value;
                          Future.delayed(Duration(milliseconds: 100)).then(
                            (value) {
                              FocusScope.of(context).requestFocus();
                            },
                          );
                        },
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(spacingM),
                          child: Text(
                            AppLocalizations.of(context)!
                                .componentTextFieldKeyboardAction,
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
                            children: List<Widget>.generate(
                              customizationState.keyboardActions.length,
                              (int index) {
                                KeyboardActionEnum currentElement =
                                    customizationState.keyboardActions[index];
                                bool isSelected = currentElement ==
                                    customizationState.selectedKeyboardAction;
                                return Padding(
                                  padding: EdgeInsets.only(
                                      right: spacingXs, left: spacingS),
                                  child: OdsChoiceChip(
                                    text: customizationState
                                        .keyboardActions[index]
                                        .stringValue(context),
                                    selected: isSelected,
                                    onClick: (selected) {
                                      setState(
                                        () {
                                          FocusScope.of(context).unfocus();
                                          customizationState
                                                  .selectedKeyboardAction =
                                              customizationState
                                                  .keyboardActions[index];
                                          Future.delayed(
                                                  Duration(milliseconds: 100))
                                              .then((value) {
                                            FocusScope.of(context)
                                                .requestFocus();
                                          });
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
