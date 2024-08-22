import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print('Logged in Successfully');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            'Loggedin Successfully',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      Navigator.of(context).pushReplacementNamed('home_screen');
    }).onError((error, StackTrace) {
      print('Login Failed');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Login Failed $error',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    });
  }
}
