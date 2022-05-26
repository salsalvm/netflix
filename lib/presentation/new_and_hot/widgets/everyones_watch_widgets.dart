import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const Text(
          "Friends",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: kWhiteColor),
        ),
        kHeight,
        const Text(
          "This hit sitcom follows the merry misadventures of six 20-something pals as they navigate the pitfalls of work, life and love in 1990s Manhattan.",
          style: TextStyle(color: kGreyColor),
        ),
        kHeight50,
        const VideoWidget(),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonWidget(
                iconSize: 25, textSize: 16, icon: Icons.share, title: "Share"),
            kWidth,
            CustomButtonWidget(
                iconSize: 25, textSize: 16, icon: Icons.add, title: "My List"),
            kWidth,
            CustomButtonWidget(
                iconSize: 25,
                textSize: 16,
                icon: Icons.play_arrow,
                title: "Play"),
            kWidth
          ],
        )
      ],
    );
  }
}
