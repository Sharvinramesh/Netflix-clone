import 'package:flutter/material.dart';
import 'package:netflix/presentation/downloads/widgets/main_card.dart';
import 'package:netflix/presentation/downloads/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key, required this.title, required this.movies});
    final String title;
    final List movies;

  @override
  Widget build(BuildContext context) {
    return Column( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         MainTitle(title:title),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children:List.generate(movies.length,(index)=>MainCard(image: movies[index].imagepath)) ,
          ),
        )
        
      ],
    );
  }
}