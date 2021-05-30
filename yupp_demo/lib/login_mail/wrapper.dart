import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yupp_demo/login_mail/authentication.dart';
import 'package:yupp_demo/login_mail/homescreen.dart';
import 'package:yupp_demo/login_mail/sign_in.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if(user != null) {
      return HomeScreen();
    }else{
      return Authentication();
    }
  }
}
