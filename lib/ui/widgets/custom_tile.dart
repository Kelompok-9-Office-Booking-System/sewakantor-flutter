// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 110,
            width: 90,
            decoration: BoxDecoration(
              color: primaryColorNobel,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // color: Colors.red,
                    // width: double.infinity,
                    child: Text(
                      'BCA Tower',
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                        color: primaryColorBlack,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.home_work,
                        color: primaryColorBlackRussian,
                      ),
                      Text(
                        '143',
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: reguler,
                          color: primaryColorBlack,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.star,
                        color: secondaryColorTengerineYellow,
                      ),
                      Text(
                        '4.7',
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                          color: primaryColorBlack,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      '50/F, Menara BCA Grand Indonesia, Jakarta, 10310',
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: reguler,
                        color: primaryColorBlack.withOpacity(0.6),
                      ),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Start from Rp. 2.600.000',
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                        color: primaryColorBlack,
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 2,
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
