// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_chat_tile.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_saved_tile.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

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
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.chevron_left,
                size: 30,
              ),
            ),
            Text(
              'Saved',
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            Container(
              child: Icon(
                null,
                size: 30,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: primaryColorWhisper,
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            SizedBox(
              height: 20,
            ),
            for (var i = 0; i < 8; i++) CustomSavedTile(),
          ],
        ),
      ),
    );
  }
}
