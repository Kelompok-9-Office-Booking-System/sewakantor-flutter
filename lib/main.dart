// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sewakantor_flutter/providers/page_provider.dart';
import 'package:sewakantor_flutter/ui/pages/detail_room_page.dart';
import 'package:sewakantor_flutter/ui/pages/home/home_page.dart';
import 'package:sewakantor_flutter/ui/pages/home/main_page.dart';
import 'package:sewakantor_flutter/ui/pages/login_page.dart';
import 'package:sewakantor_flutter/ui/pages/not_found_page.dart';
import 'package:sewakantor_flutter/ui/pages/personal_information_page.dart';
import 'package:sewakantor_flutter/ui/pages/signup_page.dart';
import 'package:sewakantor_flutter/ui/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sewa Kantor',
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/login-page': (context) => LoginPage(),
          '/signup-page': (context) => SignUpPage(),
          '/main-page': (context) => MainPage(),
          '/home-page': (context) => HomePage(),
          '/detail-room-page': (context) => DetailRoomPage(),
          '/personal-information-page': (context) => PersonalInformationPage(),
          '/not-found-page': (context) => NotFoundPage(),
        },
      ),
    );
  }
}
