import 'package:flutter_application_one/features/core/resources/data_state.dart';
import 'package:flutter_application_one/features/domain/entities/movie.dart';
import 'package:flutter_application_one/features/domain/usecases/movie_usecase.dart';
import 'package:get/get.dart';

class MovieController extends GetxController {
  final MovieUseCase useCase = Get.find();

  RxList<MovieEntity> movies = RxList();

  MovieController();

  Future<void> fetchLatestMovies() async {
    final dataState = await useCase.call(MovieParams(language: "US", page: 1));
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      movies.value = dataState.data!;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchLatestMovies();
  }
}
