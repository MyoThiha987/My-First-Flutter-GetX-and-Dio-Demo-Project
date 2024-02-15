import 'package:flutter_application_one/features/presentation/controllers/save_movie_controller.dart';
import 'package:get/get.dart';
import '../domain/usecases/delete_movie_usecase.dart';
import '../domain/usecases/get_saved_movies_usecase.dart';
import '../domain/usecases/save_movie_usecase.dart';

class SaveMovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SaveMovieUseCase());
    Get.put(DeletMovieUseCase());
    Get.put(GetSavedMovieUseCase());
    Get.put(SaveMovieController());
  }
}
