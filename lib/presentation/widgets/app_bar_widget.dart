import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
          // style: GoogleFonts.montserrat().copyWith(fontSize: 10),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          size: 30,
          color: Colors.white,
        ),
        kWidth,
        Image.network(
          "https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png",
          width: 30,
          height: 30,
        ),
        kWidth
      ],
    );
  }
}
