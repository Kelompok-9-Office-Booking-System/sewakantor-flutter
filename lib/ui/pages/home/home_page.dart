// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_icon.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_text.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_card.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_text_form_field.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: 35,
          top: 40,
          right: 35,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Find The Perfect \nSpace',
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              // height: 30,
              // width: 30,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: primaryColorWhisper,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Icon(
                Icons.notifications_none_outlined,
              ),
            ),
          ],
        ),
      );
    }

    Future<void> showFilterSearch() async {
      return showDialog(
        context: context,
        builder: (context) {
          return Container(
            // margin: EdgeInsets.all(20),
            width: double.infinity,
            child: Dialog(
              insetPadding: EdgeInsets.all(10),
              backgroundColor: primaryColorMidnightExpress,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Filter',
                              style: primaryTextStyle.copyWith(
                                color: primaryColorWhite,
                                fontWeight: semiBold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close,
                                color: primaryColorWhite,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      CustomTextFormField(
                        title: 'Locations',
                        colorTitle: primaryColorWhite,
                        colorBorder: primaryColorWhite,
                        colorHintText: primaryColorWhite.withOpacity(0.4),
                        hintText: 'Find location',
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Select Date',
                        style: primaryTextStyle.copyWith(
                          color: primaryColorWhite,
                          fontWeight: semiBold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Office Type',
                        style: primaryTextStyle.copyWith(
                          color: primaryColorWhite,
                          fontWeight: semiBold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Capacity',
                            style: primaryTextStyle.copyWith(
                              color: primaryColorWhite,
                              fontWeight: semiBold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '100 - 1000',
                            style: primaryTextStyle.copyWith(
                              color: primaryColorWhite,
                              fontWeight: semiBold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Price',
                            style: primaryTextStyle.copyWith(
                              color: primaryColorWhite,
                              fontWeight: semiBold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Rp 100.000 - 10.000.000',
                            style: primaryTextStyle.copyWith(
                              color: primaryColorWhite,
                              fontWeight: semiBold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      CustomButtonText(
                        text: 'Show result',
                        bgColor: primaryColorBlackRussian,
                        onPrressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    Widget searchBar() {
      print(MediaQuery.of(context).size.width);
      return Container(
        margin: EdgeInsets.only(
          left: 35,
          right: 35,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  // horizontal: defaultMargin,
                  ),
              padding: EdgeInsets.only(left: 5, top: 0, right: 5, bottom: 0),
              // height: 45,
              width: MediaQuery.of(context).size.width - 70 - 50 - 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1.5,
                  color: primaryColorGrey,
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search space or location',
                  hintStyle: primaryTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: InkWell(
                      onTap: () {
                        print('CARI');
                      },
                      child: Icon(
                        Icons.search,
                        color: primaryColorBlack,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 53,
              width: 53,
              decoration: BoxDecoration(
                color: primaryColorBlackRussian,
                borderRadius: BorderRadiusDirectional.circular(10),
              ),
              child: IconButton(
                color: primaryColorWhite,
                onPressed: () async {
                  print('Filter Search');
                  await showFilterSearch();
                },
                icon: Icon(Icons.tune_outlined),
              ),
            )
          ],
        ),
      );
    }

    Widget headTitleAndViewAll({required String title}) {
      return Container(
        margin: EdgeInsets.only(
          left: 35,
          right: 35,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            Text(
              'View All',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    Widget popularProducts() {
      return Container(
        // color: Colors.red,
        margin: EdgeInsets.only(
          left: 35,
          // right: 35,
        ),
        height: 270,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return CustomCard(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/detail-room-page',
                );
              },
            );
          },
        ),
      );
    }

    Widget bestDealProducts() {
      return Container(
        margin: EdgeInsets.only(
          left: 35,
          right: 35,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTile(),
            CustomTile(),
            CustomTile(),
          ],
        ),
      );
    }

    Widget suggestionsProducts() {
      return Container(
        margin: EdgeInsets.only(
          left: 35,
          right: 35,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTile(),
            CustomTile(),
            CustomTile(),
          ],
        ),
      );
    }

    Widget bodyLoaded() {
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          height: double.infinity,
          child: ListView(
            children: [
              Container(
                // padding: EdgeInsets.only(left: 35, top: 40, right: 35),

                child: Column(
                  children: [
                    header(),
                    SizedBox(
                      height: 25,
                    ),
                    searchBar(),
                    SizedBox(
                      height: 25,
                    ),
                    headTitleAndViewAll(title: 'Popular'),
                    SizedBox(
                      height: 5,
                    ),
                    popularProducts(),
                    SizedBox(
                      height: 25,
                    ),
                    headTitleAndViewAll(title: 'Best Deals'),
                    SizedBox(
                      height: 25,
                    ),
                    bestDealProducts(),
                    SizedBox(
                      height: 25,
                    ),
                    headTitleAndViewAll(title: 'Suggestions'),
                    SizedBox(
                      height: 5,
                    ),
                    suggestionsProducts(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget bodyLoading() {
      return SizedBox();
    }

    Widget bodyError() {
      return SizedBox();
    }

    return Scaffold(
      body: bodyLoaded(),
    );
  }
}
