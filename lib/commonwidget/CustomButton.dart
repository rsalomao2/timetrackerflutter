import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback? onClickListener;
  final double padding;

  const CustomButton({
    required this.child,
    required this.color,
    this.borderRadius: 4.0,
    required this.onClickListener,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          elevation: MaterialStateProperty.all(2),
          padding:
              MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(padding)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ))),
      child: child,
      onPressed: onClickListener,
    );
  }
}
