//@dart=2.9
import 'package:finalprojek/app/customize/show_alert_dialog.dart';
import 'package:finalprojek/app/database/evaluate.dart';
import '/app/components/validator.dart';
import '/app/customize/customizeElevatedButton.dart';
import '/app/customize/customizeNavigatorButton.dart';
import '/app/customize/customizeText.dart';
import 'package:flutter/material.dart';

class EvaluateForm extends StatefulWidget with InputValidator {
  EvaluateForm({@required this.onVietnamese,
    this.colorPoint, this.layoutPoint,
    this.creationPoint, this.ratingFuncPoint,
    this.switchLangPoint, this.inoutPoint,
    this.nameEvaluate, this.nameImage,
  });

  final bool onVietnamese;
  final double colorPoint;
  final double layoutPoint;
  final double creationPoint;
  final double ratingFuncPoint;
  final double switchLangPoint;
  final double inoutPoint;
  final String nameEvaluate, nameImage;

  @override
  _EvaluateFormState createState() => _EvaluateFormState();
}

class _EvaluateFormState extends State<EvaluateForm> {

  final TextEditingController _evaluateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _evaluateFocus = FocusNode();

  String get _evaluate => _evaluateController.text;
  String get _phone => _phoneController.text;
  String get _fullname => _fullnameController.text;

  Future<void> _submit() async{
    Navigator.of(context).pop();

    await DatabaseService().uploadData(
        _evaluate, _fullname, _phone, 
        widget.colorPoint, widget.layoutPoint,
      widget.creationPoint, widget.ratingFuncPoint,
      widget.switchLangPoint, widget.inoutPoint,
      widget.nameEvaluate, widget.nameImage
    );
  }

  void _fullnameEditingComplete(){
    FocusScope.of(context).requestFocus(_phoneFocus);
  }

  void _phoneEditingComplete(){
    FocusScope.of(context).requestFocus(_evaluateFocus);
  }

  Future<void> _comfirmSubmit(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(context,
      title: widget.onVietnamese ? 'Gửi thành công' : 'Send success',
      subContent: widget.onVietnamese
          ? 'Chúc bạn một ngày tốt lành!'
          : 'Have a nice day!',
      content: widget.onVietnamese
          ? 'Cảm ơn bạn đã đánh giá'
          : 'Thank you for rating',
      defaultActionText: widget.onVietnamese ? 'Thoát' : 'Close',
      nameImage: 'upside_down_face.gif',
    );
    if(didRequestSignOut == true){
      _submit();
      Navigator.of(context).pop();
    }
  }

  List<Widget> _buildBody(BuildContext context){
    void _onChange(String text){
      setState(() {

      });
    }

    return [
      SizedBox(
        height: 20.0,
      ),
      CustomText(
        text: widget.onVietnamese
          ? 'Chúng tôi chân thành cám ơn những đánh giá và góp ý của bạn!'
          : 'We sincerely appreciate your reviews and suggestions!',
        textSize: 16.0,
        textWeight: FontWeight.w700,
      ),
      SizedBox(
        height: 15.0,
      ),
      TextField(
        controller: _fullnameController,
        decoration: InputDecoration(
          labelText: widget.onVietnamese
            ? 'Họ và tên'
            : 'Fullname',
          hintText: '...',
          errorText: null,
          hintStyle: TextStyle(fontSize: 12),
        ),
        textInputAction: TextInputAction.next,
        onEditingComplete: _fullnameEditingComplete,
        onChanged: _onChange,
        style: TextStyle(
            fontSize: 16.0
        ),
        keyboardType: TextInputType.name,
      ),
      TextField(
        focusNode: _phoneFocus,
        controller: _phoneController,
        decoration: InputDecoration(
          labelText: widget.onVietnamese
            ? 'Số điện thoại'
            : 'Number phone',
          hintText: widget.onVietnamese
            ? 'Vui lòng nhập đúng định dạng số điện thoại'
            : 'Please enter the correct phone number format',
          hintStyle: TextStyle(fontSize: 12),
          errorText: null,
        ),
        textInputAction: TextInputAction.next,
        onEditingComplete: _phoneEditingComplete,
        onChanged: _onChange,
        style: TextStyle(
          fontSize: 16.0,
        ),
        keyboardType: TextInputType.number,
      ),
      TextField(
        focusNode: _evaluateFocus,
        controller: _evaluateController,
        decoration: InputDecoration(
          labelText: widget.onVietnamese
            ? 'Phản hồi của bạn'
            : 'Your feedback',
          hintText: widget.onVietnamese
              ? 'Vui lòng nhập phản hồi của bạn'
              : 'Please enter your feedback',
          hintStyle: TextStyle(fontSize: 12),
          errorText: null,
        ),
        textInputAction: TextInputAction.done,
        onEditingComplete: _submit,
        onChanged: _onChange,
        style: TextStyle(
            fontSize: 16.0
        ),
      ),
    ];
  }

  List<Widget> _buildBottomSheet(BuildContext context){
    bool submitEnable =
        widget.evaluateEmptyValidator.isValid(_evaluate)
            && widget.evaluateEmptyValidator.isValid(_phone)
            && widget.nameEmptyValidator.isValid(_fullname)
            && widget.phoneFormatValidator.isValid(_phone);

    return [
      Row(),
      Row(
        children: [
          CustomElevatedButton(
            onPressed: submitEnable ? () => _comfirmSubmit(context) : null,
            child: CustomText(
              text: widget.onVietnamese
                  ? 'Gửi đánh giá'
                  : 'Send your feedback',
              textSize: 16.0,
              textWeight: FontWeight.w700,
              textColor: submitEnable == false ? Colors.nullTextGrey : Colors.darkBlueText,
            ),
            backgroundColor: submitEnable == false ? Colors.nullGrey : Colors.crystalGreenButton,
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
              ? 'Đánh giá/Góp ý'
              : 'Rate/Suggestions',
          textSize: 18, textWeight: FontWeight.w700,),
        elevation: 5.0,
        backgroundColor: Colors.crystalGreen,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: _buildBody(context),
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
