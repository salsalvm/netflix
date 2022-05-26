import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class InfoCard extends StatelessWidget {
  final String title;
  const InfoCard({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight20,
        MainTitle(title: title),kHeight5,
        LimitedBox(
          maxHeight: 240,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 140,
                    height: 190,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://m.media-amazon.com/images/M/MV5BYzUwYWE5ZDAtYWMxZi00NmQ4LTkyMWMtMjk2MzQ5YzI1NDhmXkEyXkFqcGdeQXVyMTA3MDk2NDg2._V1_.jpg",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(10)),
                        color: Colors.grey.withOpacity(.3)),
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 140,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [Icon(Icons.info_outline,size: 30, color: kWhiteColor,), Icon(Icons.more_vert,color: kWhiteColor,size: 30,)],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
