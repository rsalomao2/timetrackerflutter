import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool> showCustomAlertDialog({
  String? negativeActionLabel,
  VoidCallback? onPositiveAction,
  required BuildContext context,
  required String title,
  required String content,
  String positiveActionLabel: "Ok",
}) async {
  if (Platform.isIOS) {
    return await showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          if (negativeActionLabel != null)
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context, false),
              child: Text(positiveActionLabel),
            ),
          CupertinoDialogAction(
            onPressed: () {
              _onPositiveActionClick(onPositiveAction, context);
            },
            child: Text(positiveActionLabel),
          )
        ],
      ),
    );
  } else {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          if (negativeActionLabel != null)
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(negativeActionLabel),
            ),
          TextButton(
            onPressed: () {
              _onPositiveActionClick(onPositiveAction, context);
            },
            child: Text(positiveActionLabel),
          )
        ],
      ),
    );
  }
}

void _onPositiveActionClick(
    VoidCallback? onPositiveAction, BuildContext context) {
  if (onPositiveAction != null) onPositiveAction.call();
  Navigator.pop(context, true);
}
