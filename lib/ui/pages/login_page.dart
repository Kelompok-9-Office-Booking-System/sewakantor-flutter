// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sewakantor_flutter/providers/auth_provider.dart';
import 'package:sewakantor_flutter/shared/theme.dart';
import 'package:sewakantor_flutter/ui/pages/signup_page.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_icon.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_text.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignIn() async {
      try {
        if (await authProvider.signIn(
          email: emailController.text,
          password: passwordController.text,
        )) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 2),
              backgroundColor: Colors.greenAccent,
              content: Text(
                'Berhasil Login',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        Future.delayed(Duration(seconds: 3), () async {
          await Navigator.pushNamedAndRemoveUntil(
              context, '/main-page', (route) => false);
        });
      } on DioError catch (e) {
        // String handlingErrorCode(String errorCode) {
        //   if (errorCode == 'user-not-found') {
        //     return 'User Not Found';
        //   } else if (errorCode == 'wrong-password') {
        //     return 'Wrong Password';
        //   }
        //   return errorCode;
        // }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              e.response!.data["message"].toString(),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height + 100),
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 60),
                    width: 50,
                    child: Image.asset(
                      'assets/wireframe/logo_splash_wf.png',
                      scale: 2,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        right: 40,
                        left: 40,
                        bottom: 40,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: primaryColorMidnightExpress,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                        ),
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: 24, left: 115, right: 115),
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  // color: primaryColorWhisper,
                                  ),
                              child: Text(
                                'Login',
                                style: primaryTextStyle.copyWith(
                                  fontSize: 24,
                                  fontWeight: semiBold,
                                  color: secondaryColorWhite,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 26,
                            ),
                            CustomTextFormField(
                              title: 'Email',
                              hintText: 'Enter your email',
                              colorTitle: primaryColorWhite,
                              colorBorder: primaryColorWhite,
                              colorHintText: primaryColorWhite.withOpacity(0.4),
                              controller: emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Email Required";
                                } else if (!RegExp(
                                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(value)) {
                                  return 'Enter Correct Email';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 26,
                            ),
                            CustomTextFormField(
                              title: 'Password',
                              hintText: 'Enter your password',
                              colorTitle: primaryColorWhite,
                              colorBorder: primaryColorWhite,
                              colorHintText: primaryColorWhite.withOpacity(0.4),
                              controller: passwordController,
                              isPasswordField: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password Required";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/reset-password-page');

                                print('reset password page');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Forgot your password?',
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: bold,
                                      color: primaryColorWhite,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            CustomButtonText(
                              text: 'Login',
                              onPrressed: () {
                                if (formKey.currentState!.validate()) {
                                  handleSignIn();
                                }
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              bgColor: primaryColorBlackRussian,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/signup-page');

                                print('signup page');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don\'t have any account? ',
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: semiBold,
                                      color: primaryColorWhite,
                                    ),
                                  ),
                                  Text(
                                    ' Sign Up',
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: semiBold,
                                      color: primaryColorWhite,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            CustomButtonIcon(
                              text: 'Login with Google',
                              imageAsset: 'assets/icon/google_icon.png',
                              onPrressed: () {
                                handleSignIn();
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
