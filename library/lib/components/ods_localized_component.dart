import 'package:flutter/material.dart';
import 'package:ods_flutter/l10n/gen/ods_localizations.dart';

/// ODS Widget for Localization test.
///
class OdsLocalizedComponent extends StatelessWidget {
  const OdsLocalizedComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(OdsLocalizations.of(context)!.localizedComponent);
  }
}
