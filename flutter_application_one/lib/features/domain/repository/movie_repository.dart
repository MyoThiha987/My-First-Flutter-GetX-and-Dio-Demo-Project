import 'package:flutter_application_one/features/core/resources/data_state.dart';
import 'package:flutter_application_one/features/domain/entities/movie.dart';

abstract class MovieRepository{
  Future<DataState<List<MovieEntity>>> getLatestMovies(String language,int page); 
  Future<List<MovieEntity>> getLocalMovieList();
  Future<void> deleteMovie(MovieEntity data);
  Future<void> saveMovie(MovieEntity data);
  }