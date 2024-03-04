/*
 * Software Name : Orange Design System
 * SPDX-FileCopyrightText: Copyright (c) Orange SA
 * SPDX-License-Identifier: MIT
 *
 * This software is distributed under the MIT licence,
 * the text of which is available at https://opensource.org/license/MIT/
 * or see the "LICENSE" file for more details.
 *
 * Software description: Flutter library of reusable graphical components for Android and iOS
 */

import 'package:flutter/material.dart';
import 'package:ods_flutter/components/divider/ods_divider.dart';

/// ODS List Standard
///
/// This list contains content and actions about a single subject.
///
/// A ripple effect is managed on list tile.
class OdsListItem extends StatefulWidget {
  /// Creates an ODS List selection.
  const OdsListItem({
    Key? key,
    required this.title,
    this.subtitle,
    this.image,
    this.text,
    this.icon,
    this.value,
    this.onChangedSwitch,
    this.onChangedCheckBox,
    this.divider,
    this.onClick,
  }) : super(key: key);

  /// The list's title .
  final String title;

  /// The optional list's subtitle displayed below the title.
  final String? subtitle;

  /// The image displayed in the list.
  ///TODO For the moment the fit of the image is handled by the provided image. It should be done in the library but we need help to do that!
  final Widget? image;

  /// The text displayed in the list trailing.
  final String? text;

  /// The icon displayed in the list trailing.
  final Widget? icon;

  /// The optional switch or checkbox.
  final bool? value;

  /// The action executed change the switch.
  final Function(bool?)? onChangedSwitch;

  /// The action executed change the checkbox.
  final Function(bool?)? onChangedCheckBox;

  /// The divider displayed in the list.
  final bool? divider;

  /// The action to be executed when the item is pressed.
  final void Function()? onClick;

  @override
  State<OdsListItem> createState() => _OdsListItemState();
}

class _OdsListItemState extends State<OdsListItem> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      child: MergeSemantics(
        child: Column(
          children: [
            if (widget.onChangedSwitch != null)
              SwitchListTile(
                secondary: widget.image,
                title: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                subtitle: widget.subtitle != null
                    ? Text(
                        widget.subtitle!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    : null,
                value: widget.value ?? false,
                onChanged: widget.onChangedSwitch,
              ),
            if (widget.onChangedCheckBox != null)
              CheckboxListTile(
                secondary: widget.image,
                title: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                subtitle: widget.subtitle != null
                    ? Text(
                        widget.subtitle!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    : null,
                value: widget.value ?? false,
                onChanged: widget.onChangedCheckBox,
              ),
            if (widget.onChangedSwitch == null &&
                widget.onChangedCheckBox == null)
              ListTile(
                leading: widget.image,
                title: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                subtitle: widget.subtitle != null
                    ? Text(
                        widget.subtitle!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    : null,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.text != null) Text(widget.text!),
                    if (widget.icon != null) widget.icon!, // icon-2
                  ],
                ),
                onTap: widget.onClick,
              ),
            if (widget.divider != null) const OdsDivider(),
          ],
        ),
      ),
    );
  }
}
