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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ods_flutter/guidelines/spacings.dart';
import 'package:ods_flutter_demo/l10n/l10n.dart';
import 'package:ods_flutter_demo/ui/components/component_entities.dart';
import 'package:ods_flutter_demo/ui/main_app_bar.dart';
import 'package:ods_flutter_demo/ui/utilities/display_image.dart';

class ComponentDetailScreen extends StatelessWidget {
  final Component component;

  const ComponentDetailScreen({required this.component});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: MainAppBar(component.title),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              displayImage(
                component.imageResourceName,
                MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: const EdgeInsets.all(spacingM),
                child: Text(
                  component.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: spacingM,
                    right: spacingM,
                    top: spacingS,
                    bottom: spacingS),
                child: Text(
                  l10n.componentScreenVariantTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: component.variants.length,
                itemBuilder: (BuildContext context, int index) {
                  return VariantEntry(variant: component.variants[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VariantEntry extends StatelessWidget {
  final Variant variant;

  const VariantEntry({required this.variant});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      onTap: () {
        Get.to(variant.screen);
      },
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.play_circle_outline),
          ],
        ),
        title:
            Text(variant.title, style: Theme.of(context).textTheme.bodyMedium),
        subtitle: ExcludeSemantics(
          child: Text(variant.technicalName,
              style: Theme.of(context).textTheme.bodyMedium),
        ),
        onTap: () {
          Get.to(variant.screen);
        },
      ),
    );
  }
}
