// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/models/space_model.dart';
import 'package:sewakantor_flutter/shared/theme.dart';
import 'package:sewakantor_flutter/ui/pages/home/chat_page.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_rectangle_icon.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_select.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_text.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_card.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_card_reviews.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_text_form_field.dart';
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

    Future<void> showFilterSearchScheduleTour() async {
      // print(dateRange);

      return showDialog(
          context: context,
          builder: (context) {
            DateTimeRange dateRange = DateTimeRange(
              start: DateTime(2022, 11, 5),
              end: DateTime(2022, 12, 24),
            );

            // Future pickDateRange() async {

            //       if (newDateRange == null) return;

            //       setStateDialog(() {
            //         dateRange = newDateRange;
            //       });
            //     }

            String tanggal_mulai = 'dd/mm/yyyy';
            String tanggal_berakhir = 'dd/mm/yyyy';

            int amountOfPeople = 1;

            RangeValues valuesCapacity = RangeValues(0, 1000);
            RangeValues valuesPrice = RangeValues(0, 10000000);

            List<String> officeTypeList = [
              'Office Room',
              'Coworking',
              'Virtual Room',
              'Meeting Room',
            ];

            return Container(
              // margin: EdgeInsets.all(20),
              width: double.infinity,
              child: Dialog(
                insetPadding: EdgeInsets.all(10),
                backgroundColor: primaryColorMidnightExpress,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: StatefulBuilder(builder: (context, setState) {
                  return SingleChildScrollView(
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
                                  'Schedule Tour',
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
                            title: 'Name',
                            colorTitle: primaryColorWhite,
                            colorBorder: primaryColorWhite,
                            colorHintText: primaryColorWhite.withOpacity(0.4),
                            hintText: 'Enter your name',
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          CustomTextFormField(
                            title: 'Name Company',
                            colorTitle: primaryColorWhite,
                            colorBorder: primaryColorWhite,
                            colorHintText: primaryColorWhite.withOpacity(0.4),
                            hintText: 'Enter your name company',
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          CustomTextFormField(
                            title: 'Email Company',
                            colorTitle: primaryColorWhite,
                            colorBorder: primaryColorWhite,
                            colorHintText: primaryColorWhite.withOpacity(0.4),
                            hintText: 'Enter your email company',
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          CustomTextFormField(
                            title: 'Phone Number',
                            colorTitle: primaryColorWhite,
                            colorBorder: primaryColorWhite,
                            colorHintText: primaryColorWhite.withOpacity(0.4),
                            hintText: 'Enter your phone number',
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
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'From',
                                    style: primaryTextStyle.copyWith(
                                      color: primaryColorWhite,
                                      fontWeight: medium,
                                      fontSize: 12,
                                    ),
                                  ),
                                  CustomButtonSelect(
                                    onTap: () async {
                                      DateTimeRange? newDateRange =
                                          await showDateRangePicker(
                                        context: context,
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100),
                                      );
                                      if (newDateRange != null) {
                                        setState(() {
                                          tanggal_mulai =
                                              '${newDateRange.start.day}/${newDateRange.start.month}/${newDateRange.start.year}';
                                          tanggal_berakhir =
                                              '${newDateRange.end.day}/${newDateRange.end.month}/${newDateRange.end.year}';
                                        });
                                      }
                                    },
                                    date: '${tanggal_mulai}',
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'To',
                                    style: primaryTextStyle.copyWith(
                                      color: primaryColorWhite,
                                      fontWeight: medium,
                                      fontSize: 12,
                                    ),
                                  ),
                                  CustomButtonSelect(
                                    onTap: () async {
                                      DateTimeRange? newDateRange =
                                          await showDateRangePicker(
                                        context: context,
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100),
                                      );
                                      if (newDateRange != null) {
                                        setState(() {
                                          tanggal_mulai =
                                              '${newDateRange.start.day}/${newDateRange.start.month}/${newDateRange.start.year}';
                                          tanggal_berakhir =
                                              '${newDateRange.end.day}/${newDateRange.end.month}/${newDateRange.end.year}';
                                        });
                                      }
                                    },
                                    date: '${tanggal_berakhir}',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Select Time',
                            style: primaryTextStyle.copyWith(
                              color: primaryColorWhite,
                              fontWeight: semiBold,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButtonSelect(
                                onTap: () async {},
                                date: '10.00 AM',
                              ),
                              CustomButtonSelect(
                                onTap: () async {},
                                date: 'Duration',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Space Type',
                                    style: primaryTextStyle.copyWith(
                                      color: primaryColorWhite,
                                      fontWeight: semiBold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  CustomButtonSelect(
                                    onTap: () async {},
                                    date: 'Meeting Room',
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Amount of People',
                                    style: primaryTextStyle.copyWith(
                                      color: primaryColorWhite,
                                      fontWeight: semiBold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomButtonRectangleIcon(
                                        icon: Icons.remove,
                                        bgColor: primaryColorBlackRussian,
                                        color: secondaryColorMischka,
                                        onTap: () {
                                          setState(
                                            () {
                                              amountOfPeople -= 1;
                                            },
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        '${amountOfPeople}',
                                        style: primaryTextStyle.copyWith(
                                          color: primaryColorWhite,
                                          fontWeight: semiBold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      CustomButtonRectangleIcon(
                                        icon: Icons.add,
                                        bgColor: secondaryColorMischka,
                                        color: primaryColorBlackRussian,
                                        onTap: () {
                                          setState(
                                            () {
                                              amountOfPeople += 1;
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          CustomButtonText(
                            text: 'Submit',
                            bgColor: primaryColorBlackRussian,
                            onPrressed: () {},
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            );
          });
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
                showFilterSearchScheduleTour();
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
