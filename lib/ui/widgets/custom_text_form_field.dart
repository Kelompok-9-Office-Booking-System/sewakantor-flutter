// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';

class CustomTextFormField extends StatefulWidget {
  final String title;
  final String hintText;
  final String? Function(String?)? validator;
  final bool isPasswordField;

  const CustomTextFormField({
    required this.title,
    required this.hintText,
    this.validator,
    this.isPasswordField = false,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: primaryTextStyle.copyWith(
              fontSize: 14,
              fontWeight: bold,
              color: primaryColorWhite,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(
                10,
              ),
              border: Border.all(
                color: primaryColorWhite,
                width: 1.5,
              ),
            ),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      obscureText:
                          !widget.isPasswordField ? false : hidePassword,
                      // controller: emailController,
                      style: primaryTextStyle.copyWith(
                        color: primaryColorWhite,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: !widget.isPasswordField
                            ? null
                            : IconButton(
                                onPressed: () {
                                  // Update the state i.e. toogle the state of hidePassword variable
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                icon: Icon(
                                  // Based on hidePassword state choose the icon
                                  hidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.black,
                                ),
                              ),
                        hintText: widget.hintText,
                        hintStyle: primaryTextStyle.copyWith(
                          // fontSize: 14,
                          fontWeight: medium,
                          color: primaryColorWhite.withOpacity(0.4),
                        ),
                      ),

                      validator: widget.validator,
                      // (value) {
                      //   if (value!.isEmpty) {
                      //     return "Email Required";
                      //   } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      //       .hasMatch(value)) {
                      //     return 'Enter Correct Email';
                      //   } else {
                      //     return null;
                      //   }
                      // },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
