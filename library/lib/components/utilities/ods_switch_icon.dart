import 'package:flutter/material.dart';
import 'package:ods_flutter/theme/ods_palette.dart';

/// Class that encapsulates the logic for generating the thumb icon for the Switch.
class OdsSwitchIcon {
  final BuildContext context;

  /// Constructor that takes a BuildContext.
  OdsSwitchIcon(this.context);

  /// Getter for the thumbIcon property.
  MaterialStateProperty<Icon?>? get thumbIcon {
    /// Determine if the current theme is light or dark.
    final isLightTheme = Theme.of(context).brightness == Brightness.light;

    return MaterialStateProperty.resolveWith<Icon?>(
        (Set<MaterialState> states) {
      /// If the Switch is both disabled and selected.
      if (states.contains(MaterialState.disabled) &&
          states.contains(MaterialState.selected)) {
        return Icon(Icons.check, color: isLightTheme ? grey400 : black900);
      }

      /// If the Switch is selected.
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check, color: black900);
      }

      /// If the Switch is disabled.
      if (states.contains(MaterialState.disabled)) {
        return Icon(Icons.close, color: isLightTheme ? grey200 : grey600);
      }

      /// Default case: Return a close icon with a fixed white color.
      return const Icon(Icons.close, color: white100);
    });
  }
}
