import 'package:flutter/material.dart';
import 'package:netflix/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix/presentation/downloads/screen_downloads.dart';
import 'package:netflix/presentation/downloads/widgets/bottom_nav.dart';
import 'package:netflix/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
   ScreenMainPage({super.key});
   
   final pages=[
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    const Search(),
    ScreenDownloads()
   ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexchangenotifier,
           builder:(context, int index, _) {
          return pages[index];
        },),
      ),
          bottomNavigationBar: const BottomNavigationWidgets(),
      
      
    );
  }
}
