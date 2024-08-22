import 'package:flutter/material.dart';
import 'package:signlog/common_widget/common_widget.dart';
import 'package:signlog/controller/signup_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 148, 176, 149),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'S I G N U P',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          CommonWidget.textformfieldbuild(
            labelText: ' User Name',
            preficon: Icons.person,
            controller: userController,
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
            controller: passwordController,
          ),
          CommonWidget.loginSignupButton(
            btnLabal: 'SignUp',
            signupFun: () async {
              SignupController signupController = SignupController();
              await signupController.signupUser(
                email: emailController.text,
                password: passwordController.text,
                context: context,
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          CommonWidget.doYouHaveAccount(
              context: context,
              myText: 'Login',
              routName: 'login_screen',
              isAccount: 'Do you have an account?'),
        ],
      ),
    );
  }
}
