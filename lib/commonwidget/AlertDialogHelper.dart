import 'package:flutter/material.dart';

Future<bool> showCustomAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String actionLabel,
}) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            return Navigator.pop(context, true);
          },
          child: Text(actionLabel),
        )
      ],
    ),
  );
}
