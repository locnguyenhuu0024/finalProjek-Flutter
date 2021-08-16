//@dart=2.9
import '/app/components/validator.dart';
import '/app/customize/customizeElevatedButton.dart';
import '/app/customize/customizeText.dart';
import '/app/services/authbase.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget with InputValidator{
  final bool onVietnamese;
  final AuthBase auth;

  SignInPage({@required this.onVietnamese, @required this.auth});
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  @override
  Widget build(BuildContext context) {
    bool enableSignIn =
        widget.emailEmptyValidator.isValid(_email)
            && widget.passwordEmptyValidator.isValid(_password);

    void _onChange(String string){
      setState(() {

      });
    }

    void _emailEditingComplete(){
      FocusScope.of(context).requestFocus(_passwordFocus);
    }

    Future<void> _submit() async {
      try{
        await widget.auth.signInWithEmailAndPassword(_email, _password);
      }catch(e){
        print(e.toString());
      }
    }
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(right: 35.0, left: 35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 25.0,),
              CustomText(
                text: widget.onVietnamese
                    ? 'ĐĂNG NHẬP'
                    : 'SIGN IN',
                textSize: 20.0, textWeight: FontWeight.w700,
              ),
              SizedBox(height: 10.0,),
              CustomText(
                text: widget.onVietnamese
                    ? 'Trang này chỉ dành cho Admin'
                    : 'This page only use for Admin',
                textSize: 16.0, textWeight: FontWeight.w400,
              ),
              SizedBox(height: 15.0,),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: 'Email', hintText: 'vidu@vidu.com',
                    errorText: null
                ),
                textInputAction: TextInputAction.next,
                onEditingComplete: _emailEditingComplete,
                onChanged: _onChange,
              ),
              TextField(
                focusNode: _passwordFocus,
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: widget.onVietnamese
                      ? 'Mật khẩu'
                      : 'Password',
                  hintText: '...',
                  errorText: null,
                ),
                textInputAction: TextInputAction.done,
                onEditingComplete: _submit,
                onChanged: _onChange,
              ),
              SizedBox(height: 16.0,),
              CustomElevatedButton(
                onPressed: !enableSignIn ? null : _submit,
                child: CustomText(
                  text: widget.onVietnamese
                      ? 'Vào'
                      : "Let's go",
                  textSize: 16.0,
                  textWeight: FontWeight.w700,
                  textColor: !enableSignIn ? Colors.nullTextGrey : Colors.darkBlueText,
                ),
                backgroundColor: !enableSignIn ? Colors.nullGrey : Colors.crystalGreenButton,
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
      ),
      backgroundColor: Colors.crystalGreenBackground,
    );
  }
}
