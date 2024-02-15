import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_one/features/core/resources/data_state.dart';
import 'package:flutter_application_one/features/data/data_sources/local/movie_entity.dart';
import 'package:flutter_application_one/features/data/data_sources/remote/movie_api_service.dart';
import 'package:flutter_application_one/features/domain/entities/movie.dart';
import 'package:flutter_application_one/features/domain/repository/movie_repository.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieApiService service = Get.find();
  final Box<MovieBox> box = Hive.box("movies");

  MovieRepositoryImpl();

  @override
  Future<DataState<List<MovieEntity>>> getLatestMovies(
      String language, int page) async {
    try {
      final respone = await service.getLatestMovies(language, page);

      if (respone.response.statusCode == HttpStatus.ok) {
        return DataSuccess(respone.data.results
                ?.map((e) => MovieEntity(
                    e.id,
                    e.original_title,
                    e.overview,
                    e.popularity,
                    e.release_date,
                    e.poster_path,
                    e.vote_average,
                    e.vote_count))
                .toList() ??
            List.empty());
      } else {
        return DataFailed(DioException(
            error: respone.response.statusMessage,
            response: respone.response,
            type: DioExceptionType.unknown,
            requestOptions: respone.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future deleteMovie(MovieEntity data) async {
    await box.delete(data.id);
  }

  @override
  Future<List<MovieEntity>> getLocalMovieList() async {
    final List<MovieEntity> entities = box.values
        .toList()
        .map((e) => MovieEntity(e.id, e.originalTitle, e.overview, e.popularity,
            e.releaseDate, e.posterPath, e.voteAverage, e.voteCount))
        .toList();

    return entities;
  }

  @override
  Future<void> saveMovie(MovieEntity data) async {
    box.put(
        data.id,
        MovieBox(
            id: data.id ?? 0,
            originalTitle: data.originalTitle ?? "",
            overview: data.overview ?? "",
            popularity: data.popularity ?? 0,
            posterPath: data.posterPath ?? "",
            releaseDate: data.releaseDate ?? "",
            voteAverage: data.voteAverage ?? 0,
            voteCount: data.voteCount ?? 0));
  }
}
