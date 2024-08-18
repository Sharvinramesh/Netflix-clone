import 'package:flutter/material.dart';
import 'package:netflix/application/model/movie_model.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/downloads/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/downloads/widgets/video_widget.dart';

class ComingSoonwidget extends StatelessWidget {
  const ComingSoonwidget(
      {super.key,
      required this.movies,
      required this.index,
      required this.coming});
  final List movies;
  final int index;
  final Movie coming;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            height: 450,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(coming.releasedate,
                    style: TextStyle(
                        fontSize: 18, color: kwhitecolor.withOpacity(0.5))),
                // Text(
                //   '11',
                //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                // )
              ],
            ),
          ),
          SizedBox(
            width: size.width - 50,
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidget(
                  image: movies[index].imagepath,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Wrapping title in a Column to handle long titles
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Allow title to span maximum of 2 lines
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth:
                                size.width * 0.6, // Adjust width as needed
                          ),
                          child: Text(
                            coming.title,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Row(
                      children: [
                        CustomButtonWidget(
                          icon: Icons.circle_notifications,
                          title: "Remind me",
                          iconsize: 20,
                          textsize: 12,
                        ),
                        kWidth,
                        CustomButtonWidget(
                          icon: Icons.info,
                          title: "info",
                          iconsize: 20,
                          textsize: 12,
                        ),
                        kWidth
                      ],
                    ),
                  ],
                ),
                const Text("Coming on Friday"),
                kHeight,
                Text(
                  coming.title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Flexible(
                  child: Text(
                    coming.overview,
                    style: const TextStyle(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
