import 'package:flutter/material.dart';
import 'package:ods_flutter/components/divider/ods_divider.dart';

/// ODS List Standard
///
/// This list contains content and actions about a single subject.
///
/// A ripple effect is managed on list tile.
class OdsListSelectionItem extends StatefulWidget {
  /// Creates an ODS List selection.
  const OdsListSelectionItem({
    Key? key,
    required this.title,
    this.subtitle,
    this.image,
    this.value,
    this.onChangedSwitch,
    this.onChangedCheckBox,
  }) : super(key: key);

  /// The list's title .
  final String title;

  /// The optional list's subtitle displayed below the title.
  final String? subtitle;

  /// The image displayed in the list.
  ///TODO For the moment the fit of the image is handled by the provided image. It should be done in the library but we need help to do that!
  final Widget? image;

  /// The optional switch or checkbox.
  final bool? value;

  /// The action executed change the switch.
  final Function(bool?)? onChangedSwitch;

  /// The action executed change the checkbox.
  final Function(bool?)? onChangedCheckBox;

  @override
  State<OdsListSelectionItem> createState() => _OdsListSelectionItemState();
}

class _OdsListSelectionItemState extends State<OdsListSelectionItem> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      child: MergeSemantics(
        child: Column(
          children: [
            if (widget.onChangedSwitch != null)
              SwitchListTile(
                secondary: widget.image,
                title: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                subtitle: widget.subtitle != null
                    ? Text(
                        widget.subtitle!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    : null,
                value: widget.value ?? false,
                onChanged: widget.onChangedSwitch,
              ),
            if (widget.onChangedCheckBox != null)
              CheckboxListTile(
                secondary: widget.image,
                title: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                subtitle: widget.subtitle != null
                    ? Text(
                        widget.subtitle!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    : null,
                value: widget.value ?? false,
                onChanged: widget.onChangedCheckBox,
              ),
            if (widget.onChangedSwitch == null &&
                widget.onChangedCheckBox == null)
              ListTile(
                leading: widget.image,
                title: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                subtitle: widget.subtitle != null
                    ? Text(
                        widget.subtitle!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    : null,
              ),
            const OdsDivider(),
          ],
        ),
      ),
    );
  }
}
