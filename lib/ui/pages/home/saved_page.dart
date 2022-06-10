import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Saved Page',
          style: primaryTextStyle.copyWith(
            fontSize: 36,
            fontWeight: semiBold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
