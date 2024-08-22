import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:signlog/pages/home_screen.dart';
import 'package:signlog/pages/login_screen.dart';
import 'package:signlog/pages/sign_up_screen.dart';
import 'firebase_options.dart';

// Platform  Firebase App Id
// android   1:1092249810802:android:d39ea52e88808c47e64feb
// ios       1:1092249810802:ios:04af7c4765c2ee16e64feb
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign log',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
      routes: {
        'signup_screen': (ctx) => SignUpScreen(),
        'login_screen': (ctx) => LoginScreen(),
        'home_screen': (ctx) => HomeScreen(),
      },
    );
  }
}
