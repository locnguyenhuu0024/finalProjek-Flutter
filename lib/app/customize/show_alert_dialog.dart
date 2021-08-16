//@dart=2.9
import 'package:flutter/material.dart';

import 'customizeText.dart';

Future<bool> showAlertDialog(
  BuildContext context,
  {
    String nameImage = 'upside_down_face.gif',
    String title = '',
    @required String content,
    String subContent = '',
    String cancelActionText,
    @required String defaultActionText,
  }
){
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: CustomText(
          text: title,
          textSize: 16.0,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: content,
              textSize: 20,
              textWeight: FontWeight.w700,
            ),
            SizedBox(height: 20,),
            Image.asset('images/$nameImage', width: 80, height: 80,),
            SizedBox(height: 18,),
            CustomText(
              text: subContent,
              textSize: 20,
              textWeight: FontWeight.w700,
            ),
          ],
        ),
        actions: <Widget>[
          if(cancelActionText == null)
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: CustomText(
                text: defaultActionText,
                textSize: 16.0,
                textWeight: FontWeight.w700,
                textColor: Colors.freshRed,
              ),
            )
        ],
        contentPadding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
        backgroundColor: Colors.lightCrystalGreen,
      )
  );
}