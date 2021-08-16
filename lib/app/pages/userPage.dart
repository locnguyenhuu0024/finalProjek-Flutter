//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalprojek/app/components/detailsForm.dart';
import 'package:finalprojek/app/customize/customizeTextButton.dart';
import '/app/customize/show_alert_dialog.dart';
import '/app/services/authbase.dart';
import '/app/components/validator.dart';
import '../customize/customizeElevatedButton.dart';
import '../customize/customizeText.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget with InputValidator{
  final bool onVietnamese;
  final AuthBase auth;

  UserPage({@required this.onVietnamese, @required this.auth});

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  void _showDetails(
      BuildContext context,
      String feedback, String fullname, String phone,
      double colorPoint, double layoutPoint, double creationPoint,
      double ratingFuncPoint, double switchLangPoint, double inoutFuncPoint,
      String nameEvaluate, String nameImage
      ){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => DetailsForm(
          feedback: feedback,
          fullname: fullname,
          phone: phone,
          onVienamese: widget.onVietnamese,
          colorPoint: colorPoint,
          creationPoint: creationPoint,
          inoutFuncPoint: inoutFuncPoint,
          layoutPoint: layoutPoint,
          switchLangPoint: switchLangPoint,
          ratingFuncPoint: ratingFuncPoint,
          nameEvaluate: nameEvaluate,
          nameImage: nameImage,
        ),
      ),
    );
    //Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _signOut() async {
      try {
        await widget.auth.signOut();
      } catch(e) {
        print(e.toString());
      }
    }

    Future<void> _comfirmSignOut(BuildContext context) async {
      final didRequestSignOut = await showAlertDialog(context,
        title: widget.onVietnamese
          ? 'Đăng xuất'
          : 'Sign out',
        content: widget.onVietnamese
          ? 'Bạn muốn đăng xuất ư? Bạn chắc bạn làm được khum?'
          : 'Do you wanna sign out? Huh?',
        defaultActionText: widget.onVietnamese
          ? 'Tao chắc'
          : 'Yes, I do =))',
        nameImage: 'upside_down_face.gif',
      );
      if(didRequestSignOut == true){
        _signOut();
      }
    }

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('admin').snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return Padding(
              padding: EdgeInsets.only(left: 35.0, top: 20.0, right: 35.0, bottom: 20.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                          text: 'Admin',
                          textSize: 20.0,
                          textWeight: FontWeight.w700,
                        ),
                        SizedBox(width: 12.0,),
                        CustomElevatedButton(
                          onPressed: (){_comfirmSignOut(context);},
                          child: CustomText(
                            text: widget.onVietnamese ? 'Đăng xuất' : 'Sign out',
                            textSize: 12.0,
                            textWeight: FontWeight.w700,
                            textColor: Colors.white,
                          ),
                          backgroundColor: Colors.darkGreen,
                        ),
                      ],
                    ),
                    SizedBox(height: 25.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: widget.onVietnamese ? 'Tên khách hàng' : 'Guest name',
                          textSize: 16.0,
                          textWeight: FontWeight.w700,
                        ),
                        CustomText(
                          text: widget.onVietnamese ? 'Đánh giá' : 'Evaluation',
                          textSize: 16.0,
                          textWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    SizedBox(
                      height: 350.0,
                      width: 364.0,
                      child: ListView(
                        children: snapshot.data.docs.map((evaluate) {
                          return CustomTextButton(
                            onPressed: () => _showDetails(context,
                                evaluate.get('feedback'),
                                evaluate.get('fullname'),
                                evaluate.get('phone'),
                                evaluate.get('score')['colorPoint'],
                                evaluate.get('score')['layoutPoint'],
                                evaluate.get('score')['creationPoint'],
                                evaluate.get('score')['ratingFuncPoint'],
                                evaluate.get('score')['switchLangPoint'],
                                evaluate.get('score')['inoutFuncPoint'],
                                evaluate.get('nameEvaluate'),
                                evaluate.get('nameImage'),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 160.0,
                                  child: CustomText(
                                    text: evaluate.get('fullname'),
                                    textSize: 16.0,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(
                                  child: CustomText(
                                    text: evaluate.get('nameEvaluate'),
                                    textSize: 16.0,
                                    textAlign: TextAlign.end,
                                  ),
                                  width: 100.0,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 8.0,),
                    CustomText(
                      text: widget.onVietnamese
                          ? 'Ứng dụng này được thiết kế bởi Lộc'
                          : 'This application designed by Loc',
                      textSize: 12,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
      backgroundColor: Colors.crystalGreenBackground,
    );
  }
}
