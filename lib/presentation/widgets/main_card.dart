import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 140,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kradius10,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            "https://m.media-amazon.com/images/M/MV5BYzUwYWE5ZDAtYWMxZi00NmQ4LTkyMWMtMjk2MzQ5YzI1NDhmXkEyXkFqcGdeQXVyMTA3MDk2NDg2._V1_.jpg",
          ),
        ),
      ),
    );
  }
}
