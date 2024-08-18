import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCard extends StatelessWidget {
   const MainCard({
    super.key,
    required this.image
  });

  final String image;

  @override
  Widget build(BuildContext context) {
     
     double screenwidth=MediaQuery.of(context).size.width;
     double screenheight=MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: screenwidth*.33,
      height: screenheight*65,
      decoration: BoxDecoration(
        borderRadius:kRadius10,
        image:DecorationImage(
          
          fit: BoxFit.cover,
          image: NetworkImage(imageBase+image))),
    );
  }
}