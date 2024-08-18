
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/application/model/movie_model.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

const iamgeurl =
    'https://media.themoviedb.org/t/p/w500_and_h282_face/4X9PRfirfnia6i1mm3YsmOaCd3e.jpg';

class SearchIdleWidget extends StatelessWidget {
  final List<Movie> result;
  const SearchIdleWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Top Searches',
        ),
        kHeight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
              if (index<result.length) {
                return TopSearchItemTile(imageurl:result[index].imagepath,
                 nameMovie: result[index].title);
              }else{
                return const SizedBox.shrink();
              }
              },
              separatorBuilder: (ctx, index) => kheight20,
              itemCount: result.length),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String imageurl;
  final String nameMovie;
  const TopSearchItemTile(
      {super.key, required this.imageurl, required this.nameMovie});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * .35,
          height: 65,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageBase + imageurl),
                  fit: BoxFit.cover)),
        ),
        Expanded(
            child: Text(
          nameMovie,
          style: const TextStyle(
              color: kwhitecolor, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const CircleAvatar(
          backgroundColor: kwhitecolor,
          radius: 25,
          child: Center(
            child: Icon(CupertinoIcons.play_fill),
          ),
        )
      ],
    );
  }
}
