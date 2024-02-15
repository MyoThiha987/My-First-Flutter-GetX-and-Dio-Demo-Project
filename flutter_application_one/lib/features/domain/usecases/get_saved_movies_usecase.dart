import 'package:get/get.dart';

import '../../core/usecases/usecase.dart';
import '../entities/movie.dart';
import '../repository/movie_repository.dart';

class GetSavedMovieUseCase extends UseCase<List<MovieEntity>, void> {
  final MovieRepository repository = Get.find();
  GetSavedMovieUseCase();

  @override
  Future<List<MovieEntity>> call(void params) async{
    return repository.getLocalMovieList();
  }
}
