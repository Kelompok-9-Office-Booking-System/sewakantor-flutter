// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:sewakantor_flutter/shared/theme.dart';

class CustomChatTile extends StatelessWidget {
  const CustomChatTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      height: 110,
      margin: EdgeInsets.only(
        left: 35,
        right: 35,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                height: 50,
                width: 50,
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
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '11.37 PM',
                            style: primaryTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: reguler,
                              color: primaryColorBlack,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
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
                              'Hello, my name is Lion as customer service. How can I help you? Hello, my name is Lion as customer service. How can I help you? ',
                              style: primaryTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: reguler,
                                color: primaryColorBlack,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: primaryColorBlack,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '12',
                                style: primaryTextStyle.copyWith(
                                  fontSize: 13,
                                  fontWeight: medium,
                                  color: primaryColorWhite,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Spacer(),
          Divider(
            color: primaryColorBlack.withOpacity(0.5),
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
