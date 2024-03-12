import 'package:flutter/material.dart';

import 'gen/ods_localizations.dart';

extension OdsLocalizationsExtensions on BuildContext {
  OdsLocalizations get l10n => OdsLocalizations.of(this)!;
}
