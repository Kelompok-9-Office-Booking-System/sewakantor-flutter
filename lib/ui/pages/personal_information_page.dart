// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_text.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_text_form_field.dart';

class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: 35,
          top: 40,
          right: 35,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.chevron_left,
                size: 30,
              ),
            ),
            Text(
              'Personal Information',
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            Container(
              child: Icon(
                null,
                size: 30,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          header(),
          Container(
            margin: EdgeInsets.only(
              left: 35,
              right: 35,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  title: 'First Name',
                  colorTitle: primaryColorBlackRussian,
                  colorBorder: primaryColorBlackRussian,
                  colorHintText: primaryColorBlackRussian.withOpacity(0.4),
                  hintText: 'Enter your first name',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  title: 'Last Name',
                  colorTitle: primaryColorBlackRussian,
                  colorBorder: primaryColorBlackRussian,
                  colorHintText: primaryColorBlackRussian.withOpacity(0.4),
                  hintText: 'Enter your last name',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  title: 'Phone Number',
                  colorTitle: primaryColorBlackRussian,
                  colorBorder: primaryColorBlackRussian,
                  colorHintText: primaryColorBlackRussian.withOpacity(0.4),
                  hintText: 'Enter your Phone number',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  title: 'Email',
                  colorTitle: primaryColorBlackRussian,
                  colorBorder: primaryColorBlackRussian,
                  colorHintText: primaryColorBlackRussian.withOpacity(0.4),
                  hintText: 'Enter your email',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButtonText(
                  text: 'Save',
                  bgColor: primaryColorBlackRussian,
                  onPrressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
