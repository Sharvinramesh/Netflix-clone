class Movie {
  final int id;
  final String title;
  final String imagepath;
  final String overview;
  final String releasedate;

  Movie(
      {required this.id,
      required this.title,
      required this.imagepath,
      required this.overview,
      required this.releasedate});

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
      id: json['id'],
      title: json['title'],
      imagepath: json['poster_path'],
      overview: json['overview'],
      releasedate: json['release_date']);
}
