import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '404\nNot Found',
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
