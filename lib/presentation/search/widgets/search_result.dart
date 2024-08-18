import 'package:flutter/material.dart';
import 'package:netflix/application/model/movie_model.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

const imageurl =
    "https://media.themoviedb.org/t/p/w440_and_h660_face/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg";

class SearchResultWidget extends StatelessWidget {
 final List<Movie>result;
  const SearchResultWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kHeight,
        Expanded(
            child: GridView.count(
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1 / 1.4,
          shrinkWrap: true,
          crossAxisCount: 3,
          children: List.generate(result.length, (index) {
            return  SearchMaincard(url:result[index].imagepath,);
          }),
        ))
      ],
    );
  }
}

class SearchMaincard extends StatelessWidget {
  final String?url;
  const SearchMaincard({super.key,  this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image:  DecorationImage(
              image: NetworkImage(imageBase+url!), fit: BoxFit.cover)),
    );
  }
}
