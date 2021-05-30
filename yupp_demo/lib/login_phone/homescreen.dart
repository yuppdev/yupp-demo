import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yupp_demo/login_phone/phone-login.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: MediaQuery
              .of(context)
              .size
              .height / 5,
          left: 8.0,
          right: 8.0,
          bottom: 0,
        ),
        padding: EdgeInsets.all(8.0),
        height: MediaQuery
            .of(context)
            .size
            .height / 2,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(30),
          shape: BoxShape.rectangle,
          color: Colors.white70,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    hintText: 'Username',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.blue, width: 1.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    hintText: 'Password',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.blue, width: 1.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {},
                child: Text('Sign In'),
                style: TextButton.styleFrom(
                  side: BorderSide(width: 1, color: Colors.grey),
                  minimumSize: Size(180, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  primary: Colors.white70,
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    side: BorderSide(width: 1, color: Colors.grey),
                    minimumSize: Size(145, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary: Colors.white,
                    backgroundColor: Colors.orange),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.face),
                    SizedBox(width: 5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _auth.signOut();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PhoneLogin()));
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
