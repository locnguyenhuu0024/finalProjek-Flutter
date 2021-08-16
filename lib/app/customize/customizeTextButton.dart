//@dart=2.9
import 'package:flutter/material.dart';
import 'customizeText.dart';

class CustomTextButton extends StatelessWidget {
  final String nameImage;
  final String text;
  final VoidCallback onPressed;
  final Color overlayColor;
  final double textSize;
  final Widget child;

  const CustomTextButton({
    this.nameImage,
    this.text = '',
    @required this.onPressed,
    this.overlayColor, this.textSize, this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(overlayColor)
      ),
    );
  }
}
