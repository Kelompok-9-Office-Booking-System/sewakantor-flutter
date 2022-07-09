// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/models/space_model.dart';
import 'package:sewakantor_flutter/shared/theme.dart';
import 'package:sewakantor_flutter/ui/pages/home/chat_page.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_card.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_card_reviews.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_widget_facilities.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_widget_nearby_places.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_widget_office_type.dart';

class DetailRoomPage extends StatelessWidget {
  const DetailRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as SpaceModel;

    print(arg);

    var id = arg.id;
    var name = arg.name;
    var thumbnail = arg.thumbnail;
    var description = arg.description;
    var address = arg.address;
    var unit = arg.unit;
    var rating = arg.rating;
    var price = arg.price;
    var types = arg.types;
    var facilities = arg.facilities;
    var nearbyPlaces = arg.nearbyPlaces;

    Widget titleAndRating() {
      return Row(
        children: [
          Expanded(
            child: Text(
              name!,
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
            '${rating}',
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
              '${address}',
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Wrap(
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            spacing: 5,
            children: [
              for (var i in types!)
                CustomWidgetOfficeType(
                  nameType: i.name.toString(),
                  countType: i.count.toString(),
                ),
            ],
          ),
          SizedBox(
            height: 7,
          ),
        ],
      );
    }

    Widget descriptionSection() {
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
            '${description}',
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
      List<String> officeTypeList = [
        'Office Room',
        'Coworking',
        'Virtual Room',
        'Meeting Room',
        'Meeting Room2',
        'Meeting Room3',
      ];
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
          for (var i = 0; i < facilities!.length + 1; i += 2)
            CustomWidgetFacilities(
                nameLeft: i + 1 > facilities.length ? null : facilities[i].name,
                iconLeft: i + 1 > facilities.length ? null : facilities[i].icon,
                nameRight:
                    i + 2 > facilities.length ? null : facilities[i + 1].name,
                iconRight:
                    i + 2 > facilities.length ? null : facilities[i + 1].icon)
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

    Widget nearbyPlacesSection() {
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
              for (var i in nearbyPlaces!)
                CustomWidgetNearbyPlaces(
                  name: i.name,
                  distance: i.distance,
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
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('${thumbnail}'),
                  fit: BoxFit.cover,
                ),
                // color: Colors.amber,
              ),
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
                  descriptionSection(),
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
                  nearbyPlacesSection(),
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
