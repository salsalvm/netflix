import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    children: const [
                      BackgroundCard(),
                      MainTitleCard(title: 'Released in the Past year'),
                      MainTitleCard(title: 'Trending Now'),
                      NumberTitleCard(),
                      MainTitleCard(title: 'Trends Dramas'),
                      MainTitleCard(title: 'South Indian Cinema')
                    ],
                  ),
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        height: 90,
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
                                Text(
                                  "Catogary",
                                  style: kHomeTitleText,
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
