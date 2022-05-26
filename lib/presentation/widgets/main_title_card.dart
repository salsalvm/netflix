import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  const MainTitleCard({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        MainTitle(title: title),
        LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) => MainCard(),
              ),
            )),
      ],
    );
  }
}
