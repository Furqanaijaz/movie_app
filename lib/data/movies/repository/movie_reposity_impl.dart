import 'package:dartz/dartz.dart';
import 'package:netfilx/core/helper/mapper/movie_mapper.dart';
import 'package:netfilx/core/helper/mapper/trailer_mapper.dart';
import 'package:netfilx/core/model/trailer.dart';
import 'package:netfilx/data/movies/models/movie.dart';
import 'package:netfilx/data/movies/source/movie_Api_service.dart';
import 'package:netfilx/domain/movies/repository/movie_repository.dart';
import 'package:netfilx/service_locator.dart';

class MovieReposityImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returndata = await sl<MovieApiService>().getTrendingMovies();
    return returndata.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    var returndata = await sl<MovieApiService>().getNowPlayingMovies();
    return returndata.fold((error) {
      return Left(error);
    }, (data) {
      var nowPlaying = List.from(data['content'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(nowPlaying);
    });
  }

  @override
  Future<Either> getMoviesTrailer(int movieId) async {
    var returnedData = await sl<MovieApiService>().getMoviesTrailer(movieId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      if (data == null || data['trailer'] == null) {
        return Left('No trailer data available'); // or handle it appropriately
      }

      var movies =
          TrailerMapper.toEntity(TrailerModel.fromJson(data['trailer']));
      return Right(movies);
    });
  }

  @override
  Future<Either> getMoviesRecommendation(int movieId) async {
    var returnedData =
        await sl<MovieApiService>().getMoviesRecommendation(movieId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async {
    var returnData = await sl<MovieApiService>().getSimilarMovies(movieId);
    return returnData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> searchMovies(String query) async {
    var returnData = await sl<MovieApiService>().searchMovies(query);
    return returnData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }
}
