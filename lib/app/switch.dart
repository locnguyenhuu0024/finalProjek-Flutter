//@dart=2.9
import '/app/pages/signinPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/app/services/authbase.dart';
import 'pages/evaluatePage.dart';
import 'pages/userPage.dart';
import 'customize/customizeLanguageButton.dart';
import 'package:flutter/material.dart';
import 'customize/customizeNavigatorButton.dart';

class SwitchPage extends StatefulWidget {
  final AuthBase auth;

  const SwitchPage({@required this.auth});
  @override
  _SwitchPageState createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {

  bool onUser = false;
  bool onVietnamese = true;
  bool onSigned = false;

  void _switchUserPage(){
    setState(() {
      if(onUser == false){
        onUser = true;
      }
    });
  }

  void _switchEvaluatePage(){
    setState(() {
      if(onUser == true){
        onUser = false;
      }
    });
  }

  void _switchLang(){
    setState(() {
      if(onVietnamese == false){
        onVietnamese = true;
      }else{
        onVietnamese = false;
      }
    });
  }

  Widget _buildAppBar(BuildContext context){
    //TODO: Add action in this function
    return AppBar(
      title: Image.asset('images/logoMobileFinalProjek1.png', width: 40, height: 40,),
      elevation: 5.0,
      actions: <Widget>[
        Row(
          children: [
            onVietnamese == true ? CustomLangButton(nameImage: 'vi.png', onPressed: _switchLang,)
                : CustomLangButton(nameImage: 'uk.png', onPressed: _switchLang,)
          ],
        )
      ],
      backgroundColor: Colors.crystalGreen,
    );
  }



  Widget _buildNavigator(BuildContext context){
    //TODO: Add action in this function
    return Row(
      children: [
        CustomNavigatorBar(
          nameImage: 'evaluate.png',
          onPressed: onUser == true ? _switchEvaluatePage : null,
          backgroundColor: onUser == false ? Colors.crystalGreenButton : Colors.lightCrystalGreen,
        ),
        CustomNavigatorBar(
          nameImage: 'user.png',
          onPressed: onUser == false ? _switchUserPage : null,
          backgroundColor: onUser == true ? Colors.crystalGreenButton : Colors.lightCrystalGreen,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }
  
  Widget _buildEvaluate(BuildContext context){
    return EvaluatePage(onVietnamese: onVietnamese,);
  }
  

  Widget _buildUserPage(BuildContext context){
    return StreamBuilder<User>(
      stream: widget.auth.authStateChanges(),
      builder: (context, snapShot){
        if(snapShot.connectionState == ConnectionState.active){
          final User user = snapShot.data;
          if(user == null){
            return SignInPage(onVietnamese: onVietnamese, auth: widget.auth,);
          }else{
            return UserPage(onVietnamese: onVietnamese, auth: widget.auth,);
          }
        }
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      bottomNavigationBar: _buildNavigator(context),
      body: onUser ? _buildUserPage(context) : _buildEvaluate(context),
      backgroundColor: Colors.crystalGreenBackground,
    );
  }
}

