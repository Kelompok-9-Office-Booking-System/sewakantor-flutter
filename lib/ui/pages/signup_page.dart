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
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
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
                    top: 30 + 24,
                    left: 115 + 40,
                    right: 115 + 40,
                    bottom: 26,
                  ),
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: primaryColorWhisper,
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
                      color: primaryColorNobel,
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
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            title: 'Last Name',
                            hintText: 'Enter your last name',
                          ),
                          SizedBox(
                            height: 20,
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
                            height: 20,
                          ),
                          CustomTextFormField(
                            title: 'Password',
                            hintText: 'Enter your password',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            title: 'Confirrm Password',
                            hintText: 'Enter your confirm password',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomButtonText(
                            text: '',
                            onPrressed: () {},
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
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
        ],
      ),
    );
  }
}
