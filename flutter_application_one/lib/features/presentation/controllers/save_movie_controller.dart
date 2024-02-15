import 'package:get/get.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_saved_movies_usecase.dart';
import '../../domain/usecases/save_movie_usecase.dart';
import '../../domain/usecases/delete_movie_usecase.dart';

class SaveMovieController extends GetxController {
  final SaveMovieUseCase saveMovieUseCase = Get.find();
  final DeletMovieUseCase deleteMovieUseCase = Get.find();
  final GetSavedMovieUseCase getSavedMovieUseCase = Get.find();

  RxList<MovieEntity> movies = RxList();

  SaveMovieController();

  Future<void> saveMovie(MovieEntity entity) async {
    await saveMovieUseCase.call(entity);
    movies.value = await getSavedMovieUseCase.call(null);
  }

  Future deleteMovie(MovieEntity entity) async {
    await deleteMovieUseCase.call(entity);
    movies.value = await getSavedMovieUseCase.call(null);
  }

  Future<void> fetchSavedMovies() async {
    movies.value = await getSavedMovieUseCase.call(null);
  }

  @override
  void onInit() {
    super.onInit();
    fetchSavedMovies();
  }
}
