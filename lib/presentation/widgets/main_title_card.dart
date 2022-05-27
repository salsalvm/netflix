import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';
import 'package:netflix/server/database/data.dart';
import 'package:netflix/server/datamodel/result.dart';
import 'package:netflix/server/url/constant.dart';

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
        kHeight15,
        MainTitle(title: title),
        kHeight5,
        LimitedBox(
          maxHeight: 200,
          child: FutureBuilder(
            future: datasFrom(title),
            builder: (BuildContext context, AsyncSnapshot datas) =>
                datas.data == null
                    ?const Center(child: CircularProgressIndicator())
                    : ListView(
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          10,
                          (index) => MainCard(
                              image:
                                  '$imageAppentUrl${datas.data[index].posterPath}'),
                        ),
                      ),
          ),
        ),
      ],
    );
  }
}

Future<List<Result>> datasFrom(String title) async {
  if (title == 'Popular on Netflix') {
    return await DataBase().getPopular();
  } else if (title == 'Trending Now') {
    return await DataBase().getTrending();
  } else if (title == 'New Release') {
    return await DataBase().getUpComing();
  } else if (title == 'Released in the Past year') {
    return await DataBase().getLatestMovies();
  } else if (title == 'Us Movie') {
    return await DataBase().getNowPlaying();
  } else {
    return [];
  }
}
