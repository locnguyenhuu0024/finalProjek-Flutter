//@dart=2.9
import 'package:flutter/material.dart';
import 'customizeText.dart';

class CustomTextImageButton extends StatelessWidget {
  final String nameImage;
  final String text;
  final VoidCallback onPressed;
  final Color overlayColor;

  const CustomTextImageButton({
    this.nameImage,
    this.text = '',
    @required this.onPressed,
    this.overlayColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 32.0, left: 50.0),
            child: Image.asset('images/$nameImage', width: 80, height: 80,),
          ),
          CustomText(
            text: text,
            textSize: 20.0,
            textWeight: FontWeight.w700,
          )
        ],
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(overlayColor)
      ),
    );
  }
}
