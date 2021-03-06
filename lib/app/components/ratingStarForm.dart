//@dart=2.9
import 'package:finalprojek/app/components/evaluateForm.dart';
import 'package:finalprojek/app/components/validator.dart';
import 'package:finalprojek/app/customize/customizeElevatedButton.dart';
import 'package:finalprojek/app/customize/customizeNavigatorButton.dart';
import 'package:finalprojek/app/customize/customizeText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStarForm extends StatefulWidget with InputValidator{
  final bool onVietnamese;
  final String nameEvaluate, nameImage;

  RatingStarForm({
    @required this.onVietnamese,
    @required this.nameEvaluate,
    @required this.nameImage,
  });

  @override
  _RatingStarFormState createState() => _RatingStarFormState();
}

class _RatingStarFormState extends State<RatingStarForm> {
  double colorPoint = 0.0, layoutPoint = 0.0,
      creationPoint = 0.0, ratingFuncPoint = 0.0,
      switchLangPoint = 0.0, inoutPoint = 0.0;

  List<Widget> _buildBottomSheet(BuildContext context){
    bool submitEnable = colorPoint > 0.0 && layoutPoint > 0.0
      && creationPoint > 0.0 && ratingFuncPoint > 0.0
      && switchLangPoint > 0.0 && inoutPoint > 0.0;

    void _submit(BuildContext context,){
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          fullscreenDialog: true,
          builder: (context) => EvaluateForm(
            onVietnamese: widget.onVietnamese,
            colorPoint: colorPoint,
            creationPoint: creationPoint,
            inoutPoint: inoutPoint,
            layoutPoint: layoutPoint,
            switchLangPoint: switchLangPoint,
            ratingFuncPoint: ratingFuncPoint,
            nameEvaluate: widget.nameEvaluate,
            nameImage: widget.nameImage,
          ),
        ),
      );
      //Navigator.of(context).pop();
    }

    return [
      Row(),
      Row(
        children: [
          CustomElevatedButton(
            onPressed: submitEnable ? () => _submit(context) : null,
            child: CustomText(
              text: widget.onVietnamese
                  ? 'Ti???p t???c'
                  : 'Next',
              textSize: 16.0,
              textWeight: FontWeight.w700,
              textColor: submitEnable ? Colors.darkBlueText : Colors.nullTextGrey,
            ),
            backgroundColor: submitEnable ? Colors.crystalGreenButton : Colors.nullGrey,
          )
        ],
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: widget.onVietnamese
              ? '????nh gi?? ???ng d???ng'
              : 'Rate/Suggestions',
          textSize: 18, textWeight: FontWeight.w700,),
        elevation: 5.0,
        backgroundColor: Colors.crystalGreen,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: ListView(
          children: [
            SizedBox(height: 30.0,),
            CustomText(
              text: widget.onVietnamese
                  ? 'Nh???ng ????nh gi?? c???a b???n g??p ph???n c???i thi???n ch???t l?????ng ???ng d???ng ????? ph???c v??? b???n t???t h??n!'
                  : 'Your reviews contribute to improving the quality of the app to serve you better!',
              textSize: 18, textWeight: FontWeight.w500,),
            SizedBox(height: 30.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: widget.onVietnamese ? 'Ch???t l?????ng thi???t k???' : 'Design Quality',
                  textSize: 18.0,
                  textWeight: FontWeight.w700,
                ),
                CustomText(text: '', textSize: 16.0)
              ],
            ), SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: widget.onVietnamese ? 'M??u s???c' : 'Color',
                  textSize: 18.0,
                ),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 25.0,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      colorPoint = rating;
                    });
                  },
                )
              ],
            ), SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: widget.onVietnamese ? 'B??? c???c' : 'Layout',
                  textSize: 18.0,
                ),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 25.0,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      layoutPoint = rating;
                    });
                  },
                )
              ],
            ), SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: widget.onVietnamese ? 'S??ng t???o' : 'Creation',
                  textSize: 18.0,
                ),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 25.0,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      creationPoint = rating;
                    });
                  },
                )
              ],
            ),
            SizedBox(height: 30.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: widget.onVietnamese ? 'Ho??n thi???n ch???c n??ng' : 'Functional perfection',
                  textSize: 18.0,
                  textWeight: FontWeight.w700,
                ),
                CustomText(text: '', textSize: 16.0)
              ],
            ),SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: widget.onVietnamese ? 'Ch???c n??ng ????nh gi??' : 'Rating function',
                  textSize: 18.0,
                ),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 25.0,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      ratingFuncPoint = rating;
                    });
                  },
                )
              ],
            ),SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: widget.onVietnamese ? 'Chuy???n ?????i ng??n ng???' : 'Switch language',
                  textSize: 18.0,
                ),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 25.0,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      switchLangPoint = rating;
                    });
                  },
                )
              ],
            ),SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: widget.onVietnamese ? '????ng nh???p/????ng xu???t' : 'Sign in/Sign out',
                  textSize: 18.0,
                ),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 25.0,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      inoutPoint = rating;
                    });
                  },
                )
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(left: 32, right: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildBottomSheet(context),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          CustomNavigatorBar(
            nameImage: 'evaluate.png',
            onPressed: null,
          ),
          CustomNavigatorBar(
            nameImage: 'user.png',
            onPressed: null,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    );
  }
}
