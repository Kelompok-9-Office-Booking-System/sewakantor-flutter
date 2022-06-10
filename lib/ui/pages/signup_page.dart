// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_icon.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_text.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
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

    handleSignUp() async {
      try {
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
        Future.delayed(Duration(seconds: 3), () async {
          Navigator.pop(context);
        });
      } catch (e) {}
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
                          'Sign Up',
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
                            CustomTextFormField(
                              title: 'First Name',
                              hintText: 'Enter your first name',
                              colorTitle: primaryColorWhite,
                              colorBorder: primaryColorWhite,
                              colorHintText: primaryColorWhite.withOpacity(0.4),
                              controller: firstNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  //allow upper and lower case alphabets, space, and number
                                  return "First Name Required";
                                } else if (!RegExp(r'^[a-z A-Z 0-9]+$')
                                    .hasMatch(value)) {
                                  return "Enter Correct First Name";
                                } else if (value.length > 50) {
                                  return "Full Name too long";
                                }
                                {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomTextFormField(
                              title: 'Last Name',
                              hintText: 'Enter your last name',
                              colorTitle: primaryColorWhite,
                              colorBorder: primaryColorWhite,
                              colorHintText: primaryColorWhite.withOpacity(0.4),
                              controller: lastNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  //allow upper and lower case alphabets, space, and number
                                  return "Last Name Required";
                                } else if (!RegExp(r'^[a-z A-Z 0-9]+$')
                                    .hasMatch(value)) {
                                  return "Enter Correct Last Name";
                                } else if (value.length > 50) {
                                  return "Last Name too long";
                                }
                                {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 20,
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
                            CustomTextFormField(
                              title: 'Password',
                              hintText: 'Enter your password',
                              colorTitle: primaryColorWhite,
                              colorBorder: primaryColorWhite,
                              colorHintText: primaryColorWhite.withOpacity(0.4),
                              controller: passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password Required";
                                } else if (value.length < 8) {
                                  return "Password must be more than 8 characters";
                                } else if (value.length > 32) {
                                  return "Password must be less than 32 characters";
                                }
                                {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomTextFormField(
                              title: 'Confirrm Password',
                              hintText: 'Enter your confirm password',
                              colorTitle: primaryColorWhite,
                              colorBorder: primaryColorWhite,
                              colorHintText: primaryColorWhite.withOpacity(0.4),
                              controller: confirmPasswordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Verify Password Required";
                                } else if (value != passwordController.text) {
                                  return "Password and Verify Password must be match";
                                }
                                {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomButtonText(
                              text: 'Sign Up',
                              onPrressed: () {
                                if (formKey.currentState!.validate()) {
                                  handleSignUp();
                                }
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              bgColor: primaryColorBlackRussian,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/login-page', (route) => false);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have any account? ',
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: semiBold,
                                      color: primaryColorWhite,
                                    ),
                                  ),
                                  Text(
                                    ' Login',
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
          ],
        ),
      ),
    );
  }
}
