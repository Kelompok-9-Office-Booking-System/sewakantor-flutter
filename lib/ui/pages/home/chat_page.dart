// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_text.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_chat_tile.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_text_form_field.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map> person = [
      {
        'imgProfile': 'assets/images/reviewer/reviewer1.jpeg',
        'nama': 'Jane Williamson',
        'msg':
            'Hello, my name is Lion as customer service. How can I help you? Hello, my name is Lion as customer service. How can I help you? ',
        'time': '11.59 PM',
        'num': '3',
      },
      {
        'imgProfile': 'assets/images/reviewer/reviewer2.jpeg',
        'nama': 'Micahael Louis',
        'msg': 'Good Places',
        'time': '09.24 AM',
        'num': '10',
      },
      {
        'imgProfile': 'assets/images/reviewer/reviewer3.jpeg',
        'nama': 'Perry Caty',
        'msg': 'I will book this room',
        'time': '08.29 AM',
        'num': '2',
      },
    ];

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
              'Chat',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            SizedBox(
              height: 20,
            ),
            for (var i = 0; i < person.length; i++)
              CustomChatTile(
                imgProfile: person[i]['imgProfile'],
                nama: person[i]['nama'],
                num: person[i]['num'],
                msg: person[i]['msg'],
                time: person[i]['time'],
              ),
          ],
        ),
      ),
    );
  }
}
