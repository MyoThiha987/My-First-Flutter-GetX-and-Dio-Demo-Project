import 'package:hive/hive.dart';

part 'movie_entity.g.dart';

@HiveType(typeId: 0)
class MovieBox extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String originalTitle;
  @HiveField(2)
  final String overview;
  @HiveField(3)
  final double popularity;
  @HiveField(4)
  final String posterPath;
  @HiveField(5)
  final String releaseDate;
  @HiveField(6)
  final double voteAverage;
  @HiveField(7)
  final int voteCount;

  MovieBox(
      {required this.id,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.voteAverage,
      required this.voteCount});
}