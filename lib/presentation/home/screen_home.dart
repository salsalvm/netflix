import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/catogary.dart';
import 'package:netflix/presentation/home/widgets/info_with_card.dart';
import 'package:netflix/presentation/home/widgets/number_title_card.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: ((notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            }),
            child: Stack(
              children: [
                ListView(
                  children: const [
                    BackgroundCard(),
                    InfoCard(),
                    MainTitleCard(title: 'Popular on Netflix'),
                    MainTitleCard(title: 'Trending Now'),
                    MainTitleCard(title: 'New Release'),
                    NumberTitleCard(),
                    MainTitleCard(title: 'Released in the Past year'),
                    MainTitleCard(title: 'Us Movie')
                  ],
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        height: 108,
                        width: double.infinity,
                        color: Colors.black.withOpacity(0.3),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  "https://www.freepnglogos.com/uploads/netflix-logo-app-png-16.png",
                                  width: 60,
                                  height: 60,
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
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Tv Show",
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  "Movie",
                                  style: kHomeTitleText,
                                ),
                                Row(
                                  children: [
                                    LimitedBox(
                                        child: TextButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return const Categories();
                                            });
                                      },
                                      child: const Text(
                                        "Catogary",
                                        style: TextStyle(
                                            color: kWhiteColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                    const Icon(
                                      Icons.arrow_drop_down,
                                      color: kWhiteColor,
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : kHeight,
              ],
            ),
          );
        },
      ),
    );
  }
}
