import 'package:flutter_application_one/features/data/models/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  int? page;
  int? total_pages;
  String? message;
  List<MovieModel>? results;

  MovieResponse({this.page, this.total_pages, this.message, this.results});

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}
