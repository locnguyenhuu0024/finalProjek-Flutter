//@dart=2.9
import 'dart:ui';

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    @required this.text,
    this.textColor = Colors.darkBlueText,
    @required this.textSize,
    this.textWeight = FontWeight.w500, this.backgroundColor, this.textAlign = TextAlign.center,});

  final String text;
  final Color textColor;
  final Color backgroundColor;
  final double textSize;
  final FontWeight textWeight;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
        color: textColor,
        fontSize: textSize,
        fontFamily: 'Josefin Sans',
        fontWeight: textWeight,
        backgroundColor: backgroundColor,

      ),
      textAlign: textAlign,
    );
  }
}
