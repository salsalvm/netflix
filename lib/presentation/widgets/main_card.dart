import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCard extends StatelessWidget {
  final String image;
  const MainCard({
    Key? key,required this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 10),
      width: 140,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kradius10,
        image:  DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
       image,
          ),
        ),
      ),
    );
  }
}
