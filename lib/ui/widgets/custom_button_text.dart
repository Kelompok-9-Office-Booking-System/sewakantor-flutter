import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';

class CustomButtonText extends StatelessWidget {
  final String text;
  final Color? bgColor;
  final Color? textColor;
  final VoidCallback? onPrressed;

  const CustomButtonText({
    required this.text,
    this.bgColor,
    this.textColor,
    required this.onPrressed,
    Key? key,
  }) : super(key: key);

  Color get defaultColor => primaryColorSilver;
  Color get defaultTextColor => primaryColorWhite;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: bgColor ?? defaultColor,
          onPrimary: textColor ?? defaultTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: primaryTextStyle.copyWith(
            fontSize: 14,
            fontWeight: semiBold,
          ),
        ),
        onPressed: onPrressed,
      ),
    );
  }
}
