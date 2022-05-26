import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

const imageUrl =
    "https://www.newsbugz.com/wp-content/uploads/2020/08/Cold-Nights-Songs-scaled.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & Tv'),
        kHeight,
        Expanded(
            child: GridView.count(
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.4,
                children: List.generate(
                  20,
                  (index) {
                    return const SearchCard();
                  },
                )))
      ],
    );
  }
}

class SearchCard extends StatelessWidget {
  const SearchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: NetworkImage(imageUrl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
