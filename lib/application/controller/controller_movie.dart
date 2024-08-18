import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:netflix/application/model/movie_model.dart';
import 'package:http/http.dart' as http;

class Movieservices {
  static const apikey = '8ea65528c3ec42aefc466300703cc877';

  static const baseurl = 'https://www.themoviedb.org/';

  static const nowPlaying =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=$apikey';

  static const upcoming =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey';

  static const popular =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=$apikey';

  static Future<List<Movie>> getNowplayingMovies() async {
    const int maxRetries = 3;
    int retrayCount = 0;

    while (retrayCount < maxRetries) {
      try {
        final response = await http.get(Uri.parse(nowPlaying));
        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body)['results'];

          return data.map((json) => Movie.fromJson(json)).toList();
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error fetching now playing movies:$e');
        }
      }
      retrayCount++;
    }
    return [];
  }

  static Future<List<Movie>> getUpcomingMovies() async {
    int maxRetries = 3;
    int retraycount = 0;

    while (retraycount < maxRetries) {
      try {
        final response = await http.get(Uri.parse(upcoming));
        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body)['results'];
          return data.map((json) => Movie.fromJson(json)).toList();
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error fetching now playing movies:$e');
        }
      }
      retraycount++;
    }
    return [];
  }

  static Future<List<Movie>> getpopularmovies() async {
    int maxRetries = 3;
    int retrayCount = 0;
    while (retrayCount < maxRetries) {
      try {
        final response = await http.get((Uri.parse(upcoming)));
        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body)['results'];
          return data.map((json) => Movie.fromJson(json)).toList();
        }
      } catch (e) {
        if (kDebugMode) {
          print('error fetching popularmovies');
        }
      }
      retrayCount++;
    }
    return [];
  }
}
