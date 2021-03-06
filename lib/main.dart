// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sewakantor_flutter/providers/auth_provider.dart';
import 'package:sewakantor_flutter/providers/page_provider.dart';
import 'package:sewakantor_flutter/providers/space_provider.dart';
import 'package:sewakantor_flutter/ui/pages/detail_room_page.dart';
import 'package:sewakantor_flutter/ui/pages/home/chat_page.dart';
import 'package:sewakantor_flutter/ui/pages/home/home_page.dart';
import 'package:sewakantor_flutter/ui/pages/home/main_page.dart';
import 'package:sewakantor_flutter/ui/pages/login_page.dart';
import 'package:sewakantor_flutter/ui/pages/not_found_page.dart';
import 'package:sewakantor_flutter/ui/pages/personal_information_page.dart';
import 'package:sewakantor_flutter/ui/pages/privacy_policy_page.dart';
import 'package:sewakantor_flutter/ui/reset_password/create_new_password_page.dart';
import 'package:sewakantor_flutter/ui/reset_password/reset_password_page.dart';
import 'package:sewakantor_flutter/ui/pages/signup_page.dart';
import 'package:sewakantor_flutter/ui/reset_password/send_email_page.dart';
import 'package:sewakantor_flutter/ui/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
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
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SpaceProvider(),
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
          '/reset-password-page': (context) => ResetPasswordPage(),
          '/send-email-page': (context) => SendEmailPage(),
          '/create-new-password-page': (context) => CreateNewPasswordPage(),
          '/main-page': (context) => MainPage(),
          '/home-page': (context) => HomePage(),
          '/chat-page': (context) => ChatPage(),
          '/detail-room-page': (context) => DetailRoomPage(),
          '/personal-information-page': (context) => PersonalInformationPage(),
          '/not-found-page': (context) => NotFoundPage(),
          '/privacy-policy-page': (context) => PrivacyPolicyPage(),
        },
      ),
    );
  }
}
