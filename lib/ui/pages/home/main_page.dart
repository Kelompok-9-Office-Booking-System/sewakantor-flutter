// ignore_for_file: prefer_const_constructors, dead_code

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sewakantor_flutter/providers/page_provider.dart';
import 'package:sewakantor_flutter/shared/theme.dart';
import 'package:sewakantor_flutter/ui/pages/home/saved_page.dart';
import 'package:sewakantor_flutter/ui/pages/home/chat_page.dart';
import 'package:sewakantor_flutter/ui/pages/home/home_page.dart';
import 'package:sewakantor_flutter/ui/pages/home/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);

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
            currentIndex: pageProvider.currentIndex,
            onTap: (value) {
              print(value);
              pageProvider.currentIndex = value;
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
                    'assets/icon/home_icon.png',
                    height: 50,
                    color: pageProvider.currentIndex == 0
                        ? primaryColorWhisper
                        : primaryColorNobel,
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
                    'assets/icon/saved_icon.png',
                    height: 50,
                    color: pageProvider.currentIndex == 1
                        ? primaryColorWhisper
                        : primaryColorNobel,
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
                    'assets/icon/chat_icon.png',
                    height: 50,
                    color: pageProvider.currentIndex == 2
                        ? primaryColorWhisper
                        : primaryColorNobel,
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
                    'assets/icon/profile_icon.png',
                    height: 50,
                    color: pageProvider.currentIndex == 3
                        ? primaryColorWhisper
                        : primaryColorNobel,
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return HomePage();
          break;

        case 1:
          return BookingPage();
          break;

        case 2:
          return ChatPage();
          break;

        case 3:
          return ProfilePage();
          break;

        default:
          return HomePage();
      }
    }

    return Scaffold(
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
