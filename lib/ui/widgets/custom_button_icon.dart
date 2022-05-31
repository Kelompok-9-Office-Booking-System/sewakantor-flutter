// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';

class CustomButtonIcon extends StatelessWidget {
  final String text;
  final String imageAsset;
  final Color? bgColor;
  final Color? textColor;
  final VoidCallback? onPrressed;

  const CustomButtonIcon({
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
      height: 45,
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
          mainAxisAlignment: MainAxisAlignment.center,
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
                fontSize: 14,
                fontWeight: semiBold,
                color: primaryColorWhite,
              ),
            ),
          ],
        ),
        onPressed: onPrressed,
      ),
    );
  }
}
