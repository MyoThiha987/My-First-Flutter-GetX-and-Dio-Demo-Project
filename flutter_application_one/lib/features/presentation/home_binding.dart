import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_one/features/data/data_sources/remote/interceptor/auth_interceptor.dart';
import 'package:flutter_application_one/features/data/repository_impl/movie_repositoryimpl.dart';
import 'package:flutter_application_one/features/domain/repository/movie_repository.dart';
import 'package:flutter_application_one/features/domain/usecases/delete_movie_usecase.dart';
import 'package:flutter_application_one/features/domain/usecases/get_saved_movies_usecase.dart';
import 'package:flutter_application_one/features/domain/usecases/movie_usecase.dart';
import 'package:flutter_application_one/features/domain/usecases/save_movie_usecase.dart';
import 'package:flutter_application_one/features/presentation/controllers/movie_controller.dart';
import 'package:flutter_application_one/features/presentation/controllers/save_movie_controller.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:hive/hive.dart';
import '../data/data_sources/local/movie_entity.dart';
import '../data/data_sources/remote/movie_api_service.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() async {
    final BaseOptions options = BaseOptions(
      baseUrl: 'https://api.themoviedb.org', // Replace with your API base URL
      connectTimeout: const Duration(
          milliseconds: 5000), // Use a Duration for the connectTimeout
      receiveTimeout: const Duration(
          milliseconds: 3000), // Use a Duration for the receiveTimeout
    );
    final Dio dio = Dio(options);
    dio.interceptors.add(AuthInterceptor(
        authToken:
            'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MWEzMWQzNWUwYTMyNzg1ZjJlNGM0NDk5ZjA0M2FlOCIsInN1YiI6IjVkYzM5NDBjOWQ4OTM5MDAxODM0YjVlZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Eve0FD4yriTnRWsCD0P2bTXplUlUObIIfs1Q5ChAdgc'));
    dio.interceptors.add(ChuckerDioInterceptor());
    Get.put(MovieApiService(dio));
    Get.put<MovieRepository>(MovieRepositoryImpl());
    Get.put(MovieUseCase());
    Get.put(SaveMovieUseCase());
    Get.put(DeletMovieUseCase());
    Get.put(GetSavedMovieUseCase());
    Get.put(MovieController());
    Get.put(SaveMovieController());
  }
}

void registerAdapter() {
  Hive.registerAdapter<MovieBox>(MovieBoxAdapter());
}

Future openBox() async {
  return Future.wait([
    Hive.openBox<MovieBox>("movies"),
  ]).then((value) {
    //after 6 second
  });
}
