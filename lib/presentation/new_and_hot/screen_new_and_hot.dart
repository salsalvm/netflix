import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/new_and_hot/widgets/comingsoon_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/everyones_watch_widgets.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              title: const Text(
                'New & Hot',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              actions: [
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
              bottom: TabBar(
                isScrollable: true,
                indicator:
                    BoxDecoration(borderRadius: kradius30, color: kWhiteColor),
                unselectedLabelColor: kWhiteColor,
                labelColor: kBlackColor,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(text: "🍺 Coming Soon"),
                  Tab(
                    text: "👀 Everyone's Watching",
                  )
                ],
              ),
            ),
            preferredSize: const Size.fromHeight(90)),
        body: TabBarView(
          children: [_buildComingSoon(), _buildEveryonesWatching()],
        ),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: ((context, index) => const ComingSoonWidget()),
      itemCount: 10,
    );
  }

  Widget _buildEveryonesWatching() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemBuilder: (context, index) => const EveryonesWatchingWidget(),
        itemCount: 10,
      ),
    );
  }
}
