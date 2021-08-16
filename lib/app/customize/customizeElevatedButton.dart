//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {

  final VoidCallback onPressed;
  final Widget child;
  final double borderRadius;
  final Color backgroundColor;

  const CustomElevatedButton({
    @required this.onPressed,
    this.borderRadius = 5.0,
    this.backgroundColor = Colors.crystalGreenButton,
    @required this.child
  });
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)
            )
        )
      ),
    );
  }
}
