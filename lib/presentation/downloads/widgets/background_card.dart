import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/downloads/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
          children: [
            Container(
              width: double.infinity,
              height: 600,
              decoration: const BoxDecoration(
                image: DecorationImage(image: NetworkImage(kMainImage)),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CustomButtonWidget(
                      title: "My List",
                      icon: Icons.add,
                    ),
                    _PlayButton(),
                    const CustomButtonWidget(
                      icon: Icons.info,
                       title: "Info"),
                  ],
                ),
              ),
            )
          ],
        );
  }

    TextButton _PlayButton() {
    return TextButton.icon(
        onPressed: () {},
        style: ButtonStyle(
            // ignore: deprecated_member_use
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
            backgroundColor: WidgetStateProperty.all(kwhitecolor)),
        icon: const Icon(
          color: kblackcolor,
          Icons.play_arrow,
          size: 25,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Text(
            'Play',
            style: TextStyle(fontSize: 20, color: kblackcolor),
          ),
        ));
  }
}