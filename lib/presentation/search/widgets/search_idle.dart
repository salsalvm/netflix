import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/database/data.dart';
import 'package:netflix/domain/url/constant.dart';
import 'package:netflix/presentation/search/widgets/title.dart';


class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Top Searches'),
        kHeight,
        Expanded(
          child: FutureBuilder(
            future: DataBase().getTop10(),
            builder: (BuildContext context, AsyncSnapshot datas) =>
                datas.data == null
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            TopSearchItemTile(index: index, datas: datas),
                        separatorBuilder: (context, index) => kHeight20,
                        itemCount: 10),
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final int index;
  AsyncSnapshot datas;
  TopSearchItemTile({Key? key, required this.index, required this.datas})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.36,
          height: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: NetworkImage(
                    '$imageAppentUrl${datas.data[index].posterPath}'),
                fit: BoxFit.cover),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              '${datas.data[index].title}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kWhiteColor,
          radius: 23,
          child: CircleAvatar(
            backgroundColor: kBlackColor,
            radius: 21,
            child: Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Icon(
                CupertinoIcons.play_fill,
                color: kWhiteColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
