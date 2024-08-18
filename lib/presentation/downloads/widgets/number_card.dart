import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.image});
  final int index;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
              ),
            Container(
              width: 130,
              height: 200,
              decoration: BoxDecoration(
                borderRadius:kRadius10,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageBase+image))),                 
            ),
          ],
        ),
        Positioned(
          left: 13,
          bottom: -45,
          child: BorderedText(
            strokeColor: Colors.white,
           strokeWidth:10.0,
            child:Text('${index+1}',
            style:const TextStyle(
              fontSize:140,
              color: kblackcolor,
              decoration: TextDecoration.none,
              decorationColor:Colors.black))))
      ],
    );
  }
}