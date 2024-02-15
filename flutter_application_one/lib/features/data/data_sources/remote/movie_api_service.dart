import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'movie_response.dart';

part 'movie_api_service.g.dart';

@RestApi()
abstract class MovieApiService {

  factory MovieApiService(Dio dio) {
    return _MovieApiService(dio);
  }

  @GET('/3/movie/popular')
  Future<HttpResponse<MovieResponse>> getLatestMovies(
    @Query("language") String ? language,
    @Query("page") int ? page 
  );
}
