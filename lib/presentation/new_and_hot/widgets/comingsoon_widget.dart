import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';
import 'package:netflix/server/database/data.dart';
import 'package:netflix/server/url/constant.dart';

class ComingSoonWidget extends StatelessWidget {
  final int index;
  const ComingSoonWidget({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: DataBase().getUpComing(),
      builder: (BuildContext context, AsyncSnapshot datas) => datas.data == null
          ? const Center(child: CircularProgressIndicator())
          : Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${date[index]}',
                        style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: kGreyColor),
                      ),
                      Text(
                        '${day[index]}',
                        style:const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width - 50,
                  height: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VideoWidget(
                          image:
                              '$imageAppentUrl${datas.data[index].posterPath}'),
                      Row(
                        children: [
                          Text(
                            '${datas.data[index].title}'.split(' ').first,
                            maxLines: 1,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                letterSpacing: -5,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Row(
                            children: const [
                              CustomButtonWidget(
                                iconSize: 20,
                                icon: Icons.notification_important,
                                title: "Remaind me",
                                textSize: 10,
                              ),
                              kWidth,
                              CustomButtonWidget(
                                  iconSize: 20,
                                  textSize: 10,
                                  icon: Icons.info,
                                  title: "Info"),
                              kWidth
                            ],
                          )
                        ],
                      ),
                      kHeight,
                      Text(
                        'Comming on ${date[index]}  ${day[index]}',
                        style: TextStyle(color: Colors.grey[200]),
                      ),
                      kHeight,
                      Text(
                        '${datas.data[index].title}',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kWhiteColor),
                      ),
                      kHeight,
                      Text('${datas.data[index].overView}',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style:const TextStyle(color: kGreyColor))
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

List date = [
  'Mar',
  "Jul",
  'Mar',
  "May",
  'Jan',
  "Oct",
  'Feb',
  "Dec",
  'Dec',
  "Jan"
];
List day = ['11', "24", '31', "14", '09', "06", 'Feb', "10", '01', "26"];
