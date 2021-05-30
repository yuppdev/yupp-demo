// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:yupp_demo/login_mail/auth.dart';
// import 'package:yupp_demo/login_mail/constants.dart';
//
// class SignIn extends StatefulWidget {
//   @override
//   _SignInState createState() => _SignInState();
// }
//
// class _SignInState extends State<SignIn> {
//   final AuthService _auth = AuthService();
//   final _formKey = GlobalKey<FormState>();
//   bool loading = false;
//
//   // String username;
//   // String password;
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height/2.9,
//         margin: EdgeInsets.only(
//           top: MediaQuery.of(context).size.height/5,
//           left: 8.0,
//           right: 8.0,
//           bottom: 0.0,
//         ),
//         padding: EdgeInsets.only(top: 20, left: 15.0, right: 15.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           shape: BoxShape.rectangle,
//           color: Colors.orange[300],
//
//         ),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8.0),
//                 child: TextFormField(
//                   decoration: textInputDecoration.copyWith(hintText: 'mail@abc.com'),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8.0),
//                 child: TextFormField(
//                   decoration: textInputDecoration.copyWith(hintText: 'Password'),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8.0),
//                 child: TextButton(
//                   onPressed: () {},
//                   child: Text('Sign In', style: TextStyle(fontSize: 18),),
//                   style: TextButton.styleFrom(
//                     minimumSize: Size(145, 40),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0)
//                     ),
//                     primary: Colors.white,
//                     backgroundColor: Colors.green
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
