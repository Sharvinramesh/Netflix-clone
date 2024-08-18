import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:netflix/application/controller/controller_movie.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/everyones_watching_wiget.dart';

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  List upcomingmovies = [];
  List popularmovies = [];
  bool isloading = true;
  bool iserror = false;

  Future<void> upComingMovies() async {
    try {
      List movies = await Movieservices.getUpcomingMovies();
      List popular = await Movieservices.getpopularmovies();

      if (mounted) {
        setState(() {
          upcomingmovies = movies;
          popularmovies = popular;
          isloading = false;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching upcoming movies: $e');
      }
      if (mounted) {
        setState(() {
          iserror = true;
          isloading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    upComingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              title: const Text(
                "New & Hot",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                  size: 30,
                ),
                kWidth,
                Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://pbs.twimg.com/media/GB2vydcX0AAgt5f?format=png&name=360x360'))),
                ),
                kWidth,
              ],
              bottom: TabBar(
                dividerHeight: 0,
                unselectedLabelColor: kwhitecolor,
                isScrollable: true,
                labelColor: kblackcolor,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: kwhitecolor,
                  borderRadius: kRadius30,
                ),
                tabs: const [
                  Tab(
                    text: '🍿 Coming Soon',
                  ),
                  Tab(
                    text: "👀 Everyone's Watching",
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
              children: [_buildComingSoon(), _builEveryonesWatching()])),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
        itemCount: upcomingmovies.length,
        itemBuilder: (BuildContext context, index) => ComingSoonwidget(
              movies: upcomingmovies,
              index: index,
              coming: upcomingmovies[index],
            ));
  }

  Widget _builEveryonesWatching() {
    return ListView.builder(
      itemCount: upcomingmovies.length,
      itemBuilder: (BuildContext context, index) => EveryonesWatchingWidget(
        movies: upcomingmovies,
        index: index,
        everyone: popularmovies[index],
      ),
    );
  }
}
