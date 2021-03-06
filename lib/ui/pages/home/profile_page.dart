// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sewakantor_flutter/models/user_model.dart';
import 'package:sewakantor_flutter/providers/auth_provider.dart';
import 'package:sewakantor_flutter/providers/page_provider.dart';
import 'package:sewakantor_flutter/shared/theme.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_icon.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_icon_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();

    Provider.of<AuthProvider>(context, listen: false).getUserActiveLocal();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    UserModel user = authProvider.user;
    print(user.email);
    print(user.role);
    print(user.roleId);
    print(user.firstName);
    print(user.lastName);
    print(user.phoneNumber);

    handleSignOut() async {
      if (await authProvider.signOut()) {
        // Navigator.pushNamed(context, '/sign-in');
        Navigator.pushNamedAndRemoveUntil(
            context, '/login-page', (route) => false);
        pageProvider.currentIndex = 0;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Gagal Logout',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      // note : hanya untuk navigasi sementara
      await Navigator.pushNamedAndRemoveUntil(
          context, '/login-page', (route) => false);
    }

    return SingleChildScrollView(
      child: Container(
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
                    '${user.firstName} ${user.lastName}',
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
                    '${user.email}',
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
              text: 'Account Settings',
              imageAsset: 'assets/icon/profile_page/icon_account_settings.png',
              onPrressed: () {
                print('account settings');
              },
            ),
            SizedBox(height: 15),
            CustomButtonIconText(
              text: 'My Review',
              imageAsset: 'assets/icon/profile_page/icon_my_review.png',
              onPrressed: () {
                print('my review');
              },
            ),
            SizedBox(height: 15),
            CustomButtonIconText(
              text: 'Privicy Policy',
              imageAsset: 'assets/icon/profile_page/icon_privacy_policy.png',
              onPrressed: () {
                Navigator.pushNamed(
                  context,
                  '/privacy-policy-page',
                );
                print('privacy policy');
              },
            ),
            SizedBox(height: 15),
            CustomButtonIconText(
              text: 'Logout',
              imageAsset: 'assets/icon/profile_page/icon_logout.png',
              onPrressed: () {
                handleSignOut();
                print('logout');
              },
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
