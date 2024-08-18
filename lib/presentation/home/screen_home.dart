import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/application/controller/controller_movie.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/downloads/widgets/background_card.dart';
import 'package:netflix/presentation/downloads/widgets/main_title_card.dart';
import 'package:netflix/presentation/downloads/widgets/number_title_card.dart';

ValueNotifier<bool> scrollnotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List popular = [];
  List toprated = [];
  List nowplaying = [];
  List upcoming = [];
  List clone = [];
  Future getallmovies() async {
    popular = await Movieservices.getpopularmovies();
    nowplaying = await Movieservices.getNowplayingMovies();
    upcoming = await Movieservices.getUpcomingMovies();
    clone = await Movieservices.getNowplayingMovies();
    setState(() {});
  }

  @override
  void initState() {
    getallmovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollnotifier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (UserScrollNotification notification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    scrollnotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollnotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        const BackgroundCard(),
                        MainTitleCard(
                          title: 'Released in the past year',
                          movies: upcoming,
                        ),
                        kHeight,
                        MainTitleCard(
                          title: 'Trending Now',
                          movies: popular,
                        ),
                        kHeight,
                        NumberTitleCard(
                          movies: upcoming,
                        ),
                        kHeight,
                        MainTitleCard(
                          title: 'Tense Dramas',
                          movies: upcoming,
                        ),
                        kHeight,
                        MainTitleCard(
                          title: 'South Indian cinema',
                          movies: clone,
                        ),
                        kHeight,
                      ],
                    ),
                    scrollnotifier.value == true
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 1000),
                            width: double.infinity,
                            height: 95,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: const Image(
                                        image: NetworkImage(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGZhYUrmk6vDmi1-Pj7oI-HzTpQDCi9-IFTA&s'),
                                        height: 55,
                                        width: 55,
                                      ),
                                    ),
                                    const Spacer(),
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
                                                  'https://pbs.twimg.com/media/GB2vydcX0AAgt5f?format=png&name=360x360'),
                                              fit: BoxFit.cover)),
                                    )
                                  ],
                                ),
                                kHeight,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('TV Shows', style: kHometitletext),
                                    Text('Movies', style: kHometitletext),
                                    Text('Categories', style: kHometitletext),
                                  ],
                                )
                              ],
                            ),
                          )
                        : kHeight
                  ],
                ),
              );
            }));
  }
}
