import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class VedeoListItem extends StatelessWidget {
  final int index;
  const VedeoListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // left side
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.volume_off,
                        size: 30,
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                ),
                // right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          "https://m.media-amazon.com/images/M/MV5BMjIxMjgxNTk0MF5BMl5BanBnXkFtZTgwNjIyOTg2MDE@._V1_.jpg",
                        ),
                      ),
                    ),
                    VedeoActionWidget(icon: Icons.emoji_emotions, title: 'LOL'),
                    VedeoActionWidget(icon: Icons.add, title: 'My List'),
                    VedeoActionWidget(icon: Icons.share, title: 'Share'),
                    VedeoActionWidget(icon: Icons.play_arrow, title: 'Play'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VedeoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VedeoActionWidget({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(color: kWhiteColor, fontSize: 16),
          )
        ],
      ),
    );
  }
}
