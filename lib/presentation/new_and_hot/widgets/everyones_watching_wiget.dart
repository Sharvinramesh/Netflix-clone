import 'package:flutter/material.dart';
import 'package:netflix/application/model/movie_model.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/downloads/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/downloads/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
    required this.movies,
    required this.index,
    required this.everyone,
  });

  final List movies;
  final int index;
  final Movie everyone;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          everyone.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kHeight,
        Text(
          everyone.overview,
          style: const TextStyle(color: kGreycolor),
        ),
        kheight50,
        VideoWidget(image: movies[index].imagepath),
        kHeight,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              icon: Icons.share,
              title: "Share",
              iconsize: 21,
              textsize: 16,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: "My List",
              iconsize: 25,
              textsize: 16,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: "Play",
              iconsize: 25,
              textsize: 16,
            ),
            kWidth
          ],
        )
      ],
    );
  }
}
