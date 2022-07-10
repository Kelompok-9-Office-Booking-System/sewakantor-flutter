import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';

class CustomWidgetFacilities extends StatelessWidget {
  final String? nameLeft;
  final String? iconLeft;
  final String? nameRight;
  final String? iconRight;
  const CustomWidgetFacilities({
    required this.nameLeft,
    required this.iconLeft,
    required this.nameRight,
    required this.iconRight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return nameLeft != null
        ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width / 2) - 30,
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: iconLeft!,
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Expanded(
                          child: Text(
                            '${nameLeft}',
                            style: primaryTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: semiBold,
                              color: primaryColorBlack,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  nameRight != null
                      ? Container(
                          width: (MediaQuery.of(context).size.width / 2) - 30,
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl: iconRight!,
                                width: 24,
                                height: 24,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Expanded(
                                child: Text(
                                  '${nameRight}',
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: semiBold,
                                    color: primaryColorBlack,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                ],
              ),
              SizedBox(
                height: 7,
              ),
            ],
          )
        : SizedBox();
  }
}
