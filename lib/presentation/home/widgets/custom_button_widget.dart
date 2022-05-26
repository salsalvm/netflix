import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final IconData icon;
  final double textSize;
  final String title;
  final double iconSize;
  const CustomButtonWidget(
      {Key? key,
      required this.icon,
      required this.title,
      this.iconSize = 30,
      this.textSize = 18})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(fontSize: textSize),
        ),
      ],
    );
  }
}
