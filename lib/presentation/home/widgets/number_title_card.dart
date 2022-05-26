import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/number_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const MainTitle(title: "Top 10 Tv Shows In India Today"),
        LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) => NumberCard(index: index),
              ),
            )),
      ],
    );
  }
}
