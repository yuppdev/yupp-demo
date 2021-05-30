import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yupp_demo/login_mail/constants.dart';
import 'package:yupp_demo/login_phone/homescreen.dart';
import 'package:yupp_demo/main.dart';

enum MobileVerification {
  SHOW_MOBILE_FORM,
  SHOW_OTP_FORM,
}

class PhoneLogin extends StatefulWidget {
  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  MobileVerification currentState = MobileVerification.SHOW_MOBILE_FORM;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = '';
  bool showLoading = false;

  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });
    try {
      final authCredential = await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = false;
      });
      if (authCredential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
      final snackBar = SnackBar(content: Text(e.message.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  getOTP(context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        padding: EdgeInsets.all(18),
        margin: EdgeInsets.only(top: 200.0, left: 10.0, right: 10.0, bottom: 0.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            shape: BoxShape.rectangle,
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                // validator: (val){
                //   return RegExp(r'([0]{1}[1-9]{1}[0-9]{8})|([+84]{1}[1-9]{1}[0-9]{8})$')
                //       .hasMatch(val)
                //       ? null
                //       : "Incorrect phone number";
                // },
                decoration: InputDecoration(
                    hintText: '+84909111222',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextButton(
                onPressed: () async {
                  String phone = configPhoneNumber(phoneController.text.trim());
                  setState(() {
                    showLoading = true;
                  });
                  await _auth.verifyPhoneNumber(
                    // 1.phoneNumber -------------------------------------------
                    // phoneNumber: phoneController.text,
                    phoneNumber: phone,
                    // 2.verificationCompleted ---------------------------------
                    verificationCompleted: (phoneAuthCredential) async {
                      setState(() {
                        showLoading = false;
                      });
                      // signInWithPhoneAuthCredential(phoneAuthCredential);
                    },
                    // 3.verificationFailed ------------------------------------
                    verificationFailed: (verificationFailed) async {
                      setState(() {
                        showLoading = false;
                      });
                      final snackBar = SnackBar(content: Text(verificationFailed.message.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    // 4.codeSent  ---------------------------------------------
                    codeSent: (verifyId, resendToken) async {
                      setState(() {
                        showLoading = false;
                        currentState = MobileVerification.SHOW_OTP_FORM;
                        this.verificationId = verifyId;
                      });
                    },
                    // 5.codeAutoRetrievalTimeout ------------------------------
                    codeAutoRetrievalTimeout: (verificationId) async {},
                  );
                },
                child: Text(
                  'Get OTP',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                style: TextButton.styleFrom(
                    minimumSize: Size(150, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.green),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: flatButtonStyle,
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => MyApp())
                      );
                    },
                    child: Text('Sign in with email'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  verifyPhone(context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      padding: EdgeInsets.all(18),
      margin: EdgeInsets.only(top: 200.0, left: 10.0, right: 10.0, bottom: 0.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          shape: BoxShape.rectangle,
          color: Colors.white),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: TextField(
              controller: otpController,
              decoration: InputDecoration(
                  hintText: 'Input OTP',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextButton(
              onPressed: () async {
                PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                  verificationId: verificationId,
                  smsCode: otpController.text,
                );
                signInWithPhoneAuthCredential(phoneAuthCredential);
              },
              child: Text(
                'Verify',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              style: TextButton.styleFrom(
                  minimumSize: Size(150, 45),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.blue),
            ),
          )
        ],
      ),
    );
  }

  configPhoneNumber(String phone){
    String phoneConfig = phone;
    int digit = phone.length;
    String phoneCode = phone.substring(0, 1);
    if(phoneCode == '0'){
      phoneCode = '+84';
      String phoneAfterCode = phone.substring(1, phone.length);
      phoneConfig = "$phoneCode$phoneAfterCode";
    }
    print('phoneConfig: $phoneConfig');
    return phoneConfig;
  }

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // key: _scaffoldKey,
        backgroundColor: Colors.grey.shade700,
        body: showLoading
            ? Center(child: CircularProgressIndicator())
            : (currentState == MobileVerification.SHOW_MOBILE_FORM
                ? getOTP(context)
                : verifyPhone(context))
        );
  }
}
