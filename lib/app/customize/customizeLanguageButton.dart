//@dart=2.9
import 'package:flutter/material.dart';

class CustomLangButton extends StatelessWidget {
  const CustomLangButton({this.onPressed, this.nameImage});
  final VoidCallback onPressed;
  final String nameImage;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Image.asset('images/$nameImage', width: 30, height: 30,),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
    );
  }
}
