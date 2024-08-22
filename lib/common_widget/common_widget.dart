import 'package:flutter/material.dart';

class CommonWidget {
  //TEXT FORM FIELD
  static Container textformfieldbuild({
    required String labelText,
    required IconData preficon,
    required controller,
    bool obscureText = false,
  }) {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 10, bottom: 10),
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          prefix: Icon(
            preficon,
            weight: 15,
            size: 17,
            color: Colors.grey,
          ),
          border: InputBorder.none,
          hintText: labelText,
          hintStyle: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  //DO YOU HAVE ACCOUNT? BUTTON
  static InkWell doYouHaveAccount(
      {required context,
      required String routName,
      required String myText,
      required String isAccount}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(routName);
      },
      child: RichText(
        text: TextSpan(
          text: isAccount,
          children: [
            TextSpan(
              text: myText,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  //LOGIN SIGNUP BUTTON
  static Container loginSignupButton(
      {required String btnLabal, required void signupFun()}) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: signupFun,
        child: Text(
          btnLabal,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
