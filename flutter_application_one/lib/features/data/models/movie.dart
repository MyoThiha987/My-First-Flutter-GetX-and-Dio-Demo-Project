import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class MovieModel {
  int? id;
  String? original_title;
  String? overview;
  double? popularity;
  String? poster_path;
  String? release_date;
  double? vote_average;
  int? vote_count;

  MovieModel(this.id, this.original_title, this.overview, this.popularity,
      this.release_date, this.poster_path, this.vote_average, this.vote_count);

      factory MovieModel.fromJson(Map<String,dynamic> json) => _$MovieModelFromJson(json);
      Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
