import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class AuthService with ChangeNotifier{
  bool _isLoading = false;
  late String _errorMessage;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future register(String _email, String _password) async {
    setLoading(true);
    try{
      UserCredential authResult = await _auth
          .createUserWithEmailAndPassword(email: _email, password: _password);
      User? user = authResult.user;
      setLoading(false);
      return user;
    } on SocketException {
      setLoading(false);
      setMessage("No internet, please connect to internet");
    } catch(e){
      setLoading(false);
      setMessage(e.toString());
    }
    notifyListeners();
  }

  Future login(String _email, String _password) async {
    setLoading(true);
    try{
      UserCredential authResult = await _auth
          .signInWithEmailAndPassword(email: _email, password: _password);
      User? user = authResult.user;
      setLoading(false);
      return user;
    } on SocketException {
      setLoading(false);
      setMessage("No internet, please connect to internet");
    } catch(e){
      setLoading(false);
      setMessage(e.toString());
    }
    notifyListeners();
  }

  Future logout() async {
    await _auth.signOut();
  }

  void setLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  void setMessage(message) {
    _errorMessage = message;
    notifyListeners();
  }

  Stream<User?> get user => _auth.authStateChanges().map((event) => event);


  // sign in with email & password
  // ------------------------------------------
  Future signInWithEmailAndPassword(String _email, String _password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }


}