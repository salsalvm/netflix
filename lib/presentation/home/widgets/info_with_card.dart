import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/main_title.dart';
import 'package:netflix/server/database/data.dart';
import 'package:netflix/server/url/constant.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight15,
        const MainTitle(title: 'Continue Watching'),
        kHeight5,
        LimitedBox(
          maxHeight: 240,
          child: FutureBuilder(
              future: DataBase().getNowPlaying(),
              builder: ((BuildContext context, AsyncSnapshot datas) => datas
                          .data ==
                      null
                  ? CircularProgressIndicator()
                  : ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        datas.data!.length,
                        (index) => Column(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: 140,
                              height: 190,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(10)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    '$imageAppentUrl${datas.data[index].posterPath}',
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
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: 140,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Icon(
                                      Icons.info_outline,
                                      size: 30,
                                      color: kWhiteColor,
                                    ),
                                    Icon(
                                      Icons.more_vert,
                                      color: kWhiteColor,
                                      size: 30,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ))),
        ),
      ],
    );
  }
}
