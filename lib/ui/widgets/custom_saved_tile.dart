// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';

class CustomSavedTile extends StatelessWidget {
  const CustomSavedTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColorWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 140,
      margin: EdgeInsets.only(
        left: 35,
        right: 35,
        bottom: 14,
      ),
      padding: EdgeInsets.only(top: 15, left: 5, right: 5),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: primaryColorNobel,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // color: Colors.red,
                      // width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      // color: Colors.red,
                      // width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Jl. HR. Rasuna Said Kav. 3-4 Tempo Scan Tower 32nd floor, Jakarta, 12950 Scan Tower 32nd floor, Jakarta, 12950',
                              style: primaryTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: reguler,
                                color: primaryColorBlack.withOpacity(0.7),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      // color: Colors.red,
                      // width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Start from Rp 2.300.000',
                              style: primaryTextStyle.copyWith(
                                fontSize: 13,
                                fontWeight: medium,
                                color: primaryColorBlack,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: InkWell(
                  onTap: () {
                    print('SAVED ITEM');
                  },
                  child: Icon(
                    Icons.bookmark_outline,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
