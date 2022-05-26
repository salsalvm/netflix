import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'FEB',
                style: TextStyle(fontSize: 18, color: kGreyColor),
              ),
              Text(
                '11',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VideoWidget(),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Tall Girl 2",
                    style: TextStyle(
                        letterSpacing: -4,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      CustomButtonWidget(
                        iconSize: 20,
                        icon: Icons.notification_important,
                        title: "Remaind me",
                        textSize: 10,
                      ),
                      kWidth,
                      CustomButtonWidget(
                          iconSize: 20,
                          textSize: 10,
                          icon: Icons.info,
                          title: "Info"),
                      kWidth
                    ],
                  )
                ],
              ),
              kHeight,
              const Text("Coming on Friday"),
              kHeight,
              const Text(
                "Tall Girl 2",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kGreyColor),
              ),
              kHeight,
              const Text(
                "Landing the lead in the school musical is a dream come true for Jodi, until the pressure sends her confidence- and her relationship into a tailspin",
                style: TextStyle(color: kGreyColor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
