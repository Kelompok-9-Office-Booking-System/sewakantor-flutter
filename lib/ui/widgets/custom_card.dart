// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';

class CustomCard extends StatelessWidget {
  final VoidCallback? onTap;
  const CustomCard({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // color: Colors.blueAccent,
        width: 180,
        margin: EdgeInsets.only(right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 95,
              width: 180,
              decoration: BoxDecoration(
                color: primaryColorNobel,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              // color: Colors.red,
              child: Text(
                'BCA Tower',
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                  color: primaryColorBlack,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Text(
                '50/F, Menara BCA Grand Indonesia, Jakarta, 10310 50/F, Menara BCA Grand Indonesia, Jakarta, 10310',
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: reguler,
                  color: primaryColorBlack.withOpacity(0.6),
                ),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              // color: Colors.red,

              child: Row(
                children: [
                  Container(
                    width: 90,
                    child: Row(
                      children: [
                        Icon(
                          Icons.home_work,
                          color: primaryColorBlackRussian,
                        ),
                        Expanded(
                          child: Text(
                            '143',
                            style: primaryTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: reguler,
                              color: primaryColorBlack,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
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
                ],
              ),
            ),
            SizedBox(
              height: 5,
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
    );
  }
}
