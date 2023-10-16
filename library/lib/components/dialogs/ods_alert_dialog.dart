import 'package:flutter/material.dart';
import 'package:ods_flutter/components/button/ods_button.dart';
import 'package:ods_flutter/guidelines/spacings.dart';

class DismissButtonDescription {
  final String dismissButtonText;
  final Function() onDismissButtonClick;

  DismissButtonDescription({
    required this.dismissButtonText,
    required this.onDismissButtonClick,
  });
}

class OdsAlertDialog extends StatefulWidget {
  const OdsAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<OdsAlertDialog> createState() => _OdsAlertDialogState();

  static void openDialog({
    required BuildContext context,
    required String text,
    required String confirmButtonText,
    required Function() onConfirmButtonClick,
    String? titleText,
    DismissButtonDescription? dismissButtonDescription,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: titleText != null ? Text(titleText) : null,
        content: Text(text),
        actions: <Widget>[
          TextButton(
            onPressed: onConfirmButtonClick,
            child: Text(confirmButtonText),
          ),
          if (dismissButtonDescription != null)
            OdsButton(
              text: dismissButtonDescription.dismissButtonText!,
              onClick: dismissButtonDescription.onDismissButtonClick,
              style: OdsButtonStyle.functionalPrimary,
            ),
        ],
      ),
    );
  }

  static void openFullscreenDialog({
    required BuildContext context,
    required String text,
    Widget? body,
    String? buttonRight,
    Function()? onButtonRightClick,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => Dialog.fullscreen(
        child: Padding(
          padding: const EdgeInsets.all(spacingM),
          child: Scaffold(
            appBar: AppBar(
              title: Text(text),
              centerTitle: false,
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
              actions: [
                if (buttonRight != null)
                  TextButton(
                    onPressed: onButtonRightClick,
                    child: Text(buttonRight),
                  ),
              ],
            ),
            body: SingleChildScrollView(child: body),
          ),
        ),
      ),
    );
  }
}

class _OdsAlertDialogState extends State<OdsAlertDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
