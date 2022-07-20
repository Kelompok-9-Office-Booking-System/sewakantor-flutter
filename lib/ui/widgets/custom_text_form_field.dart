// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';

class CustomTextFormField extends StatefulWidget {
  final String title;
  final Color colorTitle;
  final Color colorBorder;
  final String hintText;
  final Color colorHintText;
  final Color colorText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isPasswordField;
  final bool isEnabled;

  const CustomTextFormField({
    required this.title,
    required this.colorTitle,
    required this.colorBorder,
    required this.hintText,
    required this.colorHintText,
    required this.colorText,
    this.controller,
    this.validator,
    this.isPasswordField = false,
    this.isEnabled = true,
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
              color: widget.colorTitle,
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
              color: widget.isEnabled ? Colors.transparent : primaryColorSilver,
              borderRadius: BorderRadius.circular(
                10,
              ),
              border: Border.all(
                color: widget.colorBorder,
                width: 1.5,
              ),
            ),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        TextFormField(
                          enabled: widget.isEnabled,
                          controller: widget.controller,
                          obscureText:
                              !widget.isPasswordField ? false : hidePassword,
                          // controller: emailController,
                          style: primaryTextStyle.copyWith(
                            color: widget.colorText,
                          ),
                          decoration: InputDecoration(
                            isCollapsed: true,
                            border: InputBorder.none,
                            // contentPadding: EdgeInsets.only(top: 10),
                            focusedBorder: InputBorder.none,

                            // suffixIcon: !widget.isPasswordField
                            //     ? null
                            //     : IconButton(
                            //         onPressed: () {
                            //           // Update the state i.e. toogle the state of hidePassword variable
                            //           setState(() {
                            //             hidePassword = !hidePassword;
                            //           });
                            //         },
                            //         icon: Icon(
                            //           // Based on hidePassword state choose the icon
                            //           hidePassword
                            //               ? Icons.visibility_off
                            //               : Icons.visibility,
                            //           color: Colors.black,
                            //         ),
                            //       ),
                            hintText: widget.hintText,
                            hintStyle: primaryTextStyle.copyWith(
                              // fontSize: 14,
                              fontWeight: medium,
                              color: widget.colorHintText,
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
                        Positioned(
                          top: -10,
                          right: -10,
                          bottom: -10,
                          child: !widget.isPasswordField
                              ? SizedBox()
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
                        ),
                      ],
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
