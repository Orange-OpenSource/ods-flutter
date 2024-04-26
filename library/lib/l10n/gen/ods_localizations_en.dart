import 'ods_localizations.dart';

/// The translations for English (`en`).
class OdsLocalizationsEn extends OdsLocalizations {
  OdsLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get localizedComponent => 'Localized component';

  @override
  String get componentSheetsBottomTitle => 'Bottom sheets';

  @override
  String get componentSheetsBottomLabel => 'Button. Double tap to open';

  @override
  String get componentProgressTitle => 'Progress indicator';

  @override
  String get componentNavigationBarNotification => 'Notification(s)';

  @override
  String get componentRadioButton => 'Radio button';

  @override
  String get componentRadioButtonSelected => 'selected';

  @override
  String get componentRadioButtonUnselected => 'unselected';

  @override
  String get componentCheckboxes => 'Checkbox';

  @override
  String get componentCheckboxesIndeterminate => 'indeterminate';

  @override
  String get componentCheckboxesChecked => 'checked';

  @override
  String get componentCheckboxesUnchecked => 'unchecked';

  @override
  String get componentSwitches => 'Switch';

  @override
  String get componentSwitchesChecked => 'activated';

  @override
  String get componentSwitchesUnchecked => 'deactivated';

  @override
  String get componentTextFieldActionObscure => 'Show/Hide Password';

  @override
  String get componentTextFieldHidden => 'Hidden text';

  @override
  String get componentTextFieldVisible => 'Visible text';
}
