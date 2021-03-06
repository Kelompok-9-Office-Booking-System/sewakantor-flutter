// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sewakantor_flutter/models/space_model.dart';
import 'package:sewakantor_flutter/models/user_model.dart';
import 'package:sewakantor_flutter/providers/auth_provider.dart';
import 'package:sewakantor_flutter/providers/space_provider.dart';
import 'package:sewakantor_flutter/shared/theme.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_icon.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_select.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_text.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_card.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_text_form_field.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchSpaceController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      AuthProvider authProvider =
          Provider.of<AuthProvider>(context, listen: false);

      UserModel user = authProvider.user;
      print(user.email);
      print(user.token);

      await Provider.of<SpaceProvider>(context, listen: false).getSpacesFromAPI(
        name: "",
        token: user.token!,
      );
    });
  }

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
                            colorText: primaryColorWhite,
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
                          Text(
                            'Office Type',
                            style: primaryTextStyle.copyWith(
                              color: primaryColorWhite,
                              fontWeight: semiBold,
                              fontSize: 14,
                            ),
                          ),
                          Wrap(
                            spacing: 5,
                            children: [
                              for (var i in officeTypeList)
                                ChoiceChip(
                                  label: Text(i.toString()),
                                  selected: false,
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
                                'Capacity',
                                style: primaryTextStyle.copyWith(
                                  color: primaryColorWhite,
                                  fontWeight: semiBold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '${valuesCapacity.start.toInt()} - ${valuesCapacity.end.toInt()}',
                                style: primaryTextStyle.copyWith(
                                  color: primaryColorWhite,
                                  fontWeight: semiBold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          RangeSlider(
                            min: 0,
                            max: 1000,
                            values: valuesCapacity,
                            divisions: 10,
                            activeColor: primaryColorBlackRussian,
                            inactiveColor: primaryColorWhite,
                            onChanged: (value) {
                              print('START: ${value.start}, END: ${value.end}');
                              setState(() {
                                valuesCapacity = value;
                              });
                            },
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
                                'Rp ${valuesPrice.start.toInt()} - ${valuesPrice.end.toInt()}',
                                style: primaryTextStyle.copyWith(
                                  color: primaryColorWhite,
                                  fontWeight: semiBold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          RangeSlider(
                            min: 0,
                            max: 10000000,
                            values: valuesPrice,
                            divisions: 10,
                            activeColor: primaryColorBlackRussian,
                            inactiveColor: primaryColorWhite,
                            onChanged: (value) {
                              print('START: ${value.start}, END: ${value.end}');
                              setState(() {
                                valuesPrice = value;
                              });
                            },
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
                  );
                }),
              ),
            );
          });
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
            InkWell(
              onTap: () {
                print('masuk ke halaman pencarian');
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              child: Container(
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
                  enabled: false,
                  controller: searchSpaceController,
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
      SpaceProvider spaceProvider = Provider.of<SpaceProvider>(context);
      return Container(
        // color: Colors.red,
        margin: EdgeInsets.only(
          left: 35,
          // right: 35,
        ),
        height: 270,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: spaceProvider.spaces.length,
          itemBuilder: (context, index) {
            return CustomCard(
              space: spaceProvider.spaces[index],
              onTap: () {
                print(spaceProvider.spaces[index].name);
                Navigator.pushNamed(
                  context,
                  '/detail-room-page',
                  arguments: SpaceModel(
                    id: spaceProvider.spaces[index].id,
                    name: spaceProvider.spaces[index].name,
                    thumbnail: spaceProvider.spaces[index].thumbnail,
                    description: spaceProvider.spaces[index].description,
                    address: spaceProvider.spaces[index].address,
                    unit: spaceProvider.spaces[index].unit,
                    rating: spaceProvider.spaces[index].rating,
                    price: spaceProvider.spaces[index].price,
                    types: spaceProvider.spaces[index].types,
                    facilities: spaceProvider.spaces[index].facilities,
                    nearbyPlaces: spaceProvider.spaces[index].nearbyPlaces,
                  ),
                );
              },
            );
          },
        ),
      );
    }

    Widget bestDealProducts() {
      SpaceProvider spaceProvider = Provider.of<SpaceProvider>(context);
      return Container(
        margin: EdgeInsets.only(
          left: 35,
          right: 35,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < spaceProvider.spaces.length; i++)
              CustomTile(
                space: spaceProvider.spaces[i],
                onTap: () {
                  print(spaceProvider.spaces[i].name);
                  Navigator.pushNamed(
                    context,
                    '/detail-room-page',
                    arguments: SpaceModel(
                      id: spaceProvider.spaces[i].id,
                      name: spaceProvider.spaces[i].name,
                      thumbnail: spaceProvider.spaces[i].thumbnail,
                      description: spaceProvider.spaces[i].description,
                      address: spaceProvider.spaces[i].address,
                      unit: spaceProvider.spaces[i].unit,
                      rating: spaceProvider.spaces[i].rating,
                      price: spaceProvider.spaces[i].price,
                      types: spaceProvider.spaces[i].types,
                      facilities: spaceProvider.spaces[i].facilities,
                      nearbyPlaces: spaceProvider.spaces[i].nearbyPlaces,
                    ),
                  );
                },
              ),
          ],
        ),
      );
    }

    Widget suggestionsProducts() {
      SpaceProvider spaceProvider = Provider.of<SpaceProvider>(context);
      return Container(
        margin: EdgeInsets.only(
          left: 35,
          right: 35,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < spaceProvider.spaces.length; i++)
              CustomTile(
                space: spaceProvider.spaces[i],
                onTap: () {
                  print(spaceProvider.spaces[i].name);
                  Navigator.pushNamed(
                    context,
                    '/detail-room-page',
                    arguments: SpaceModel(
                      id: spaceProvider.spaces[i].id,
                      name: spaceProvider.spaces[i].name,
                      thumbnail: spaceProvider.spaces[i].thumbnail,
                      description: spaceProvider.spaces[i].description,
                      address: spaceProvider.spaces[i].address,
                      unit: spaceProvider.spaces[i].unit,
                      rating: spaceProvider.spaces[i].rating,
                      price: spaceProvider.spaces[i].price,
                      types: spaceProvider.spaces[i].types,
                      facilities: spaceProvider.spaces[i].facilities,
                      nearbyPlaces: spaceProvider.spaces[i].nearbyPlaces,
                    ),
                  );
                },
              ),
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
                      height: 5,
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

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    SpaceProvider spaceProvider = Provider.of<SpaceProvider>(context);
    List<SpaceModel> matchQuery = [];

    for (var spaceModel in spaceProvider.spaces) {
      if (spaceModel.name!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(spaceModel);
      }
    }

    return Container(
      margin: EdgeInsets.only(
        top: 20,
        left: 35,
        right: 35,
      ),
      child: matchQuery.isEmpty
          ? Column(
              children: [
                Lottie.asset('assets/icon/lottie-not-found-search.json'),
                Text(
                  'Data Not Found',
                  style: primaryTextStyle.copyWith(
                    fontSize: 28,
                    fontWeight: semiBold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          : ListView.builder(
              itemCount: matchQuery.length,
              itemBuilder: (context, index) {
                var result = matchQuery[index];
                print(result);
                return CustomTile(
                  space: result,
                  onTap: () {
                    print(result.name);
                    print(result);
                    print(matchQuery);
                    Navigator.pushNamed(
                      context,
                      '/detail-room-page',
                      arguments: SpaceModel(
                        id: result.id,
                        name: result.name,
                        thumbnail: result.thumbnail,
                        description: result.description,
                        address: result.address,
                        unit: result.unit,
                        rating: result.rating,
                        price: result.price,
                        types: result.types,
                        facilities: result.facilities,
                        nearbyPlaces: result.nearbyPlaces,
                      ),
                    );
                  },
                );
              },
            ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    SpaceProvider spaceProvider = Provider.of<SpaceProvider>(context);
    List<SpaceModel> matchQuery = [];

    for (var spaceModel in spaceProvider.spaces) {
      if (spaceModel.name!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(spaceModel);
      }
    }

    return Container(
      margin: EdgeInsets.only(
        top: 20,
        left: 35,
        right: 35,
      ),
      child: matchQuery.isEmpty
          ? Column(
              children: [
                Lottie.asset('assets/icon/lottie-not-found-search.json'),
                Text(
                  'Data Not Found',
                  style: primaryTextStyle.copyWith(
                    fontSize: 28,
                    fontWeight: semiBold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          : ListView.builder(
              itemCount: matchQuery.length,
              itemBuilder: (context, index) {
                var result = matchQuery[index];
                print(result);
                return CustomTile(
                  space: result,
                  onTap: () {
                    print(result.name);
                    print(result);
                    print(matchQuery);
                    Navigator.pushNamed(
                      context,
                      '/detail-room-page',
                      arguments: SpaceModel(
                        id: result.id,
                        name: result.name,
                        thumbnail: result.thumbnail,
                        description: result.description,
                        address: result.address,
                        unit: result.unit,
                        rating: result.rating,
                        price: result.price,
                        types: result.types,
                        facilities: result.facilities,
                        nearbyPlaces: result.nearbyPlaces,
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
