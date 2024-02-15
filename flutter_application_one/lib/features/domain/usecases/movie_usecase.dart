import 'package:flutter_application_one/features/core/resources/data_state.dart';
import 'package:flutter_application_one/features/core/usecases/usecase.dart';
import 'package:flutter_application_one/features/domain/entities/movie.dart';
import 'package:flutter_application_one/features/domain/repository/movie_repository.dart';
import 'package:get/get.dart';

class MovieUseCase extends UseCase<DataState<List<MovieEntity>>, MovieParams> {
  final MovieRepository repository = Get.find();
  MovieUseCase();

  @override
  Future<DataState<List<MovieEntity>>> call(MovieParams params) {
    return repository.getLatestMovies(params.language, params.page);
  }
}

class MovieParams {
  final String language;
  final int page;

  MovieParams({required this.language, required this.page});
}
