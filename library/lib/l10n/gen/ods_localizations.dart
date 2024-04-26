import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'ods_localizations_en.dart';

/// Callers can lookup localized strings with an instance of OdsLocalizations
/// returned by `OdsLocalizations.of(context)`.
///
/// Applications need to include `OdsLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/ods_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: OdsLocalizations.localizationsDelegates,
///   supportedLocales: OdsLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the OdsLocalizations.supportedLocales
/// property.
abstract class OdsLocalizations {
  OdsLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static OdsLocalizations? of(BuildContext context) {
    return Localizations.of<OdsLocalizations>(context, OdsLocalizations);
  }

  static const LocalizationsDelegate<OdsLocalizations> delegate = _OdsLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @localizedComponent.
  ///
  /// In en, this message translates to:
  /// **'Localized component'**
  String get localizedComponent;

  /// No description provided for @componentSheetsBottomTitle.
  ///
  /// In en, this message translates to:
  /// **'Bottom sheets'**
  String get componentSheetsBottomTitle;

  /// No description provided for @componentSheetsBottomLabel.
  ///
  /// In en, this message translates to:
  /// **'Button. Double tap to open'**
  String get componentSheetsBottomLabel;

  /// No description provided for @componentProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Progress indicator'**
  String get componentProgressTitle;

  /// No description provided for @componentNavigationBarNotification.
  ///
  /// In en, this message translates to:
  /// **'Notification(s)'**
  String get componentNavigationBarNotification;

  /// No description provided for @componentRadioButton.
  ///
  /// In en, this message translates to:
  /// **'Radio button'**
  String get componentRadioButton;

  /// No description provided for @componentRadioButtonSelected.
  ///
  /// In en, this message translates to:
  /// **'selected'**
  String get componentRadioButtonSelected;

  /// No description provided for @componentRadioButtonUnselected.
  ///
  /// In en, this message translates to:
  /// **'unselected'**
  String get componentRadioButtonUnselected;

  /// No description provided for @componentCheckboxes.
  ///
  /// In en, this message translates to:
  /// **'Checkbox'**
  String get componentCheckboxes;

  /// No description provided for @componentCheckboxesIndeterminate.
  ///
  /// In en, this message translates to:
  /// **'indeterminate'**
  String get componentCheckboxesIndeterminate;

  /// No description provided for @componentCheckboxesChecked.
  ///
  /// In en, this message translates to:
  /// **'checked'**
  String get componentCheckboxesChecked;

  /// No description provided for @componentCheckboxesUnchecked.
  ///
  /// In en, this message translates to:
  /// **'unchecked'**
  String get componentCheckboxesUnchecked;

  /// No description provided for @componentSwitches.
  ///
  /// In en, this message translates to:
  /// **'Switch'**
  String get componentSwitches;

  /// No description provided for @componentSwitchesChecked.
  ///
  /// In en, this message translates to:
  /// **'activated'**
  String get componentSwitchesChecked;

  /// No description provided for @componentSwitchesUnchecked.
  ///
  /// In en, this message translates to:
  /// **'deactivated'**
  String get componentSwitchesUnchecked;

  /// No description provided for @componentTextFieldActionObscure.
  ///
  /// In en, this message translates to:
  /// **'Show/Hide Password'**
  String get componentTextFieldActionObscure;

  /// No description provided for @componentTextFieldHidden.
  ///
  /// In en, this message translates to:
  /// **'Hidden text'**
  String get componentTextFieldHidden;

  /// No description provided for @componentTextFieldVisible.
  ///
  /// In en, this message translates to:
  /// **'Visible text'**
  String get componentTextFieldVisible;
}

class _OdsLocalizationsDelegate extends LocalizationsDelegate<OdsLocalizations> {
  const _OdsLocalizationsDelegate();

  @override
  Future<OdsLocalizations> load(Locale locale) {
    return SynchronousFuture<OdsLocalizations>(lookupOdsLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_OdsLocalizationsDelegate old) => false;
}

OdsLocalizations lookupOdsLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return OdsLocalizationsEn();
  }

  throw FlutterError(
    'OdsLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
