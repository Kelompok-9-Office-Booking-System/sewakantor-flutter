// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_icon.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_icon_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 40,
        top: 70,
        right: 40,
      ),
      child: Column(
        children: [
          Container(
            // color: Colors.red,
            width: 150,
            height: 150,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: InkWell(
                    onTap: () {
                      print('edit foto');
                    },
                    child: Icon(
                      Icons.border_color_outlined,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Wade Warren',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  'willie.jennings@example.com',
                  style: primaryTextStyle.copyWith(
                    color: primaryColorNobel,
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          CustomButtonIconText(
            text: 'Personal Information',
            imageAsset:
                'assets/icon/profile_page/icon_personal_information.png',
            onPrressed: () {
              Navigator.pushNamed(
                context,
                '/personal-information-page',
              );
              print('personal information');
            },
          ),
          SizedBox(height: 15),
          CustomButtonIconText(
            text: 'Privicy Policy',
            imageAsset: 'assets/icon/profile_page/icon_privacy_policy.png',
            onPrressed: () {
              Navigator.pushNamed(
                context,
                '/not-found-page',
              );
              print('privacy policy');
            },
          ),
          SizedBox(height: 15),
          CustomButtonIconText(
            text: 'Logout',
            imageAsset: 'assets/icon/profile_page/icon_logout.png',
            onPrressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login-page', (route) => false);
              print('logout');
            },
          ),
        ],
      ),
    );
  }
}
