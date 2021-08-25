import 'package:flutter/material.dart';
import 'package:flutter_application_1/commonwidget/CustomButton.dart';

class ButtonForm extends CustomButton {
  ButtonForm({
    required String label,
    required VoidCallback? onClick,
  }) : super(
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          color: Colors.indigo,
          onClickListener: onClick,
          padding: 16,
          borderRadius: 4,
        );
}
