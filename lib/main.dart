// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/ui/pages/home_page.dart';
import 'package:sewakantor_flutter/ui/pages/login_page.dart';
import 'package:sewakantor_flutter/ui/pages/signup_page.dart';
import 'package:sewakantor_flutter/ui/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home-page': (context) => HomePage(),
        '/login-page': (context) => LoginPage(),
        '/signup-page': (context) => SignUpPage(),
      },
    );
  }
}
