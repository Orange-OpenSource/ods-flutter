import 'package:flutter/material.dart';
import 'package:ods_flutter/components/button/ods_filled_button.dart';
import 'package:ods_flutter/guidelines/spacings.dart';

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
    Function()? onConfirmButtonClick,
    String? titleText,
    String? dismissButtonText,
    Function()? onDismissButtonClick,
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
          if (dismissButtonText != null)
            OdsFilledButton(
              title: dismissButtonText!,
              onPressed: onDismissButtonClick,
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
