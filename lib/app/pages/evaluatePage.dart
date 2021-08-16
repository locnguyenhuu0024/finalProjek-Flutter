//@dart=2.9
import 'package:finalprojek/app/components/ratingStarForm.dart';
import '/app/components/evaluateForm.dart';
import '../customize/customizeText.dart';
import '../customize/customizeTextImageButton.dart';
import 'package:flutter/material.dart';

class EvaluatePage extends StatefulWidget {
  const EvaluatePage({@required this.onVietnamese});
  final bool onVietnamese;

  @override
  _EvaluatePageState createState() => _EvaluatePageState();
}

class _EvaluatePageState extends State<EvaluatePage> {

  void _showEvaluateForm(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EvaluateForm(onVietnamese: widget.onVietnamese,),
        fullscreenDialog: true,
      ),
    );
  }

  void _showRatingForm(BuildContext context, String nameEvaluate, String nameImage){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RatingStarForm(
          onVietnamese: widget.onVietnamese,
          nameImage: nameImage,
          nameEvaluate: nameEvaluate,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 25.0,),
                CustomText(
                    text: widget.onVietnamese
                        ? 'Bạn cảm thấy ứng dụng này thế nào?'
                        : 'How do you feel about this app?',
                    textSize: 20.0
                ),
                SizedBox(height: 20.0,),
                CustomTextImageButton(
                  onPressed: () => _showRatingForm(
                    context,
                    widget.onVietnamese ? 'Yêu thích' : 'Lovely',
                    'love.gif',
                  ),
                  //   () => showDialog(
                  // context: context,
                  // builder: (BuildContext context)
                  // => CustomAlertDialog(nameImage: 'love.gif',
                  //   onVietnamese: widget.onVietnamese,
                  // ),
                  // ),
                  nameImage: 'love.gif',
                  text: widget.onVietnamese
                      ? 'Yêu thích'
                      : 'Lovely',
                  overlayColor: Colors.lightCrystalGreen,
                ),
                CustomTextImageButton(
                  onPressed: () => _showRatingForm(
                    context,
                    widget.onVietnamese ? 'Khá tốt' : 'So good',
                    'good.gif',
                  ),
                  nameImage: 'good.gif',
                  text: widget.onVietnamese
                      ? 'Khá tốt'
                      : 'So good',
                  overlayColor: Colors.lightCrystalGreen,
                ),
                CustomTextImageButton(
                  onPressed: () => _showRatingForm(
                    context,
                    widget.onVietnamese ? 'Tạm được' : 'Good',
                    'accept.gif',
                  ),
                  nameImage: 'accept.gif',
                  text: widget.onVietnamese
                      ? 'Tạm được'
                      : 'Good',
                  overlayColor: Colors.lightCrystalGreen,
                ),
                CustomTextImageButton(
                  onPressed: () => _showRatingForm(
                    context,
                    widget.onVietnamese ? 'Chưa tốt' : 'Not good',
                    'bad.gif',
                  ),
                  nameImage: 'bad.gif',
                  text: widget.onVietnamese
                      ? 'Chưa tốt'
                      : 'Not good',
                  overlayColor: Colors.lightCrystalYellow,
                ),
                CustomTextImageButton(
                  onPressed: () => _showRatingForm(
                    context,
                    widget.onVietnamese ? 'Thất vọng' : 'Disappointed',
                    'pouting.gif',
                  ),
                  nameImage: 'pouting.gif',
                  text: widget.onVietnamese
                      ? 'Thất vọng'
                      : 'Disappointed',
                  overlayColor: Colors.lightCrystalRed,
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.crystalGreenBackground,
    );
  }
}
