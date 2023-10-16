import 'dart:ui';

/// Button entity used in ODS components.
/// It represents a simple button with a [label]
/// Will be called when the user clicks the button [onClick].
class OdsButtonEntity {
  const OdsButtonEntity({
    required this.label,
    required this.onClick,
  });

  /// The text label for this button.
  final String label;

  /// The action executed on button click.
  final VoidCallback onClick;
}
