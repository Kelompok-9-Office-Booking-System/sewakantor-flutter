// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/models/space_model.dart';
import 'package:sewakantor_flutter/shared/theme.dart';
import 'package:sewakantor_flutter/utils/currency_format.dart';

class CustomCard extends StatelessWidget {
  final VoidCallback? onTap;
  final SpaceModel? space;
  const CustomCard({
    required this.onTap,
    required this.space,
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
                image: DecorationImage(
                  image: NetworkImage('${space!.thumbnail}'),
                  fit: BoxFit.cover,
                ),
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
                space!.name!,
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
                '${space!.address}',
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
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            '${space!.unit}',
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
                        '${space!.rating}',
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
                'Start from ${CurrencyFormat.convertToIdr(space!.price!, 0)}',
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
