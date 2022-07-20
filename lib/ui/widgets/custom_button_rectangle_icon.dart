import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/shared/theme.dart';

class CustomButtonRectangleIcon extends StatelessWidget {
  final IconData? icon;
  final Color? bgColor;
  final Color? color;
  final GestureTapCallback? onTap;
  const CustomButtonRectangleIcon({
    required this.icon,
    required this.bgColor,
    required this.color,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          color: bgColor,
        ),
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
