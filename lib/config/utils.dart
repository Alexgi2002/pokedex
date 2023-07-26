import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(
    BuildContext context,
    String text, {
    SnackBarAction? action,
    Duration duration = const Duration(milliseconds: 4000),
  }) {
    if (text.isEmpty) return;
    final snackbar = SnackBar(
      content: Text(text),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      action: action,
      duration: duration,
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
