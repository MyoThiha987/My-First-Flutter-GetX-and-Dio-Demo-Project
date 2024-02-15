import 'package:flutter_application_one/features/domain/entities/movie.dart';
import 'package:get/get.dart';

import '../../core/usecases/usecase.dart';
import '../repository/movie_repository.dart';

class DeletMovieUseCase extends UseCase<void, MovieEntity> {
  final MovieRepository repository = Get.find();
  DeletMovieUseCase();

  @override
  Future call(MovieEntity params) async {
     await repository.deleteMovie(params);
  }
}
