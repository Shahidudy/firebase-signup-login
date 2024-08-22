import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> signupUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print('Signup Successfully');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            'Signed up Successfully ',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      Navigator.of(context).pushNamedAndRemoveUntil(
        'home_screen',
        (Route<dynamic> route) => false,
      );
    }).onError((error, StackTrace) {
      print('Sigup failed');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Signup Failed $error',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    });
  }
}
