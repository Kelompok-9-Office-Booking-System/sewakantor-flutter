// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';
import 'package:sewakantor_flutter/ui/pages/home/chat_page.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_card.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_card_reviews.dart';

class DetailRoomPage extends StatelessWidget {
  const DetailRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleAndRating() {
      return Row(
        children: [
          Expanded(
            child: Text(
              'BCA Tower',
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
                color: primaryColorBlack,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
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
      );
    }

    Widget iconAndLocation() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.location_on,
            color: primaryColorBlack,
            size: 30,
          ),
          Expanded(
            child: Text(
              '50/F, Menara BCA Grand Indonesia, Jakarta, 10310 50/F, Menara BCA Grand Indonesia, Jakarta, 10310',
              style: primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
                color: primaryColorBlack.withOpacity(0.7),
              ),
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      );
    }

    Widget officeTypeAndDetail() {
      return Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.maps_home_work,
                color: primaryColorBlack,
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Office Type',
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                  color: primaryColorBlack,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.bookmark,
                    color: primaryColorBlack,
                    size: 20,
                  ),
                  Text(
                    'Private Office ',
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: medium,
                      color: secondaryColorMischka,
                    ),
                  ),
                  Text(
                    '143',
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: medium,
                      color: primaryColorBlack,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.bookmark,
                    color: primaryColorBlack,
                    size: 20,
                  ),
                  Text(
                    'Coworking ',
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: medium,
                      color: secondaryColorMischka,
                    ),
                  ),
                  Text(
                    '34',
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: medium,
                      color: primaryColorBlack,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.bookmark,
                color: primaryColorBlack,
                size: 20,
              ),
              Text(
                'Meeting Room ',
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                  color: secondaryColorMischka,
                ),
              ),
              Text(
                '5',
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                  color: primaryColorBlack,
                ),
              ),
            ],
          ),
        ],
      );
    }

    Widget description() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: primaryTextStyle.copyWith(
              fontSize: 14,
              fontWeight: semiBold,
              color: primaryColorBlack,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Enjoy stunning views from the 50th floor of BCA Tower, located across the street from the famous Bundaran Hotel Indonesia (Bundaran HI). Widely regarded as the centre of Jakarta, the area offers excellent public transport and a supportive business environment.',
            style: primaryTextStyle.copyWith(
              fontSize: 14,
              fontWeight: semiBold,
              color: primaryColorBlack.withOpacity(0.7),
            ),
            maxLines: 7,
          ),
        ],
      );
    }

    Widget facilitiesSection() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Facilities',
            style: primaryTextStyle.copyWith(
              fontSize: 14,
              fontWeight: semiBold,
              color: primaryColorBlack,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.meeting_room_outlined,
                    color: primaryColorBlack,
                    size: 24,
                  ),
                  Text(
                    'Meeting Room',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      color: primaryColorBlack,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.car_rental_outlined,
                    color: primaryColorBlack,
                    size: 24,
                  ),
                  Text(
                    'Meeting Room',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      color: primaryColorBlack,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.bookmark,
                    color: primaryColorBlack,
                    size: 24,
                  ),
                  Text(
                    'Meeting Room',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      color: primaryColorBlack,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.bookmark,
                    color: primaryColorBlack,
                    size: 24,
                  ),
                  Text(
                    'Meeting Room',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      color: primaryColorBlack,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.bookmark,
                    color: primaryColorBlack,
                    size: 24,
                  ),
                  Text(
                    'Meeting Room',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      color: primaryColorBlack,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.bookmark,
                    color: primaryColorBlack,
                    size: 24,
                  ),
                  Text(
                    'Meeting Room',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      color: primaryColorBlack,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 7,
          ),
        ],
      );
    }

    Widget roomPlan() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Room Plan',
            style: primaryTextStyle.copyWith(
              fontSize: 14,
              fontWeight: semiBold,
              color: primaryColorBlack,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            color: primaryColorGrey,
            width: double.infinity,
            height: 180,
          ),
        ],
      );
    }

    Widget locationMap() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location',
            style: primaryTextStyle.copyWith(
              fontSize: 14,
              fontWeight: semiBold,
              color: primaryColorBlack,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            color: primaryColorGrey,
            width: double.infinity,
            height: 160,
          ),
        ],
      );
    }

    Widget nearbyPlaces() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: primaryColorBlack,
                size: 24,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Nearby Places',
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                  color: primaryColorBlack,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.stadium,
                    color: primaryColorBlack,
                    size: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      'Gelora Bung Karno Stadium',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: reguler,
                        color: primaryColorBlack,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '0.1 km',
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: reguler,
                      color: primaryColorBlack,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(
                    Icons.stadium,
                    color: primaryColorBlack,
                    size: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      'Gelora Bung Karno Stadium',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: reguler,
                        color: primaryColorBlack,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '0.1 km',
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: reguler,
                      color: primaryColorBlack,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(
                    Icons.stadium,
                    color: primaryColorBlack,
                    size: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      'Gelora Bung Karno Stadium',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: reguler,
                        color: primaryColorBlack,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '0.1 km',
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: reguler,
                      color: primaryColorBlack,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ],
      );
    }

    Widget ourReviewsAndCard() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our Reviews',
              style: primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
                color: primaryColorBlack,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CustomCardReviews();
                },
              ),
            )
          ],
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            // currentIndex: ,
            onTap: (value) {
              print(value);
              if (value == 0) {
                showAboutDialog(context: context);
              } else if (value == 1) {
                Navigator.pushNamed(
                  context,
                  '/chat-page',
                );
              }
            },
            backgroundColor: primaryColorMidnightExpress,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false, // <-- HERE
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 5,
                  ),
                  child: Image.asset(
                    'assets/icon/schedule_tour_icon.png',
                    height: 50,
                    color: primaryColorNobel,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 5,
                  ),
                  child: Image.asset(
                    'assets/icon/contact_us_icon.png',
                    height: 50,
                    color: primaryColorNobel,
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              color: Colors.amber,
              padding: EdgeInsets.only(
                left: 30,
                top: 45,
                right: 30,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        // padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.5,
                            color: primaryColorBlackRussian,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Icon(
                          Icons.chevron_left,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        print('Share');
                      },
                      child: Container(
                        // padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.5,
                            color: primaryColorBlackRussian,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Icon(
                          Icons.share,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 380),
              padding: EdgeInsets.only(
                left: 30,
                top: 20,
                right: 30,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleAndRating(),
                  SizedBox(
                    height: 18,
                  ),
                  iconAndLocation(),
                  SizedBox(
                    height: 40,
                  ),
                  officeTypeAndDetail(),
                  SizedBox(
                    height: 30,
                  ),
                  description(),
                  SizedBox(
                    height: 30,
                  ),
                  facilitiesSection(),
                  SizedBox(
                    height: 30,
                  ),
                  roomPlan(),
                  SizedBox(
                    height: 30,
                  ),
                  locationMap(),
                  SizedBox(
                    height: 8,
                  ),
                  nearbyPlaces(),
                  SizedBox(
                    height: 30,
                  ),
                  ourReviewsAndCard(),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: customBottomNav(),
    );
  }
}
