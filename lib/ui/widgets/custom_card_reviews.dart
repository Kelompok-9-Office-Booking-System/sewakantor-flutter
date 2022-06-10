// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';

class CustomCardReviews extends StatelessWidget {
  const CustomCardReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: primaryColorWhisper,
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width - 60 - 40,
      height: 70,
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: primaryColorGrey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            width: 22,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: secondaryColorTengerineYellow,
                  ),
                  Text(
                    '4.7',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                      color: primaryColorBlack,
                    ),
                  ),
                ],
              ),
              Text(
                'Cameron Williamson',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                  color: primaryColorBlack,
                ),
              ),
              Text(
                'Nice spaces',
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                  color: primaryColorBlack,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
