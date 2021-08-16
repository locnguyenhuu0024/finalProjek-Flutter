//@dart=2.9
import 'package:finalprojek/app/customize/customizeTextImageButton.dart';
import '/app/customize/customizeText.dart';
import 'package:flutter/material.dart';

class DetailsForm extends StatelessWidget {
  final bool onVienamese;
  final String feedback;
  final String fullname;
  final String phone;
  final double colorPoint;
  final double layoutPoint;
  final double creationPoint;
  final double ratingFuncPoint;
  final double switchLangPoint;
  final double inoutFuncPoint;
  final String nameEvaluate;
  final String nameImage;


  const DetailsForm({
    @required this.feedback, @required this.fullname,
    @required this.phone, @required this.colorPoint, @required this.layoutPoint,
    @required this.creationPoint, @required this.ratingFuncPoint, @required this.switchLangPoint,
    @required this.inoutFuncPoint, @required this.nameEvaluate,
    @required this.nameImage, this.onVienamese,
  });
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: onVienamese
              ? 'Chi tiết đánh giá ứng dụng'
              : 'Details of evaluation',
          textSize: 18, textWeight: FontWeight.w700,),
        elevation: 5.0,
        backgroundColor: Colors.crystalGreen,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 25.0, bottom: 25.0, right: 20.0, left: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                CustomText(
                  text: onVienamese ? 'Họ và tên:' : 'Fullname:',
                  textSize: 16, textAlign: TextAlign.start,),
                SizedBox(width: 16.0,),
                CustomText(
                  text: fullname,
                  textSize: 20,
                  textAlign: TextAlign.start,
                  textWeight: FontWeight.w700,
                ),
              ],
            ),
            SizedBox(height: 16.0,),
            Row(
              children: [
                CustomText(text: onVienamese ? 'Số điện thoại:' : 'Number phone:', textSize: 16, textAlign: TextAlign.start,),
                SizedBox(width: 16.0,),
                CustomText(text: phone, textSize: 18, textAlign: TextAlign.start, textWeight: FontWeight.w700,),
              ],
            ),
            CustomTextImageButton(
              onPressed: null,
              nameImage: nameImage,
              text: nameEvaluate,
            ),
            SizedBox(height: 0.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomText(
                  text: onVienamese ? 'Phản hồi:' : 'Feedback:',
                  textSize: 18, textWeight: FontWeight.w700,),
                SizedBox(width: 10.0,),
                CustomText(
                  text: feedback.toString(),
                  textSize: 18,),
              ],
            ),
            SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: onVienamese ? 'Chất lượng thiết kế' : 'Design Quality',
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
                  text: onVienamese ? 'Màu sắc' : 'Color',
                  textSize: 18.0,
                ),
                CustomText(
                  text: inoutFuncPoint.toString(),
                  textSize: 16.0,
                )
              ],
            ), SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: onVienamese ? 'Bố cục' : 'Layout',
                  textSize: 16.0,
                ),
                CustomText(
                  text: inoutFuncPoint.toString(),
                  textSize: 16.0,
                )
              ],
            ), SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: onVienamese ? 'Sáng tạo' : 'Creation',
                  textSize: 16.0,
                ),
                CustomText(
                  text: creationPoint.toString(),
                  textSize: 16.0,
                )
              ],
            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: onVienamese ? 'Hoàn thiện chức năng' : 'Functional perfection',
                  textSize: 16.0,
                  textWeight: FontWeight.w700,
                ),
                CustomText(text: '', textSize: 16.0)
              ],
            ),SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: onVienamese ? 'Chức năng đánh giá' : 'Rating function',
                  textSize: 16.0,
                ),
                CustomText(
                  text: ratingFuncPoint.toString(),
                  textSize: 16.0,
                )
              ],
            ),SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: onVienamese ? 'Chuyển đổi ngôn ngữ' : 'Switch language',
                  textSize: 16.0,
                ),
                CustomText(
                  text: switchLangPoint.toString(),
                  textSize: 16.0,
                )
              ],
            ),SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: onVienamese ? 'Đăng nhập/Đăng xuất' : 'Sign in/Sign out',
                  textSize: 16.0,
                ),
                CustomText(
                  text: inoutFuncPoint.toString(),
                  textSize: 16.0,
                )
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.lightCrystalGreen,
    );
  }
}

