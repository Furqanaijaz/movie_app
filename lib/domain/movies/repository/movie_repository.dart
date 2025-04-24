import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getMoviesTrailer(int movieId);
  Future<Either> getMoviesRecommendation(int movieId);
  Future<Either> getSimilarMovies(int movieId);
  Future<Either> searchMovies(String query);
}
