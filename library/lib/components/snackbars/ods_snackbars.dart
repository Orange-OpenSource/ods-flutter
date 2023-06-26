import 'package:flutter/material.dart';

class OdsSnackbars {
  static void showSnackbarSingleLine({
    required BuildContext context,
    String content = '',
    String? label,
    VoidCallback? onPressed,
  }) {
    OdsSnackbarsSingleLineExtension.showSnackbarSingleLine(
      context: context,
      content: content,
      label: label,
      onPressed: onPressed,
    );
  }

  static void showSnackbarTwoLines({
    required BuildContext context,
    String content = '',
    String? label,
    VoidCallback? onPressed,
  }) {
    OdsSnackbarsTwoLinesExtension.showSnackbarTwoLines(
      context: context,
      content: content,
      label: label,
      onPressed: onPressed,
    );
  }

  static void showSnackbarLongerAction({
    required BuildContext context,
    String content = '',
    String? label,
    VoidCallback? onPressed,
  }) {
    OdsSnackbarsLongerActionExtension.showSnackbarLongerAction(
      context: context,
      content: content,
      label: label,
      onPressed: onPressed,
    );
  }
}

/// Single line variant of Snackbar to display content on a single line.
extension OdsSnackbarsSingleLineExtension on OdsSnackbars {
  static void showSnackbarSingleLine({
    required BuildContext context,
    String content = '',
    String? label,
    VoidCallback? onPressed,
  }) {
    final snackbar = SnackBar(
      width: double.infinity,
      content: Text(content),
      action: label != null && label.isNotEmpty && onPressed != null
          ? SnackBarAction(
              label: label,
              onPressed: onPressed,
            )
          : null,
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}

/// Two lines variant of Snackbar to display content on a two line.
extension OdsSnackbarsTwoLinesExtension on OdsSnackbars {
  static void showSnackbarTwoLines({
    required BuildContext context,
    String content = '',
    String? label,
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
              content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      action: label != null && label.isNotEmpty && onPressed != null
          ? SnackBarAction(
              label: label,
              onPressed: onPressed,
            )
          : null,
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}

/// Longer action variant of Snackbar to display content on a longer action.
extension OdsSnackbarsLongerActionExtension on OdsSnackbars {
  static void showSnackbarLongerAction({
    required BuildContext context,
    String content = '',
    String? label,
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
                    content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          if (label != null && label.isNotEmpty && onPressed != null)
            Align(
              alignment: Alignment.centerRight,
              child: SnackBarAction(
                label: label,
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
