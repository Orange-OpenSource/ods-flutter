import 'package:flutter/material.dart';

import 'gen/ods_flutter_app_localizations.dart';

extension AppLocalizationsExtensions on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
