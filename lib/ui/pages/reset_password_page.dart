// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sewakantor_flutter/providers/auth_provider.dart';
import 'package:sewakantor_flutter/shared/theme.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_icon.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_text.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_text_form_field.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => ResetPasswordPageState();
}

class ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController firstNameController = TextEditingController(text: '');
  TextEditingController lastNameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController confirmPasswordController =
      TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      try {
        if (await authProvider.signUp(
          email: emailController.text,
          password: passwordController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
        )) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 2),
              backgroundColor: Colors.greenAccent,
              content: Text(
                'Berhasil Daftar',
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              toBeginningOfSentenceCase(
                  e.response!.data["message"].toString())!,
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }

    handleSignIn() async {
      try {
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
        Future.delayed(Duration(seconds: 3), () async {
          await Navigator.pushNamedAndRemoveUntil(
              context, '/main-page', (route) => false);
        });
      } catch (e) {}
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ListView(
          children: [
            Container(
              // padding: const EdgeInsets.only(top: 30),
              height: MediaQuery.of(context).size.height,
              constraints: BoxConstraints(
                  // maxHeight: MediaQuery.of(context).size.height,
                  // maxWidth: MediaQuery.of(context).size.width,
                  ),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 24,
                      left: 40,
                      right: 40,
                      bottom: 26,
                    ),
                    height: 40,
                    // width: double.infinity,
                    // decoration: BoxDecoration(
                    //   color: primaryColorWhisper,
                    // ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.keyboard_backspace,
                            size: 36,
                          ),
                        ),
                        Text(
                          'Reset Password',
                          style: primaryTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                            color: primaryColorMidnightExpress,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Icon(
                          null,
                          size: 36,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 50,
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
                            Text(
                              'Enter the email associated with your account and we’ll send an email with instructions to reset your password',
                              style: primaryTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                                color: primaryColorWhite,
                              ),
                            ),
                            SizedBox(
                              height: 25,
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
                              height: 20,
                            ),
                            CustomButtonText(
                              text: 'Send',
                              onPrressed: () {
                                if (formKey.currentState!.validate()) {
                                  handleSignUp();
                                }
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              bgColor: primaryColorBlackRussian,
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
          ],
        ),
      ),
    );
  }
}
