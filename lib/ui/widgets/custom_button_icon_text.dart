// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';

class CustomButtonIconText extends StatelessWidget {
  final String text;
  final String imageAsset;
  final Color? bgColor;
  final Color? textColor;
  final VoidCallback? onPrressed;

  const CustomButtonIconText({
    required this.text,
    required this.imageAsset,
    this.bgColor,
    this.textColor,
    required this.onPrressed,
    Key? key,
  }) : super(key: key);

  Color get defaultColor => primaryColorBlack;
  Color get defaultTextColor => primaryColorWhite;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: bgColor ?? defaultTextColor,
          side: BorderSide(
            width: 1.5,
            color: primaryColorBlack,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              imageAsset,
              height: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
                color: primaryColorBlack,
              ),
            ),
          ],
        ),
        onPressed: onPrressed,
      ),
    );
  }
}
