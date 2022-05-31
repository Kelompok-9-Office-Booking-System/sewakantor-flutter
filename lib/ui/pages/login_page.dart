// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_icon.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_text.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 60),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: primaryColorNobel,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
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
                      color: primaryColorNobel,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                      ),
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: 24, left: 115, right: 115),
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: primaryColorWhisper,
                            ),
                          ),
                          CustomTextFormField(
                            title: 'Email',
                            hintText: 'Enter your email',
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
                            isPasswordField: true,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          InkWell(
                            onTap: () {},
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
                            text: '',
                            onPrressed: () {},
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {},
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
                                    color: Colors.black,
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
                            onPrressed: () {},
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomButtonIcon(
                            text: 'Login with Apple ID',
                            imageAsset: 'assets/icon/apple_icon.png',
                            onPrressed: () {},
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
    );
  }
}
