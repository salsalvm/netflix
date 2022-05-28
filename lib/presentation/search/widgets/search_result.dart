import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/database/data.dart';
import 'package:netflix/domain/url/constant.dart';
import 'package:netflix/presentation/search/screen_search.dart';
import 'package:netflix/presentation/search/widgets/title.dart';


class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchTextTitle(title: 'Movies & Tv'),
            kHeight,
            Expanded(
                child: FutureBuilder(
                    future: DataBase().getSearchResult(searchResult.text),
                    builder: (BuildContext contex, AsyncSnapshot datas) =>
                        datas.data == null
                            ? const Center(child: CircularProgressIndicator())
                            : GridView.count(
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                shrinkWrap: true,
                                crossAxisCount: 3,
                                childAspectRatio: 1 / 1.4,
                                children: List.generate(
                                  10,
                                  (index) {
                                    return SearchCard(index: index, datas: datas);
                                  },
                                ))))
          ],
        ),
      ),
    );
  }
}

class SearchCard extends StatelessWidget {
  final int index;
  final datas;
  const SearchCard({Key? key, required this.index, required this.datas})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return datas.data == null
        ? const Center(child: CircularProgressIndicator())
        : Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        '$imageAppentUrl${datas.data[index].posterPath}'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(7)),
          );
  }
}
