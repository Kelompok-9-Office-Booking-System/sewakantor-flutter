import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';

class CustomWidgetOfficeType extends StatelessWidget {
  final String? nameType;
  final String? countType;
  const CustomWidgetOfficeType({
    required this.nameType,
    required this.countType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.bookmark,
            color: primaryColorBlack,
            size: 20,
          ),
          Text(
            '${nameType}',
            style: primaryTextStyle.copyWith(
              fontSize: 13,
              fontWeight: medium,
              color: secondaryColorMischka,
            ),
          ),
          Text(
            ' ${countType}',
            style: primaryTextStyle.copyWith(
              fontSize: 13,
              fontWeight: medium,
              color: primaryColorBlack,
            ),
          ),
        ],
      ),
    );
  }
}
