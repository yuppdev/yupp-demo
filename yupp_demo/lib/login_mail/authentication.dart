import 'package:flutter/material.dart';
import 'package:yupp_demo/login_mail/register.dart';
import 'package:yupp_demo/login_mail/sign_in.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isToggle = false;
  void toggleScreen() {
    setState(() {
      isToggle = !isToggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isToggle){
      return Register(toggleScreen: toggleScreen);
    }else{
      return SignInMail(toggleScreen: toggleScreen);
    }
  }
}
