// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';

class CustomButtonSelect extends StatelessWidget {
  final String date;
  final GestureTapCallback? onTap;
  const CustomButtonSelect({
    required this.date,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          // color: Colors.red,
          border: Border.all(
            color: primaryColorWhite,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              '${date}',
              style: primaryTextStyle.copyWith(
                color: primaryColorWhite,
                fontWeight: medium,
                fontSize: 12,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            RotatedBox(
              quarterTurns: 45,
              child: Icon(
                Icons.chevron_right,
                color: primaryColorWhite,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
