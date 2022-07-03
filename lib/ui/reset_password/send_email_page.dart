// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_text.dart';

class SendEmailPage extends StatelessWidget {
  const SendEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon/email_send_icon.png',
                height: 90,
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'Check your mail',
                style: primaryTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'We have sent a password recover instructions to your email.',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 14,
              ),
              CustomButtonText(
                text: 'Open Email App',
                onPrressed: () {
                  Future.delayed(Duration(seconds: 3), () async {
                    await Navigator.pushNamedAndRemoveUntil(
                        context, '/create-new-password-page', (route) => true);
                  });
                },
                bgColor: primaryColorBlackRussian,
              ),
              SizedBox(
                height: 14,
              ),
              CustomButtonText(
                text: 'Skip, I\'ll Confirm Later',
                onPrressed: () {},
                bgColor: primaryColorNobel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
