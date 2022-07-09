import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';

class CustomWidgetNearbyPlaces extends StatelessWidget {
  final String? name;
  final String? distance;
  const CustomWidgetNearbyPlaces({
    required this.name,
    required this.distance,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.stadium,
              color: primaryColorBlack,
              size: 30,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                name!,
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: reguler,
                  color: primaryColorBlack,
                ),
                maxLines: 1,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              distance!,
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                fontWeight: reguler,
                color: primaryColorBlack,
              ),
              maxLines: 1,
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
