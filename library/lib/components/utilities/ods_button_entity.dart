import 'dart:ui';

/// Button entity used in ODS components.
/// It represents a simple button with a [label] and an associated action executed [onClick].
class OdsButtonEntity {
  const OdsButtonEntity({
    required this.label,
    required this.onClick,
  });

  /// The text label for this button.
  final String label;

  /// The action executed on button click.
  final VoidCallback? onClick;
}
