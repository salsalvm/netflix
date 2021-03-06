import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/url/constant.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';


class EveryonesWatchingWidget extends StatelessWidget {
  final int index;
  AsyncSnapshot datas;
  EveryonesWatchingWidget({
    required this.datas,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          '${datas.data[index].title}',
          maxLines: 4,
          style: const TextStyle(
              fontSize: 20,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.bold,
              color: kWhiteColor),
        ),
        kHeight,
        Text(
          '${datas.data[index].overView}',
          style: const TextStyle(color: kGreyColor),
        ),
        kHeight50,
        VideoWidget(image: '$imageAppentUrl${datas.data[index].posterPath}'),
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
