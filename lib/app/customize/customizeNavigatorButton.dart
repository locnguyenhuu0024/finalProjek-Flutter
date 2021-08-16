//@dart=2.9
import 'package:flutter/material.dart';

class CustomNavigatorBar extends StatelessWidget{

  final String nameImage;
  final VoidCallback onPressed;
  final Color backgroundColor;

  const CustomNavigatorBar({
    @required this.nameImage,
    @required this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        child: Image.asset('images/$nameImage', width: 35, height: 35,),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0)
            )
          )
        ),
      )
    );
  }
}
