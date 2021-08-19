import 'package:flutter_application_1/commonwidget/CustomButton.dart';
import 'package:flutter/material.dart';

class SignInImageButton extends CustomButton {
  SignInImageButton({
    required String text,
    required Color textColor,
    required String imagePath,
    required Color backgroundColor,
    required VoidCallback? onClickListener,
  }) : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(imagePath),
              Text(
                text,
                style: TextStyle(color: textColor, fontSize: 14),
              ),
              Opacity(opacity: 0, child: Image.asset(imagePath)),
            ],
          ),
          color: backgroundColor,
          padding: 16,
          onClickListener: onClickListener,
        );
}
