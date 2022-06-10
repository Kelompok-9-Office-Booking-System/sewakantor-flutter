import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Chat Page',
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
