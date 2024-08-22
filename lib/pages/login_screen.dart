import 'package:flutter/material.dart';
import 'package:signlog/common_widget/common_widget.dart';
import 'package:signlog/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 180, 201, 153),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'L O G I N',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          CommonWidget.textformfieldbuild(
            labelText: ' Email',
            preficon: Icons.email,
            controller: emailController,
          ),
          CommonWidget.textformfieldbuild(
              labelText: ' Password',
              preficon: Icons.password,
              obscureText: true,
              controller: passwordController),

          //LOGIN BUTTON
          CommonWidget.loginSignupButton(
            btnLabal: 'Login',
            signupFun: () async {
              LoginController loginController = LoginController();
              await loginController.loginUser(
                  email: emailController.text,
                  password: passwordController.text,
                  context: context);
            },
          ),
          CommonWidget.doYouHaveAccount(
              context: context,
              myText: 'Signup',
              routName: 'signup_screen',
              isAccount: "Don't you have an Account ? "),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
