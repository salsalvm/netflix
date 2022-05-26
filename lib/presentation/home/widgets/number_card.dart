import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

class NumberCard extends StatelessWidget {
  final int index;
  const NumberCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 50,
              height: 100,
            ),
            Container(
              width: 130,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: kradius10,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBC66PwDNWzJCdgFz2vuHfQ-P6NaeSHKz6aA&usqp=CAU"),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 14,
          child: BorderedText(
            strokeWidth: 3.0,
            strokeColor: kWhiteColor,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: kBlackColor,
                fontSize: 140,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        )
      ],
    );
  }
}
