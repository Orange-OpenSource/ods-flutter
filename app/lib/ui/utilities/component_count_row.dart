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

class ComponentCountRow extends StatefulWidget {
  ComponentCountRow(
      {Key? key,
      required this.title,
      this.count = 1,
      this.minCount = 1,
      this.maxCount = 100,
      this.onChanged})
      : super(key: key);

  final String title;

  // min value user can pick
  final int minCount;

  // max value user can pick
  final int maxCount;

  /// called when value has changed
  final ValueChanged<int>? onChanged;

  /// initial Value
  final int count;

  @override
  State<ComponentCountRow> createState() => _ComponentCountRowState();
}

class _ComponentCountRowState extends State<ComponentCountRow> {
  late int _count;

  @override
  void initState() {
    super.initState();
    _count = widget.count;
  }

  _inc() {
    setState(() {
      _count++;
    });
    widget.onChanged!(_count);
  }

  _dec() {
    setState(() {
      _count--;
    });
    widget.onChanged!(_count);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyLarge,
          )),
          MaterialButton(
              minWidth: 40,
              height: 40,
              onPressed: _count > widget.minCount ? _dec : null,
              child: Icon(Icons.remove_circle_outline_outlined)),
          Text("$_count"),
          MaterialButton(
              minWidth: 40,
              height: 40,
              onPressed: _count < widget.maxCount ? _inc : null,
              child: Icon(Icons.add_circle_outline)),
        ],
      ),
    );
  }
}
