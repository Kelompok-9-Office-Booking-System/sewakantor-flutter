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

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({Key? key}) : super(key: key);

  @override
  State<CreateNewPasswordPage> createState() => CreateNewPasswordPageState();
}

class CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  TextEditingController firstNameController = TextEditingController(text: '');
  TextEditingController lastNameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController confirmPasswordController =
      TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    handleSignUp() async {
      print('WOOYY');
      try {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 2),
            backgroundColor: successColor,
            content: Text(
              'Berhasil Kirim Email',
              textAlign: TextAlign.center,
            ),
          ),
        );

        Future.delayed(Duration(seconds: 3), () async {
          await Navigator.pushNamedAndRemoveUntil(
              context, '/send-email-page', (route) => true);
        });
      } catch (e) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     backgroundColor: alertColor,
        //     content: Text(
        //       toBeginningOfSentenceCase(
        //           e.response!.data["message"].toString())!,
        //       textAlign: TextAlign.center,
        //     ),
        //   ),
        // );
      }
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
                          'Create New Password',
                          style: primaryTextStyle.copyWith(
                            fontSize: 20,
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
                              'Your new password must be different from previous used password',
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
                              title: 'Password',
                              hintText: 'Enter your password',
                              colorTitle: primaryColorWhite,
                              colorBorder: primaryColorWhite,
                              colorHintText: primaryColorWhite.withOpacity(0.4),
                              colorText: primaryColorWhite,
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
                              colorText: primaryColorWhite,
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
                              text: 'Reset Password',
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
