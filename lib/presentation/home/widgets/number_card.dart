import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/server/url/constant.dart';

class NumberCard extends StatelessWidget {
  final int index;
  AsyncSnapshot datas;
  NumberCard({Key? key, required this.index, required this.datas})
      : super(key: key);

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
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      '$imageAppentUrl${datas.data[index].posterPath}'),
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
