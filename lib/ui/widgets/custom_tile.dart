// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/models/space_model.dart';
import 'package:sewakantor_flutter/shared/theme.dart';
import 'package:sewakantor_flutter/utils/currency_format.dart';

class CustomTile extends StatelessWidget {
  final VoidCallback? onTap;
  final SpaceModel? space;
  const CustomTile({
    this.onTap,
    required this.space,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    height: 110,
                    width: 90,
                    imageUrl: "${space!.thumbnail}",
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
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
                        '${space!.name}',
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
                          '${space!.unit}',
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
                          '${space!.rating}',
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
                        '${space!.address}',
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
            ),
          ],
        ),
      ),
    );
  }
}
