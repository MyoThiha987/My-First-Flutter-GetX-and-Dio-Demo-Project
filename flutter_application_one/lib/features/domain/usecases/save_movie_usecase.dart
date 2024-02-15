import 'package:get/get.dart';

import '../../core/usecases/usecase.dart';
import '../entities/movie.dart';
import '../repository/movie_repository.dart';

class SaveMovieUseCase extends UseCase<void, MovieEntity> {
  final MovieRepository repository = Get.find();
  SaveMovieUseCase();

  @override
  Future<void> call(MovieEntity params) async {
    await repository.saveMovie(params);
  }
}
