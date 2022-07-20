import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_text.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

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
              'Privacy Policy',
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

    String p1 =
        'At SewaKantor, accessible from SewaKantor.com, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by SewaKantor and how we use it. \n\n';
    String p2 =
        'If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us. \n\n';
    String p3 =
        'This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in SewaKantor. This policy is not applicable to any information collected offline or via channels other than this website. Our Privacy Policy was created with the help of the Free Privacy Policy Generator.';
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 35,
                right: 35,
              ),
              child: Text(
                '$p1$p2$p3',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: reguler,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 35,
                right: 35,
              ),
              child: CustomButtonText(
                text: 'Accept All Cookies',
                bgColor: primaryColorBlackRussian,
                onPrressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
