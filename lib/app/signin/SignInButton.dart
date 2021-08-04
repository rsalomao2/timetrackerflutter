import 'package:flutter_application_1/commonwidget/CustomButton.dart';
import 'package:flutter/material.dart';

class SignInButton extends CustomButton {
  SignInButton({
    required String text,
    required Color textColor,
    required Color backgroundColor,
    required VoidCallback? onClickListener,
  }) : super(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 14),
          ),
          color: backgroundColor,
          padding: 16,
          onClickListener: onClickListener,
        );
}
