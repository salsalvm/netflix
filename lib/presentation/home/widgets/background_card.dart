import 'package:flutter/material.dart';

import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/domain/database/data.dart';
import 'package:netflix/domain/url/constant.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';


class BackgroundCard extends StatelessWidget {
  const BackgroundCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DataBase().getLatestMovies(),
      builder: ((BuildContext context, AsyncSnapshot datas) =>
          datas.data == null
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 510,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            '$imageAppentUrl${datas.data[0].posterPath}',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const CustomButtonWidget(
                                icon: Icons.add, title: 'My List'),
                            _playButton(),
                            const CustomButtonWidget(
                                icon: Icons.info, title: 'Info')
                          ],
                        ),
                      ),
                    )
                  ],
                )),
    );
  }
}

TextButton _playButton() {
  return TextButton.icon(
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kWhiteColor)),
    onPressed: () {},
    icon: const Icon(
      Icons.play_arrow,
      color: kBlackColor,
      size: 30,
    ),
    label: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        'Play',
        style: TextStyle(
            fontSize: 20, color: kBlackColor, fontWeight: FontWeight.w500),
      ),
    ),
  );
}
