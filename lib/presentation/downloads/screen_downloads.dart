import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/downloads/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetList = [_smartDownloads(), Section2(), const Section3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppbarWidget(
            title: 'Downloads',
          ),
        ),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (ctx, index) => _widgetList[index],
            separatorBuilder: (ctx, index) => const SizedBox(
                  height: 25,
                ),
            itemCount: _widgetList.length));
  }
}

Row _smartDownloads() {
  return const Row(children: [
    Icon(
      Icons.settings,
      color: kwhitecolor,
    ),
    kWidth,
    Text('Smart downloads'),
  ]);
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    this.angle = 0,
    required this.margin,
    required this.imageList,
    required this.size,
    this.radius = 10,
  });

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  imageList,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});

  final List imageList = [
    "https://media.themoviedb.org/t/p/w440_and_h660_face/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
    "https://media.themoviedb.org/t/p/w440_and_h660_face/mWV2fNBkSTW67dIotVTXDYZhNBj.jpg",
    "https://media.themoviedb.org/t/p/w440_and_h660_face/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads for You',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kwhitecolor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Center(
            child: Text(
          "We'll download a personalised selection of \n movies and shows for you , so there's \n always something to watch on your \n device.",
          style: TextStyle(fontSize: 16, color: Colors.grey),
          textAlign: TextAlign.center,
        )),
        SizedBox(
            width: size.width,
            height: size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(.5),
                    radius: size.width * .4),
                DownloadsImageWidget(
                    margin: const EdgeInsets.only(left: 170, top: 50),
                    angle: 25,
                    size: Size(size.width * .35, size.width * .55),
                    imageList: imageList[0]),
                DownloadsImageWidget(
                    margin: const EdgeInsets.only(right: 170, top: 50),
                    angle: -20,
                    size: Size(size.width * .35, size.width * .55),
                    imageList: imageList[1]),
                DownloadsImageWidget(
                  radius: 8,
                  margin: const EdgeInsets.only(bottom: 40, top: 50),
                  size: Size(size.width * .4, size.width * .6),
                  imageList: imageList[2],
                )
              ],
            ))
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set Up',
                style: TextStyle(
                    color: kButtonColorWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton( 
          height: 46,  
          color: kButtonColorWhite,
          onPressed: () {},
          child: const Text(
            'see what you can download',
            style: TextStyle(
                color: kblackcolor, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
