import 'package:flutter/material.dart';

class OdsSnackbars {
  static void showSnackbar({
    required BuildContext context,
    String content = '',
    String? label,
    VoidCallback? onPressed,
  }) {
    final snackbar = SnackBar(
      behavior: SnackBarBehavior.floating,
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
