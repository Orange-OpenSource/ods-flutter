import 'package:flutter/material.dart';

class OdsSnackbar {
  static void showSnackbarSingleLine({
    required BuildContext context,
    String message = '',
    String? actionLabel,
    VoidCallback? onPressed,
  }) {
    OdsSnackbarsSingleLineExtension.showSnackbarSingleLine(
      context: context,
      message: message,
      actionLabel: actionLabel,
      onPressed: onPressed,
    );
  }

  static void showSnackbarTwoLines({
    required BuildContext context,
    String message = '',
    String? actionLabel,
    VoidCallback? onPressed,
  }) {
    OdsSnackbarsTwoLinesExtension.showSnackbarTwoLines(
      context: context,
      message: message,
      actionLabel: actionLabel,
      onPressed: onPressed,
    );
  }

  static void showSnackbarLongerAction({
    required BuildContext context,
    String message = '',
    String? actionLabel,
    VoidCallback? onPressed,
  }) {
    OdsSnackbarsLongerActionExtension.showSnackbarLongerAction(
      context: context,
      message: message,
      actionLabel: actionLabel,
      onPressed: onPressed,
    );
  }
}

/// Single line variant of Snackbar to display content on a single line.
extension OdsSnackbarsSingleLineExtension on OdsSnackbar {
  static void showSnackbarSingleLine({
    required BuildContext context,
    String message = '',
    String? actionLabel,
    VoidCallback? onPressed,
  }) {
    final snackbar = SnackBar(
      width: double.infinity,
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      action: actionLabel != null && actionLabel.isNotEmpty && onPressed != null
          ? SnackBarAction(
              label: actionLabel,
              onPressed: onPressed,
            )
          : null,
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}

/// Two lines variant of Snackbar to display content on a two line.
extension OdsSnackbarsTwoLinesExtension on OdsSnackbar {
  static void showSnackbarTwoLines({
    required BuildContext context,
    String message = '',
    String? actionLabel,
    VoidCallback? onPressed,
  }) {
    SnackBar snackbar = SnackBar(
      width: double.infinity,
      content: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.5,
            child: Text(
              message,
            ),
          ),
        ],
      ),
      action: actionLabel != null && actionLabel.isNotEmpty && onPressed != null
          ? SnackBarAction(
              label: actionLabel,
              onPressed: onPressed,
            )
          : null,
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}

/// Longer action variant of Snackbar to display content on a longer action.
extension OdsSnackbarsLongerActionExtension on OdsSnackbar {
  static void showSnackbarLongerAction({
    required BuildContext context,
    String message = '',
    String? actionLabel,
    VoidCallback? onPressed,
  }) {
    SnackBar snackbar = SnackBar(
      width: double.infinity,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Text(
                    message,
                  ),
                ),
              ],
            ),
          ),
          if (actionLabel != null &&
              actionLabel.isNotEmpty &&
              onPressed != null)
            Align(
              alignment: Alignment.centerRight,
              child: SnackBarAction(
                label: actionLabel,
                onPressed: onPressed,
              ),
            ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
