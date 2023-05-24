<h1 align="center">Orange Design System Flutter Library</h1>

<p align="center">
  ODS Flutter provides Orange Flutter components for Android and iOS to developers.
  <br>
  <a href="https://orange-opensource.github.io/ods-flutter"><strong>Visit ODS Flutter</strong></a>
  <br>
  <br>
  <a href="https://github.com/Orange-OpenSource/ods-flutter/issues/new?assignees=B3nz01d&labels=bug%2Ctriage&template=bug_report.yml&title=%5BBug%5D%3A+Bug+Summary">Report bug</a>
  ·
  <a href="https://github.com/Orange-OpenSource/ods-flutter/issues/new?assignees=B3nz01d&labels=feature%2Ctriage&template=feature_request.yml&title=%5Bfeature%5D%3A+">Request feature</a>
</p>

## Table of contents

- [Build](#build)
- [How to use](#how-to-use)

## Build

### Generate l10n files

**Development process**

* Developer modify `ods_flutter_en.arb` (and/or other languages files)
* In order to have the translations in the app launched locally, `flutter gen-l10n` must be launched in the `lib` directory
    * It will regenerate:
        * `ods_flutter_localizations.dart`
        * `ods_flutter_localizations_en.dart`
        * other languages files
* Those files need **must not be** committed and pushed

**Release the library**

* Pre-step: run `flutter gen-l10n` before creating and publishing the package to generate `ods_flutter_localizations*.dart`


## How to use

### Localization

To setup localization of the ods_flutter library, you need to set the `OdsLocalizations.delegate` in the `localizationsDelegates` properties of the `MaterialApp`. 

```Dart
MaterialApp(
  title: 'Title of your app',
  // ...
  // Localization setup
  supportedLocales: AppLocalizations.supportedLocales,
  localizationsDelegates: [
    AppLocalizations.delegate,
    OdsLocalizations.delegate,
  ],
)
```
